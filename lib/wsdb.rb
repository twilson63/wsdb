# Turn into rack middleware

# use Rack::WsDb 
require 'rack'
require 'sequel'
require 'sequel/extensions/migration'
require 'validatable'

DB = Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://wsdb.db')

require File.dirname(__FILE__) + '/mixins/timestamps'
require File.dirname(__FILE__) + '/models/account'
require File.dirname(__FILE__) + '/models/domain'
require File.dirname(__FILE__) + '/models/post'

module WsDb  
  
  use Rack::Auth::Basic do |username, password|
    acct = Account.where(:key => username).first
    domain = Domain.where(:url => @app_url).first
    Post.create(:account_id => acct[:id], :domain_id => domain[:id])
    
  end
  
  
  def self.create_tables!
    Sequel::Migrator.apply(DB, File.join(File.dirname(__FILE__), 'db','migrate'))
  end
    
  
end
