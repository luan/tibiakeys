class CreateKeySets < ActiveRecord::Migration[5.0]
  def change
    create_table :key_sets do |t|
      t.string :name
      t.belongs_to :vocation, foreign_key: true

      t.timestamps
    end
  end
end
