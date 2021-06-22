class CreateSightseeingPlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :sightseeing_places do |t|

      t.timestamps
    end
  end
end
