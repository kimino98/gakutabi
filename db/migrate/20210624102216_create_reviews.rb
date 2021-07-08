class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string  :faclity_name,     null: false
      t.integer :hotel_type_id,    null: false
      t.integer :grade_id,         null: false
      t.integer :season_id,        null: false
      t.integer :region_id,        null: false
      t.integer :student_count_id, null: false
      t.integer :price,            null: false
      t.text    :text,             null: false
      t.text    :safety,           null: false
      t.references :user,          foreign_key: true

      t.timestamps
    end
  end
end
