class Proposal < ApplicationRecord
  belongs_to :requestor, class_name: :User
  belongs_to :experimentor, class_name: :User
  has_many :users

  def experimentor
    User.find(experimentor_id)
  end

  def experimentor=(experimentor)
    experimentor_id = experimentor.id
  end
end
