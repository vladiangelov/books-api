class CreateAuthorbooks < ActiveRecord::Migration[5.2]
  def change
    create_table :authorbooks do |t|
      t.references :book, foreign_key: true
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
