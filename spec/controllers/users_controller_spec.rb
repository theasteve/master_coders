require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  # Faculty user
  let!(:faculty) { User.create!(username: "test1", password_digest: "1234", role: "Faculty") }
  # Staff user
  let!(:labtech) { User.create!(username: "test2", password_digest: "1234", role: "Staff") }

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

  describe "POST #create" do
    context "when valid params are passed" do
      it "creates a new user in the database" do
        num_users = User.count
        new_user = User.create!(username: "test3", password_digest: "1234", role: "Faculty")
        expect(User.count).to eq(num_users + 1)
      end

      it "assigns the newly created user as @user" do
        post :create, { user: { username: "test3" } }
        expect(assigns(:user)).to be_a_kind_of(User)
      end

      it "redirects to the root" do
        post :create, { user: { username: "test3" } }
        expect(response).to have_http_status(:success)
      end
    end

    context "when invalid params are passed" do
      it "does not create a new user in the database" do
        num_users = User.count
        post :create, { user: { username: "" } }
        expect(User.count).to eq num_users
      end

      it "assigns the unsaved user as @user" do
        post :create, { user: { username: "" } }
        expect(User.all).not_to include(:user)
      end

      it "renders the :new template" do
        post :create, { user: { username: "" } }
        expect(response).to render_template(:new)
      end
    end
  end

end
