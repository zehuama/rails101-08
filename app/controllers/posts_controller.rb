class PostsController < ApplicationController
  before_action :find_group
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.group = @group
    if @post.save
      redirect_to group_path(@group), notice: "新增文章成功！"
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.group = @group
    if @post.update(post_params)
      redirect_to group_path(@group), notice: "修改文章成功！"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to group_path(@group), alert: "文章已删除"
  end

  private

  def find_group
    @group = Group.find(params[:group_id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
