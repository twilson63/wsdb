module WsDb
  
  class Domain < Sequel::Model
    include WsDb::TimeStamps
    
    one_to_many :posts
  end
  
end