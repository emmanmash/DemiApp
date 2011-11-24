class StSupervisorsController < ApplicationController
  def index
    list
    render :action => 'list'
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
    if @st_supervisors.save
      flash[:notice] = 'StSupervisors was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
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

  def destroy
    StSupervisors.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
