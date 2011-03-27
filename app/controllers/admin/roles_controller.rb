class Admin::RolesController < Admin::AdminController

  before_filter :find_role, :only => [:show, :edit, :update, :destroy]

  ROLES_PER_PAGE = 20

  def create
    @role = Role.new(params[:role])
    respond_to do |format|
      if @role.save
        flash[:success] = 'Role was successfully created.'
        format.html { redirect_to admin_role_url(@role) }
        format.xml  { render :xml => @role, :status => :created, :location => @role }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @role.destroy
        flash[:success] = 'Role was successfully destroyed.'        
        format.html { redirect_to admin_roles_url }
        format.xml  { head :ok }
      else
        flash[:error] = 'Role could not be destroyed.'
        format.html { redirect_to admin_role_url(@role) }
        format.xml  { head :unprocessable_entity }
      end
    end
  end

  def index
    @roles = Role.paginate(:page => params[:page], :per_page => ROLES_PER_PAGE)
    respond_to do |format|
      format.html
      format.xml  { render :xml => @roles }
    end
  end

  def edit
  end

  def new
    @role = Role.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @role }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @role }
    end
  end

  def update
    respond_to do |format|
      if @role.update_attributes(params[:role])
        flash[:success] = 'Role was successfully updated.'
        format.html { redirect_to admin_role_url(@role) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
    end
  end

  private

    def find_role
      @role = Role.find(params[:id])
    end
  
end
