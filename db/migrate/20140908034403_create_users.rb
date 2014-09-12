class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :auth_key
      t.timestamps
    end

    add_index :users, :auth_key
  end
end
