class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :service_code
      t.string :service_name
      t.text :description
      t.boolean :metadata
      t.string :type
      t.text :keywords
      t.string :group
      t.integer :jurisdiction_id

      t.timestamps null: false
    end
  end
end
