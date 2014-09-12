class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
      t.references  :user
      t.string      :auth_key
      t.text        :auth_data
      t.timestamps
    end

    add_index :credentials, :user_id
  end
end
