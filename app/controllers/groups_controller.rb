class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end
  def new
    @group = Group.new
  end
  def show
    @group = Group.find(params[:id])
    
  end
  def edit
    @group = Group.find(params[:id])
  end
  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.update
      redirect_to groups_path, notice: "Update Success!"
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
      flash[:alert] = "Deleted successful!"
    redirect_to groups_path
  end
def group_params

end
end
