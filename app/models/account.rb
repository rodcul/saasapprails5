class Account < ApplicationRecord
  include Friendlyable
  resourcify
  has_many :users
  validates :name, presence: true
end
