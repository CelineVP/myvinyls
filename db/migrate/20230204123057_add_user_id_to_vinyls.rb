class AddUserIdToVinyls < ActiveRecord::Migration[7.0]
  def change
    add_column :vinyls, :user_id, :integer
  end
end
