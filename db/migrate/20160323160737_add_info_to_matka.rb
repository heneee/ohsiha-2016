class AddInfoToMatka < ActiveRecord::Migration
  def change
    add_column :matkas, :info, :string
  end
end
