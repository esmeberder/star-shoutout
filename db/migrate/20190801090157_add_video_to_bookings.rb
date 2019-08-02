class AddVideoToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :video, :string
  end
end
