class Admin::UsersController < Admin::AdminController

  before_filter :find_user, :only => [:show, :edit, :update, :destroy]
  before_filter :load_roles, :only => [:new, :edit, :update]

  USERS_PER_PAGE = 20

  def index
    @users = User.paginate(:page => params[:page], :per_page => USERS_PER_PAGE)
    respond_to do |format|
      format.html
      format.xml  { render :xml => @users }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @user }
    end
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @user }
    end
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        flash[:success] = 'User was successfully created.'
        format.html { redirect_to admin_user_url(@user) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:success] = 'User was successfully updated.'
        format.html { redirect_to admin_user_url(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @user.destroy
        flash[:success] = 'User was successfully destroyed.'        
        format.html { redirect_to admin_users_path }
        format.xml  { head :ok }
      else
        flash[:error] = 'User could not be destroyed.'
        format.html { redirect_to admin_user_url(@user) }
        format.xml  { head :unprocessable_entity }
      end
    end
  end

  private

    def find_user
      @user = User.find(params[:id])
    end

    def load_roles
      @roles = Role.all
    end

end