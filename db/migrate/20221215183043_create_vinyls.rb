class CreateVinyls < ActiveRecord::Migration[7.0]
  def change
    create_table :vinyls do |t|

      t.timestamps
    end
  end
end
