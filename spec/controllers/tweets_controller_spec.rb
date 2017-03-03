require 'rails_helper'

RSpec.describe TweetsController, :type => :controller do
  render_views
  before(:each) do
    @tweets = Tweet.includes(:user).order("created_at DESC")
  end

  describe '#show'
    # let(:request) { get :index }
    it 'ステータスコード200を返し、indexをrenderする' do
      
      response.status.should == 200

    end

    it '登録されたtweetを返す' do

      assigns(:tweets).should eq(@tweet)
    end
  end
