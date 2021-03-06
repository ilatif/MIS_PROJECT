class CreateEmailGroups < ActiveRecord::Migration
  def self.up
    create_table :email_groups do |t|
      t.string  :name
      t.text    :description
      t.string  :email_subject
      t.text    :email_format

      t.timestamps
    end
  end

  def self.down
    drop_table :email_groups
  end
end
