class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :user_id
      t.integer :page_id
      t.text :first_answer
      t.text :second_answer
      t.string :image
      t.timestamps
    end
  end
end
