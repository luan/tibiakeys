class CreateKeyAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :key_assignments do |t|
      t.string :key_sequence
      t.string :action_type
      t.string :action_object
      t.belongs_to :key_set, foreign_key: true

      t.timestamps
    end
  end
end
