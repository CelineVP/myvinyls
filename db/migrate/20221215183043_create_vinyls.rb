class CreateVinyls < ActiveRecord::Migration[7.0]
  def change
    create_table :vinyls do |t|
      t.string :album
      t.string :artist
      t.string :commentaire
      t.timestamps
    end
  end
end
