class CreateAccounts < Sequel::Migration
  def up
    create_table(:accounts) do
      primary_key :id
      String :key, :unique => true
      String :email
      String :phone
      String :company      
      String :status
      timestamp :created_at
      timestamp :updated_at
       
    end
  end
  def down
    drop_table(:accounts)
  end  
end