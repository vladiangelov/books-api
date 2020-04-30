class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.datetime :published_date
      t.text :short_description
      t.text :long_description
      t.string :thumbnail_url

      t.timestamps
    end
  end
end
