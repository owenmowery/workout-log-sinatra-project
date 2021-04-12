class CreateJournalEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :journal_entries do |t|
      t.string :string
      t.string :body
      t.datetime :date 
      t.integer :user_id
    end
  end
end
