class ChangeIntegerLimitInEntries < ActiveRecord::Migration[5.2]
  def change
    change_column(:entries, :phone, :integer, limit: 8)
  end
end
