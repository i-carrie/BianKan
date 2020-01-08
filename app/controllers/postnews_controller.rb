class PostnewsController < ApplicationController

  # before_action :move_to_index, except: :index
  before_action :move_to_index

  def index
    topic = Topic.all
    @topic = topic.where(flag: 1).order('created_at DESC')
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.create(info: create_params[:info], subject: create_params[:subject], flag: 1)
    if @topic.save
      flash[:notice] = "送信しました"
      redirect_to(postnews_index_path)    
    else
      render(new_postnews_path)
    end
  end

  def show
    @topic = Topic.find_by(id: params[:id])
  end

  def edit
    @topic = Topic.find_by(id: params[:id])
  end

  def update
    topic = Topic.find_by(id: params[:id])
    if topic.update(create_params)
      flash[:notice] = "更新しました"
      redirect_to(postnews_index_path)
     else
      # redirect_to(postnews_index_path)
      redirect_to(edit_postnews_path(topic.id))
      flash[:notice] = "更新できませんでした。やりなおしてください"
    end
  end

  def destroy
    topic = Topic.find_by(id: params[:id])
    topic.destroy
    flash[:notice] = "削除しました"
    redirect_to(postnews_index_path)
  end

  private
  def create_params
    params.permit(:info, :subject)
  end

  def move_to_index
    if user_signed_in? == false || current_user.login_type == 2
      redirect_to  root_path
    end
  end

end
