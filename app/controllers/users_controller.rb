class UsersController < ApplicationController
  def new
  	@user = User.new
  	@titre = "Inscription"
  end
end
