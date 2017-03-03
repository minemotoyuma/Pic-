require 'rails_helper'

RSpec.describe Tweet, :type => :model do
  
  it "is valid with text, image and user_id" do
    tweet = Tweet.new(
      text: 'nice',
      image: 'https://tech-master.s3.amazonaws.com/uploads/curriculums/images/Rails1-4/sample.jpg',
      user_id: '1')
    expect(tweet).to be_valid
  end
end
