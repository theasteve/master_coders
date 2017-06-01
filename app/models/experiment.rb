class Experiment < ApplicationRecord
  belongs_to :proposal
  # has_many :procedures
  has_many :observations, as :observable
  validates :name, :description, presence: true
end
