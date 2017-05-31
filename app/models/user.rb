class User < ApplicationRecord
  has_many :proposals, class_name: :proposals, foreign_key: :requestor_id
  has_many :experiments, class_name: :proposals, foreign_key: :experimentor_id
  has_secure_password
end
