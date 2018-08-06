class AddNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :type
      t.string :title
      t.boolean :is_completed
      t.jsonb :data, default: {}
      t.timestamps
    end

    add_index :notes, :data, using: :gin
  end
end
