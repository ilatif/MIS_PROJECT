class CreateProcessorTypes < ActiveRecord::Migration
  def self.up
    create_table :processor_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :processor_types
  end
end
