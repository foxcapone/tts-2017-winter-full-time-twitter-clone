class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: [:show, :edit, :update]

  def index
    @tweets = Tweet.all
  end

  def show

  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'You just tweeted.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit

  end

  def update
    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: 'Your tweet was updated'
    else
      render :edit
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:message, :user_id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

end
