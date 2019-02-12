module Admin
  class DashboardController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin
    
    def index
      @stores = Store.all
      
    end

    def update_status
      @posts = Post.find(params[:post_ids])
      @posts.each do |p|
        p.update!(status: params[:status])      
      end
      redirect_back fallback_location: admin_path      
    end

    def send_payroll
      @users = User.store_member(params[:store_id])
      @posts = Post.where(date: sort_start..sort_end, store_id: params[:store_id], status: 'approved')
      if @posts != nil
        @posts.update_all(status: 'paid')
        PayrollMailer.payroll_email(@users, sort_start, sort_end, current_user).deliver
        @updated = Post.where(date: sort_start..sort_end, store_id: params[:store_id], status: 'paid')
        send_data @updated.to_csv, filename: "Payroll-run-#{@updated.first.store.name}-#{Date.today}.csv"
      end
    end

    
    
    

    private
    def store_params
      params.permit(:store_id, :start_date, :end_date)
    end
  end
end