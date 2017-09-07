class CreateVisitantes < ActiveRecord::Migration[5.1]
  def change
    create_table :visitantes do |t|
      t.string :nome
      t.string :email

      t.timestamps
    end
  end
end
