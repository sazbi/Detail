module ApplicationHelper

  def current_layout
    controller.send :_layout, ["layout"]
  end

  def active? path
    "active" if current_page? path
  end

  def active_store? path
    if params[:store_id] == path.to_s
      "nav-item active"
    else
      "nav-item"
    end
  end
  

  def status_style status
    case status
    when "approved"
      "badge badge-pill badge-info"
    when "rejected"
      "badge badge-pill badge-danger"
    when "paid"
      "badge badge-pill badge-success"
    else
      "badge badge-pill badge-primary"      
    end
  end

  def nav_items user
    stores = []
    user.stores.each do |store|
      stores.push(
        {
          store_id: store.id,
          name: store.name
        }
      )
    end
    stores
  end
  

  def nav_bar_links user
    nav_links = ''
    nav_items(user).each do |item|
      nav_links << "<li class='#{active_store? item[:store_id]}'>#{link_to item[:name], {store_id: item[:store_id]}, class: 'nav-link'}</li>"
    end
    nav_links.html_safe 
  end
  
  

  def current_payweek
    start_of_week = Date.today.beginning_of_week(:sunday)
    end_of_week = Date.today.end_of_week(:sunday) + 1.week
    days_left = (end_of_week - Date.today).to_i
    { start: start_of_week.strftime("From: %m/%d/%Y"), end: end_of_week.strftime("Until: %m/%d/%Y"), days_left: days_left }   
  end

  def previous_week_link(start_date, end_date, store)
    start_date = start_date - 14
    end_date = end_date - 14 
    link_to "Period Starting #{start_date}", request.params.merge({ store_id: store, start_date: start_date, end_date: end_date }), class: "btn btn-dark btn-sm"   
  end

  def next_week_link(start_date, end_date, store)
    start_date = start_date + 14
    end_date = end_date + 14
    link_to "Period Starting #{start_date}", request.params.merge({ store_id: store, start_date: start_date, end_date: end_date }), class: "btn btn-dark btn-sm"
  end

  def active_tab?(status)
    if params[:status].present?
      "active" if params[:status] == status
    else
      "active" if status == "submitted"
    end
  end
  

  def status_tab(status, count, badge)
    link_to "#{status.humanize} <span class='badge badge-#{badge}'>#{count}</span>".html_safe, request.params.merge({ status: status }), class: "nav-link #{active_tab?(status)}"
  end

  def list_services(posts)
    list = {}
    posts.each do |p|
      list.merge(p.service_list)
    end
    list
  end
  def all_paid?(submit, approved, store_id)
    if approved == 0 || submit != 0
      "<button class='btn btn-secondary' disabled>Run Payroll</button>".html_safe
    else
      link_to "Run Payroll", admin_send_payroll_path(format: "csv", status: "paid", store_id: store_id, start_date: sort_start, end_date: sort_end), class: 'btn btn-primary'
    end
  end
  
  

  
  
  
  
  
end
