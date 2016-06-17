class CreateCardsTable < ActiveRecord::Migration
  def change
    create_table   :cards do |t|
      t.references :deck, index: true, :name => 'deck_id_ix'
      t.string     :question, null: false
      t.string     :correct_answer, null: false

      t.timestamps(null: false)
    end
  end
end
