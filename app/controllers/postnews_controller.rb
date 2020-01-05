class PostnewsController < ApplicationController

  def index
    topic = Topic.all
    @topic = topic.where(flag: 1).order('created_at DESC')
  end

end
