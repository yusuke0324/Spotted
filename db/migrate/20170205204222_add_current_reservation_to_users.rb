class AddCurrentReservationToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :current_reservation
  end
end
