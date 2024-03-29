class StSupervisorsController < ApplicationController
  def index
  end

 def authenticate
 if request.get?
render :action=> 'index'
else
	@st_supervisors  = st_supervisors .new(params[:st_supervisors]s)
valid_user =  @st_supervisors .check_login
if valid_user
	session[:user_id]=valid_user.id
flash[:note]="Welcome "+valid_user.user_name
redirect_to(:controller=>'tale',:action => 'list')
else
flash[:notice] = "Invalid User/Password"
redirect_to :action=> 'index'
end
end
end

def check_authentic_user
unless session[:user_id]
flash[:notice] = "Please log in"
redirect_to(:controller => "user", :action =>
"index")
end
end
  
  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @st_supervisors_pages, @st_supervisors = paginate :st_supervisors, :per_page => 10
  end

  def show
    @st_supervisors = StSupervisors.find(params[:id])
  end

  def new
    @st_supervisors = StSupervisors.new
  end

  def create
   @st_supervisors = StSupervisors.new(params[:st_supervisors])
   @role=Role.find(:all, :conditions=>"name='Guest'")
   @st_supervisors.role_id=@role.id
    if @st_supervisors.save
      flash[:notice] = 'StSupervisors was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end
  
def assign
@st_supervisors= User.find(params[:id])
if @st_supervisors.upadate_attribute :role_id,params[:role]
flash[:notice] = 'User was successfully assigned the role.'
redirect_to :action => 'list'
else
flash[:notice] =
'Role could not be assigned to the selected user.'
render :action=>'display_assign'
end
end

  def edit
    @st_supervisors = StSupervisors.find(params[:id])
  end

  def update
    @st_supervisors = StSupervisors.find(params[:id])
    if @st_supervisors.update_attributes(params[:st_supervisors])
      flash[:notice] = 'StSupervisors was successfully updated.'
      redirect_to :action => 'show', :id => @st_supervisors
    else
      render :action => 'edit'
    end
  end

  def display_assign
  	  @st_supervisors = st_supervisors.find(:all)
@roles = Role.find(:all)
end
  
  
  def destroy
    StSupervisors.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
