class Store < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_and_belongs_to_many :users
  validates_presence_of :name
  has_many :services, dependent: :destroy
end
