class UsersController < ApplicationController
	get '/' do
		@title = 'All Users'

		erb :main_layout do
			@users = User.all
			erb :"users/index"
		end
	end

	get '/new' do
		erb :"users/new"
	end

	post '/' do
		User.create(email: params[:email], first_name: params[:first_name], last_name: params[:last_name], password: params[:password], password_confirmation: params[:password_confirmation])
		redirect "/"
	end

	get '/:id' do
		@user = User.find(params[:id])
		erb :"users/show"
	end

	get '/:id/edit' do
		@user = User.find(params[:id])
		erb :"users/edit"
	end

	patch '/:id' do
		user = User.find(params[:id])
		user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
		redirect "/users"
	end

	delete '/:id' do
		user = User.find(params[:id])
		user.destroy
		redirect "/users"
	end
end