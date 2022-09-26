class Admin::UsersController< Admin::BaseController
  before_action :find_user, only: %i[show edit update,destroy]

  def index
  	@users = User.where('user_type != "Admin"')
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: 'Project was successfully destroyed'
  end  

  private

  def user_params
    params.require(:user).permit(:email, :name, :user_type, :availability)
  end

  def find_user
    @user= User.find(params[:id])
  end

end
