class User < ApplicationRecord
  has_many :proposals, class_name: "Proposal", foreign_key: :requestor_id
  has_many :experiments, class_name: "Proposal", foreign_key: :experimentor_id
  has_secure_password
end
