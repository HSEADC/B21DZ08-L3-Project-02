class UsersController < ApplicationController
  before_action :authenticate_user!

  def follow
    @user = User.find(params[:id])
    current_user.followships.create(followee: @user)
    redirect_to @user.profile, notice: 'Вы успешно подписались на пользователя.'
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.followships.find_by(followee: @user).destroy
    redirect_to @user.profile, notice: 'Вы успешно отписались от пользователя.'
  end
end