class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.string :url
      t.text :title
      t.text :body
      t.datetime :date

      t.timestamps
    end
  end
end
