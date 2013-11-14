require 'spec_helper'

describe User do
  it { should validate_presence_of :name }  
  it { should validate_presence_of :email }
  it { should have_many :comments }
  it { should have_many :posts }
  it { should have_many :votes }
  it { should validate_uniqueness_of :email }
end
