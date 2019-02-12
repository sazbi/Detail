class Service < ApplicationRecord
  has_and_belongs_to_many :posts, dependent: :destroy
  validates_presence_of :service_name, :pay_time
  belongs_to :store
  
end
