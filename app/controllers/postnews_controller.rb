class PostnewsController < ApplicationController

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
      flash[:notice] = "送信完了しました"
      redirect_to(postnews_index_path)    
    else
      render(new_postnews_path)
    end
  end

  private
  def create_params
    params.permit(:info, :subject)
  end


end
