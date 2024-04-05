class CreateContactUsForms < ActiveRecord::Migration[7.1]
  def change
    create_table :contact_us_forms do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :service
      t.string :subject
      t.text :message

      t.timestamps
    end
  end
end
