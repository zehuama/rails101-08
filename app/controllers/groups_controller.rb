class GroupsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
    @posts = @group.posts
  end

  def edit
    @group = Group.find(params[:id])
    @group.user = current_user
  end

  def update
    @group = Group.find(params[:id])
    @group.user = current_user
    if @group.update(group_params)
      redirect_to groups_path, notice: "修改讨论版成功"
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.user = current_user
    @group.destroy
    redirect_to groups_path, alert: "delete seccess"
  end

  private

  def group_params
    params.require(:group).permit(:title, :description)
  end
end
