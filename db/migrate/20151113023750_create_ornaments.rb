class CreateOrnaments < ActiveRecord::Migration
  def change
    create_table :ornaments do |t|
      t.references :user, index: true, foreign_key: true
      t.string :description

      t.timestamps null: false
    end
  end
end
