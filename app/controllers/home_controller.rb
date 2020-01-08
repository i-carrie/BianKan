class HomeController < ApplicationController
  def index
    topic = Topic.all
    @topic = topic.where(flag: 1).order('created_at DESC')
    @topic_none = topic.where(flag: 2)
  end
end
