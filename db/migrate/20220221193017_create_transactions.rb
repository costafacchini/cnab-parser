class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.datetime :emitted_at
      t.decimal :value
      t.string :cpf
      t.string :card
      t.integer :kind, null: false, default: 0
      t.references :store, null: true, index: true, foreign_key: { on_delete: :restrict }

      t.timestamps
    end
  end
end
