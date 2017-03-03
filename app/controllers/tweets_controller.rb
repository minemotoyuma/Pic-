class TweetsController < ApplicationController
    before_action :move_to_index, except: :index
    def index
      @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(5)
      #includes:SQLの発行回数を減らす
    end

    def new
    end

    def create
      Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
    end

    def destroy
      tweet = Tweet.find(params[:id])
      tweet.destroy if tweet.user_id == current_user.id
    end

    def edit
      @tweet = Tweet.find(params[:id])
    end

    def update
      tweet = Tweet.find(params[:id])
      if tweet.user_id == current_user.id
         tweet.update(tweet_params) #current_user.idである必要がないから
      end
    end

    def show
      @tweet = Tweet.find(params[:id])
      @comments = @tweet.comments.includes(:user)
    end

    def search
      @users = User.where('nickname LIKE(?)', "%#{params[:keyword]}%")
    end
    private
    def tweet_params
      params.permit(:image, :text)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
      end
  end
