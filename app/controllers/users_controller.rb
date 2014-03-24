class UsersController < ApplicationController

 before_filter :authenticate, :only => [:edit, :update, :take_rendez_vous]

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
    if @user.update_attributes(user_params)
      flash[:success] = "Profil actualisé."
      redirect_to @user
    else
      @titre = "Édition profil"
      render 'edit'
    end
  end

  def take_rendez_vous
    @user = current_user
    @time_slot = TimeSlot.find(params[:time_slot_id])
    @user.rdvs.create time_slot: @time_slot
    @doctor = @time_slot.doctor
    @time_slot.update_attributes taken: 1
    flash['notice'] = "Vous avez bien pris le rendez vous avec le doctor #{@doctor.name} #{Time.at(@time_slot.start).strftime "le %a %d %b %Y à %H:%M"}"
    redirect_to user_path(@user)
  end

 private

  def authenticate
    deny_access unless signed_in?
  end
end
