class AddRecipientToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :recipient, :string
    add_column :bookings, :instructions, :text
  end
end
