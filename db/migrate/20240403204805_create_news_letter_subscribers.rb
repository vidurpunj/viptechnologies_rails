class CreateNewsLetterSubscribers < ActiveRecord::Migration[7.1]
  def change
    create_table :news_letter_subscribers do |t|
      t.string :email

      t.timestamps
    end
  end
end
