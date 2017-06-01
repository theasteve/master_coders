require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  # Faculty user
  let!(:faculty) { User.create!(username: "lana2", password_digest: "1234", role: "Faculty") }
  # Staff user
  let!(:labtech) { User.create!(username: "lana3", password_digest: "1234", role: "Staff") }

  describe "GET #new" do
    it "assigns a new user to @user" do
      get :new
      expect(assigns(:user)).to be_a_new User
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

end
