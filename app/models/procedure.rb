class Procedure < ApplicationRecord
  belongs_to :experiment
  has_many :observations, as: :observable

  validates :title, :steps, :experiment_id, presence: true

end
