class RemoveInfoFromMatka < ActiveRecord::Migration
  def change
    remove_column :matkas, :info, :string
  end
end
