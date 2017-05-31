class Proposal < ApplicationRecord
  belongs_to :requestor, class_name: :User
  belongs_to :experimentor, class_name: :User
  has_many :users 
end
