class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy, :make_admin]
  before_action :require_user, only: [:edit, :update]
  before_action :require_admin, only: [:index, :destroy, :make_admin]
  
  def index
    @users = User.all
    @user = User.new
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      
      flash[:success] = "Cadastro realizado com sucesso!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @users = User.all
    render :index
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Dados atualizados com sucesso!"
      redirect_to root_path
    else
      render 'edit' 
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "Usuário excluido com sucesso!"
    redirect_to root_path
  end

  def make_admin
    @user.update(admin: !@user.admin?)
    msg = @user.admin? ? "Usuário promovido a administrador!" : "Permissão de administrador removida!"
    redirect_to users_path, notice: msg
  end

end

private

def user_params
  if current_user&.admin?
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  else
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

def set_user
  @user = User.find(params[:id])
end

def require_user
  unless current_user
    flash[:danger] = "Você precisa estar logado para acessar essa página."
    redirect_to login_path
  end
end

def require_admin
  unless current_user&.admin?
    flash[:danger] = "Acesso restrito a administradores."
    redirect_to root_path
  end
end
