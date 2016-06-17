class CreateGameTable < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string   :question
      t.string   :correct_answer
    end
  end
end
