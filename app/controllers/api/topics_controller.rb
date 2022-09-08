class Api::TopicsController < ApplicationController
  before_action :set_sub
  before_action :set_topic, only: [:show, :update, :destroy]
  def index
    render json: @sub.topics
  end

  def show
    # @topic = @sub.topics.find(params[:id])
    render json: @topic
  end

  def create
    # @topic = @sub.topics.new(topic_params)
    if @topic.save
      render json: @topic
    else
      render json: { errors: @topic.errors }, status: unprocessable_entity
  end

  def update
    # @topic = @sub.topics.find(params[:id])
  if @topic.update(topic_params)
    render json: @topic
  else
    render json: { errors: @topic.errors }, status: :unprocessable_entity
  end
end

  def destroy
    # @topic = @sub.topics.find(params[:id])
  @topic.destroy
  render json: { message: 'topic deleted' }
  end


  private

    def set_sub
      @sub = Sub.find(params[:sub_id])
    end  
    
    def set_topic
      @topic = @sub.topics.find(params[:id])
    end

  def topic_params
    params.require(:topic).permit(:topic, :body)
  end
end
