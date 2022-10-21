class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @pets = user.pets
    @posts = user.posts
  end
end
