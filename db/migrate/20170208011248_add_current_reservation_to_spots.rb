class AddCurrentReservationToSpots < ActiveRecord::Migration[5.0]
  def change
    add_reference :spots, :current_reservation
  end
end
