require 'spec_helper'

describe Post do
  it "has a valid factory" do
    FactoryGirl.create(:post).should be_valid
  end
  it "is invalid without a post title" do
    FactoryGirl.build(:post, title: nil).should_not be_valid
  end
  it "is invalid without a type of post" do
    FactoryGirl.build(:post, type_of_post: nil).should_not be_valid
  end
  it "is invalid without a category" do
    FactoryGirl.build(:post, category_id: nil).should_not be_valid
  end
  it "is invalid if type of post is 1 and link is empty" do
    FactoryGirl.build(:post, type_of_post: 1, url: nil).should_not be_valid
  end
  it "is invalid if type of post is 2 and body is empty" do
    FactoryGirl.build(:post, type_of_post: 2, body: nil).should_not be_valid
  end
end