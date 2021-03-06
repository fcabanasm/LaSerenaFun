class UsersController < ApplicationController
  before_action :authenticate_admin!, only: [:index,:show]

  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @hash = Gmaps4rails.build_markers(@user) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end
end