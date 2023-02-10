class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @prototype = @user.prototypes
    @name = @user.name
    @profile = @user.profile
    @occupation = @user.occupation
    @position = @user.position
  end

end
