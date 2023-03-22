class UsersController < ApplicationController
  def unsubscribe
    response = user_service.unsubscribe(user_id: params[:id])

    status = response[:success] ? :success : :failure
    flash[status] = response[:message]
  end

  private
  def user_service
    @user_service ||= UserService.new
  end
end
