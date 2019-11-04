class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :subject
      t.text :info, null: false
      t.integer :flag
      t.datetime :startperiod
      t.datetime :endperiod
      t.timestamps
    end
  end
end
