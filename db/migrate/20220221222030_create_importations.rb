class CreateImportations < ActiveRecord::Migration[7.0]
  def change
    create_table :importations do |t|
      t.string :content

      t.timestamps
    end
  end
end
