require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Wsdb" do
  before(:each) do
    [WsDb::Account].each do |klass|
      klass.delete
    end
    
  end
  
  it "should connect to db" do
    DB.should be_true
  end
  
  it "should migrate tables" do
    WsDb.create_tables!
  end
  
  it "should have 3 tables" do
    DB.tables.count.should == 4
  end  
    
end
