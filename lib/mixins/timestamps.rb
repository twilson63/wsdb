module WsDb
  module TimeStamps
    
    def before_create  
      @values[:created_at] = Time.now
      @values[:updated_at] = Time.now
      super
    end

    def before_save  
      @values[:updated_at] = Time.now
      super
    end
  end

end