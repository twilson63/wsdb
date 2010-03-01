require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WsDb::Post do
  before(:each) do
    [WsDb::Account, WsDb::Domain, WsDb::Post].each do |klass|
      klass.delete
    end
    @acct = WsDb::Account.create(
      :company => 'Jack Russell Software', 
      :email => 'tom@jackhq.com',
      :phone => '843-606-0637')
    @domain = WsDb::Domain.create(
      :name => 'Reminders', 
      :url => 'reminders.jackhq.com'    
    )
    @valid_attributes = {
      :account_id => @acct[:id],
      :domain_id => @domain[:id]
    }
  end
  
  it "should not create without account" do
    lambda { WsDb::Post.create(
      :domain_id => @domain[:id]
    ) }.should raise_error
    
  end
  
  it "should not create without domain" do
    lambda { WsDb::Post.create(
      :account_id => @acct[:id]
    ) }.should raise_error
    
  end
  
  it "should create with account, domain, and timestamps" do
    post = WsDb::Post.create(@valid_attributes)
    post.account.should_not be_nil
    post.domain.should_not be_nil    

    post[:created_at].should_not be_nil
    post[:updated_at].should_not be_nil    
  end
  
  it "should posts by domain" do
    post = WsDb::Post.create(@valid_attributes)
    domain = post.domain
    
    WsDb::Post.where(:domain_id => domain[:id]).all.count.should == 1
  end
  
  it "should posts by account" do
    post = WsDb::Post.create(@valid_attributes)
    acct = post.account
    
    WsDb::Post.where(:account_id => acct[:id]).all.count.should == 1
  end
  

  it "should posts by account and domain" do
    post = WsDb::Post.create(@valid_attributes)
    acct = post.account
    domain = post.domain
    
    WsDb::Post.where(:domain_id => domain[:id], :account_id => acct[:id]).all.count.should == 1
  end

end