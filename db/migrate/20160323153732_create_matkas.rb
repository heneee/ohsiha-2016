class CreateMatkas < ActiveRecord::Migration
  def change
    create_table :matkas do |t|
      t.string :mista
      t.string :mihin
      t.string :kulkuneuvo
      t.date :lahto
      t.date :paluu
      t.text :matkaseurue
      t.text :lisatietoja

      t.timestamps
    end
  end
end
