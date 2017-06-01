require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  # Faculty user
  let!(:faculty) { User.create!(username: "lana2", password_digest: "1234", role: "Faculty") }
  # Staff user
  let!(:labtech) { User.create!(username: "lana3", password_digest: "1234", role: "Staff") }

end
