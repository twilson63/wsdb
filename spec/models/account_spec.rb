require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WsDb::Account do
  before(:each) do
    [WsDb::Account].each do |klass|
      klass.delete
    end
  end
  
  it "should create account with key and timestamps" do
    acct = WsDb::Account.create(
      :company => 'Jack Russell Software', 
      :email => 'tom@jackhq.com',
      :phone => '843-606-0637')

    acct[:created_at].should_not be_nil
    acct[:updated_at].should_not be_nil    
    acct[:key].should_not be_nil
    acct[:status].should_not be_nil
  end
  
  it "should locate account by key" do
    acct = WsDb::Account.create(
      :company => 'Jack Russell Software', 
      :email => 'tom@jackhq.com',
      :phone => '843-606-0637')
    key = acct[:key]
    
    WsDb::Account.where(:key => key).first[:key].should == key
  end

end