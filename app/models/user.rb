class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  validates_presence_of :first_name, :last_name
  has_many :posts, dependent: :destroy
  has_and_belongs_to_many :stores, dependent: :destroy
  enum status: [:active, :disabled]


  def self.to_csv
    attributes = %w{dms_id full_name store}
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << [user.dms_id, user.full_name, user.stores.first.name]
      end
    end
  end
   


  def full_name
    first_name + " " + last_name
  end

  def self.store_member(store_ids)
    includes(:stores).where(stores: { id: store_ids })
  end

  def total_paid(start_date, end_date)
    total = []
    self.posts.where(status: "paid", date: start_date..end_date).each do |t|
      total.push(t.pay_calc)
    end
    total.sum
  end
  

  def totals(start_date, end_date)
    total = []
    self.posts.where(date: start_date..end_date, status: 'paid').each do |t|
      total.push(t.pay_calc)
    end
    total.sum
  end

  def paid_list(start_date, end_date)
    list = []
    self.posts.where(date: start_date..end_date, status: 'paid').each do |item|
      list.push(item.stk_num)
    end
    list
  end
  
  
  
  
  
end
