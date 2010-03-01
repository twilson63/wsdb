require 'uuidtools'

module WsDb
  
  class Account < Sequel::Model
    include WsDb::TimeStamps
    
    one_to_many :posts
  
    def before_create  
      @values[:created_at] = Time.now
      @values[:updated_at] = Time.now
      @values[:key] = UUIDTools::UUID.random_create.to_s
      @values[:status] = 'active'
      super
    end
  
  end
  
end
