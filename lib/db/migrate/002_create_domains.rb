class CreateDomains < Sequel::Migration
  def up
    create_table(:domains) do
      primary_key :id
      String :name, :unique => true
      String :url, :unique => true
      timestamp :created_at
      timestamp :updated_at
       
    end
  end
  def down
    drop_table(:domains)
  end  
end