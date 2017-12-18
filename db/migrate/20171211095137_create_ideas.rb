class CreateIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :ideas do |t|
      t.string :idea_title
      t.text :idea_descripition
      t.string :idea_attachment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
