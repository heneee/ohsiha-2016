class RemoveUserFromMatkas < ActiveRecord::Migration
  def change
    remove_reference :matkas, :user, index: true
  end
end
