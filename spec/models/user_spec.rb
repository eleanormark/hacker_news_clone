require 'spec_helper'

describe User do
  it { should validate_presence_of :name }  
  it { should validate_presence_of :email }
  it { should have_many :comments }
  it { should have_many :posts }
  it { should have_many :votes }
  
  it 'validates uniqueness of email' do
    user = User.create!(:password => 'whatever', :password_confirmation => 'whatever', :email => 'hi@dot.com', :name => 'hi')
    user.should validate_uniqueness_of :email
  end
end