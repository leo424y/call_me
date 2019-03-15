class CreateUxers < ActiveRecord::Migration[5.1]
  def change
    create_table :uxers do |t|
      t.string :uid
      t.string :pub
      t.string :last_time

      t.timestamps
    end
  end
end
