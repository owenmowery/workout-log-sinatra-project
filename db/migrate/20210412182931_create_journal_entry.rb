class CreateJournalEntry < ActiveRecord::Migration[5.2]
  def change
    create_table :journals do |t|
      t.string :title
      t.string :body
      t.datetime :date 
      t.integer :user_id
    end
  end
end
