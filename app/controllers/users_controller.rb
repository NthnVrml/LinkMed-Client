class UsersController < ApplicationController

 before_filter :authenticate, :only => [:edit, :update]

  def user_params
    params.require(:user).permit(:nom, :prenom, :email, :password, :salt, :encrypted_password)
  end

  def show
	@user = User.find(params[:id])
	@titre = @user.nom
  end

  def new
  	@user = User.new
  	@titre = "Inscription"
  end

  def edit
    @user = User.find(params[:id])
    @titre = "Édition profil"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Traite un succès d'enregistrement.
      sign_in @user
      flash[:success] = "Bienvenue dans l'Application Exemple!"
      redirect_to @user
    else
      @titre = "Inscription"
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profil actualisé."
      redirect_to @user
    else
      @titre = "Édition profil"
      render 'edit'
    end
  end

   private

    def authenticate
      deny_access unless signed_in?
    end
end
