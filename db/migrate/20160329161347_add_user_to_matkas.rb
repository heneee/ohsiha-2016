class AddUserToMatkas < ActiveRecord::Migration
  def change
    add_reference :matkas, :user, index: true
  end
end
