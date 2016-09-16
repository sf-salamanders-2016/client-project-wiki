require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST #create' do


    context 'when email does not exist' do
      it 'flashes error and renders users/new template' do
        post :create, session: { email: 'nonexistent@test.com' }

        expect(response).to render_template("users/new")
        expect(flash[:error]).to match('Email does not exist, try again.')
      end
    end

    context 'when email and password are valid' do
      it 'flashes notice and renders users/show template' do
        user = User.create(email: 'test@test.com', password: 'anything')
        post :create, session: { email: 'test@test.com', password: 'anything' }

        expect(response).to redirect_to user_url(@user)
        expect(flash[:notice]).to match('You are logged in. Welcome!')
      end
    end

    context 'when password is invalid' do
      it 'flashes error and renders users/new template' do
        user = User.create(email: 'test@test.com', password: 'anything')
        post :create, session: { email: user.email, password: 'notcorrect' }
        expect(response).to render_template('users/new')
        expect(flash[:error]).to match('Password is incorrect, try again.')
      end
    end

  end
end
