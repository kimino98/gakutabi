class AddEventToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :event_id, :integer
  end
end
