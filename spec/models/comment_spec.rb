require 'spec_helper'

describe Comment do 
  it { should belong_to :user }
  it { should belong_to :commentable }
  it { should have_many :comments }
  it { should validate_presence_of :content }

	describe '#post' do 
	  it "should return the parent post" do 
		  @post = Post.create(url: 'http://example.come', title: "Example")
		  @comment1 = @post.comments.create(content: 'comment1')
		  @comment2 = @comment1.comments.create(content: 'comment2')
		  expect(@comment2.post).to eq @post
		  expect(@comment1.post).to eq @post
	  end
	end
end