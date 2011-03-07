class Admin::UsersController < Admin::AdminController
  #filter_resource_access
  before_filter :find_user, :only => [:edit, :update, :destroy]
  before_filter :require_user, :only => [:index, :edit, :update, :destroy]
  before_filter :require_no_user, :only => [:new, :create]
  filter_access_to :all
  filter_access_to :edit, :attribute_check => true

  def index
    @users = User.all
  end 

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @role = Role.find_by_name("member")
    @user.role = @role
    if verify_recaptcha() and @user.save
      flash[:notice] = "Registration Successful."
      redirect_to root_url
    else
      flash[:error] = "There was a problem with your submission"
      render :action => 'new'
    end
  end

  def edit
    #@user = current_user
  end

  def update
    #@user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end

private 
  def self.get_users
    return User.find(:all, :order => :username ) 
  end

  def find_user
    if defined?(params[:id]) and params[:id] != '' and params[:id] != "current"
      @user = User.find(params[:id])
    else
      @user = current_user
    end


  end

end
