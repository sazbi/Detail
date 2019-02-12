class Post < ApplicationRecord
  enum status: [:submitted, :approved, :rejected, :paid]
  belongs_to :user
  belongs_to :store
  has_and_belongs_to_many :services, dependent: :destroy
  validates_presence_of :stk_num, :service_ids, :date

  scope :user_submitted, ->(user, start_date, end_date) { where(:user_id => user.id, :status => "submitted", :date => start_date..end_date)}
  scope :user_rejected, ->(user, start_date, end_date) { where(:user_id => user.id, :status => "rejected", :date => start_date..end_date)}
  scope :user_approved, ->(user, start_date, end_date) { where(:user_id => user.id, :status => "approved", :date => start_date..end_date)}
  scope :user_paid, ->(user, start_date, end_date) { where(:user_id => user.id, :status => "paid", :date => start_date..end_date)}
  scope :store_submitted, ->(store_id, start_date, end_date) { where(:store_id => store_id, :status => "submitted", :date => start_date..end_date)}
  scope :store_rejected, ->(store_id, start_date, end_date) { where(:store_id => store_id, :status => "rejected", :date => start_date..end_date)}
  scope :store_approved, ->(store_id, start_date, end_date) { where(:store_id => store_id, :status => "approved", :date => start_date..end_date)}
  scope :store_paid, ->(store_id, start_date, end_date) { where(:store_id => store_id, :status => "paid", :date => start_date..end_date)}
  scope :current_view, ->(store_id, status, start_date, end_date) { where(:store_id => store_id, :status => status, :date => start_date..end_date)}
  scope :user_posts, ->(user, start_date, end_date) { where(:user_id => user, :date => start_date..end_date) }
  # Ex:- scope :active, -> {where(:active => true)}


  def pay_calc
    time = []
    self.services.each do |s|
      time.push(s.pay_time)
    end
    time.sum
  end

  def self.to_csv
    attributes = %w{dms_id full_name date status stk_num total_pay}
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |post|
        csv << [post.user.dms_id, post.user.full_name, post.date, post.status, post.stk_num, post.pay_calc]
      end
    end
  end
  

  def service_list
    hash = {}
    self.services.each do |s|
      hash["#{s.service_name}"] = s.pay_time
    end
    hash
  end
  




  
  
  

end
