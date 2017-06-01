class User < ApplicationRecord
  has_many :proposals, class_name: "Proposal", foreign_key: :requestor_id
  has_many :experiments, through: :proposals, foreign_key: :experimentor_id
  has_secure_password

  validates :username, :password, {:presence => true}
end
