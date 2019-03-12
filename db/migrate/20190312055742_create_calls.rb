class CreateCalls < ActiveRecord::Migration[5.1]
  def change
    create_table :calls do |t|
      t.string :num
      t.string :stamp
      t.string :content
      t.string :audio

      t.timestamps
    end
  end
end
