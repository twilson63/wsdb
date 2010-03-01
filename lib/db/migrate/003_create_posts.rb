class CreatePosts < Sequel::Migration
  def up
    create_table(:posts) do
      primary_key :id
      foreign_key :account_id
      foreign_key :domain_id
      timestamp :created_at
      timestamp :updated_at       
    end
  end
  def down
    drop_table(:posts)
  end  
end