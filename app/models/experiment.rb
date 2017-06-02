class Experiment < ApplicationRecord
  belongs_to :proposal

  has_many :observations, as: :observable

  has_many :procedures

  validates :name, :description, presence: true
end
