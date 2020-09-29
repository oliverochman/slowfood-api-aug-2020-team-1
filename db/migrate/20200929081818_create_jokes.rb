class CreateJokes < ActiveRecord::Migration[6.0]
  def change
    create_table :jokes do |t|
      t.string :joke3_id
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
