class AddUserIdReference < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.column :user_app_id, :string
      t.index :user_app_id, unique: true, name: 'uix_users_user_app_id'
    end
  end
end
