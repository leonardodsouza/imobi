class CreateSituacoes < ActiveRecord::Migration[5.1]
  def change
    create_table :situacoes do |t|
      t.string :nome

      t.timestamps
    end
  end
end
