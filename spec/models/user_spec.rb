require 'spec_helper'

describe User do
  before(:each) do
    @user = Factory.create(:user)
  end
  
  describe "with no role" do
    it 'should have no roles' do
      @user.roles.should == []
    end
  end
  
  describe "with a single role" do
    before(:each) do
      @user.roles = ['attendee']
    end

    it 'can assign one role' do
      @user.roles.should == ['attendee']
    end

    it 'determines if the user has a role' do
      @user.has_role?('attendee').should be_true
    end
  end
  
  describe 'with multiple roles' do
    before(:each) do
      @user.roles = ['attendee', 'speaker']
    end
    
    it 'can assign multiple roles' do
      @user.roles.should have(2).roles
      @user.roles.should include('attendee')
      @user.roles.should include('speaker')
    end
    
    it 'determines if the user has the role' do
      @user.has_role?('attendee').should be_true
      @user.has_role?('speaker').should be_true
    end
  end
end