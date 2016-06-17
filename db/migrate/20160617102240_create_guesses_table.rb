class CreateGuessesTable < ActiveRecord::Migration
  def change
    create_table   :guesses do |t|
      t.references :round, index: true, :name => 'round_id_ix'
      t.references :card, index: true, :name => 'card_id_ix'
      t.references :user, index: true, :name => 'user_id_ix'
      t.boolean    :correct

      t.timestamps(null: false)
    end
  end
end
