require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WsDb::Domain do
  before(:each) do
    [WsDb::Domain].each do |klass|
      klass.delete
    end
    @valid_attributes = {
      :name => 'Reminders', 
      :url => 'reminders.jackhq.com'
    }
  end
  
  it "should create account with key and timestamps" do
    acct = WsDb::Domain.create(@valid_attributes)

    acct[:created_at].should_not be_nil
    acct[:updated_at].should_not be_nil    
  end
  
  it "should locate account by key" do
    acct = WsDb::Domain.create(@valid_attributes)
    url = acct[:url]
    
    WsDb::Domain.where(:url => url).first[:url].should == url
  end

end