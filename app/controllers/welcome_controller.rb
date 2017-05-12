class WelcomeController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  skip_before_action :check_app_auth

  def index
  end

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember])
      if (@user.role_users.present?)
        if (@user.role_users.first.role.name == 'admin')
          redirect_back_or_to(users_path, notice: 'Вход выполнен Мой господин! Удачной работы!')
        else
          redirect_back_or_to(root_path, notice: 'Вход выполнен Удачи!')
        end
      else
        redirect_back_or_to(root_path, notice: 'Вход выполнен')
      end
    else
      flash[:danger] = "Неверный #{User.human_attribute_name(:email).mb_chars.downcase} или
#{User.human_attribute_name(:password).mb_chars.downcase} или подтвердите email"
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'Сеанс работы в системе завершен')
  end

  def insufficient_privileges
    @current_user_object = current_user
    @current_user_login = @current_user_object.email
    @current_role_user = RoleUser.where(id: params['bad_user_role']).first
  end
end
