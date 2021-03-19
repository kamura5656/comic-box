class CreateBoxes < ActiveRecord::Migration[6.0]
  def change
    create_table :boxes do |t|
      t.references  :user, foreugn_key: true
      t.references  :comic, foreugn_key: true

      t.timestamps
    end
  end
end
