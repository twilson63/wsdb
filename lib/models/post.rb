module WsDb
  
  class Post < Sequel::Model
    include WsDb::TimeStamps
    include Validatable
    
    validates_presence_of :account_id, :domain_id
    many_to_one :account
    many_to_one :domain
    
  end
  
end