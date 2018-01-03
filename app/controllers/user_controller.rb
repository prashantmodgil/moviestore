class MoviesController < ApplicationController
   before_action :authenticate_admin_user!,only: [:create]

  def created
    @user = User.new(user_params)
      if @user.save
        redirect_to 'http://localhost:3000/admin/users', notice: "New User created"
      else
        redirect_to new_admin_user_path
      end

      private
        def user_params
          params.require(:user).permit( :name, :email, :password,:image, :password_confirmation)
        end

 end
