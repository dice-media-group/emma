class CreateMeetups < ActiveRecord::Migration[6.0]
  def change
    create_table :meetups do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.text :more_info_url
      t.string :location

      t.timestamps
    end
  end
end
