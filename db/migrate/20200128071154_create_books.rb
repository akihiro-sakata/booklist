class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|

      t.string :category
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
