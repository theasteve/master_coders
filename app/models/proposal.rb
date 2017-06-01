class Proposal < ApplicationRecord
  belongs_to :requestor, class_name: :User
  has_one :experimentor, class_name: :User
  has_many :users
  has_one :experiment

  def experimentor
    User.find_by_id(experimentor_id)
  end

  def experimentor=(experimentor)
    experimentor_id = experimentor.id
  end
end
