class CreateDestaques < ActiveRecord::Migration[5.1]
  def change
    create_table :destaques do |t|
      t.string :titulo
      t.string :legenda
      t.string :url

      t.timestamps
    end
  end
end
