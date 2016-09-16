require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  context "if current user logged in" do
    before do
      user_params = { email: 'tom@tom.com' }
      post :create, user: user_params
    end

    it "shows existing user" do
      get :show
      response.should be_success
    end
  end

  context "if no current user" do
    it "shows registration page" do
      get :new
      response.should be_success
    end
  end

  xcontext "creating a new user" do

    it "redirects to users path with notice on successful registered" do
      User.stub!(:new) {mock_model('User', :save => true)}
      post :create

      flash[:notice].should_not be_nil
      response.should redirect_to(user_path)
    end

    it "re-renders new template on failed registration" do
      User.stub!(:new) {mock_model('User', :save => false)}
      post :create

      flash[:notice].should be_nil
      response.should render_template('new')
    end
  end

  xcontext "destroying a user" do
    it "destroys the user" do
      expect{
        delete :destroy, :id => @user, :user => {:password => @user.password}
        }.to change(User, :count).by(-1)
      end

      it "redirects to new user path" do
        response.should redirect_to(new_user_path)
      end

      it "displays flash notice" do
        delete :destroy, :id => 1
        flash[:notice].should_not be_nil
      end

      it "re-renders new template on failed registration" do
        User.stub!(:new) {mock_model('User', :save => false)}
        post :create

        flash[:notice].should be_nil
        response.should render_template('new')
      end
    end

  end
