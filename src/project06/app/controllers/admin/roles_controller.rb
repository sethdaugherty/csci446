class Admin::RolesController < Admin::AdminController

  before_filter :find_role, :only => [:show, :edit, :update, :destroy]

  helper_method :num_users

  def index
    @roles = Role.all
  end

  def show
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(params[:role])
    if @role.save
      flash[:notice] = "Successfully created roles."
      redirect_to [:admin, @role]
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @role.update_attributes(params[:role])
      flash[:notice] = "Successfully updated roles."
      redirect_to [:admin, @role]
    else
      render :action => 'edit'
    end
  end

  def destroy
    @role.destroy
    flash[:notice] = "Successfully destroyed roles."
    redirect_to admin_roles_url
  end

  # Get an array of all the roles in alphabetical order
  def self.get_roles
    return Role.find(:all, :order => "name")
  end

  def num_users(role)
    return User.count(:conditions => ["role_id = ?", role.id]) 
  end

  private 
  
    def find_role
      @role = Role.find(params[:id])
    end
end
