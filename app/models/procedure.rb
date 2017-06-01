class Procedure < ApplicationRecord
  belongs_to :experiment

  validates :title, :steps, :experiment_id, presence: true
  
end
