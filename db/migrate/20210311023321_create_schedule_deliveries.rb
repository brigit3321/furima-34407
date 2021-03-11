class CreateScheduleDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :schedule_deliveries do |t|

      t.timestamps
    end
  end
end
