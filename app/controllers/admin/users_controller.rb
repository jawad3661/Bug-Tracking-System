class Admin::UsersController< Admin::BaseController
  def index
  	@users = User.where('user_type != "Admin"')
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: "Project was successfully destroyed." }
    end
  end  


  private
  def user_params
    params.require(:user).permit(:email, :name, :user_type, :availability)
  end

end