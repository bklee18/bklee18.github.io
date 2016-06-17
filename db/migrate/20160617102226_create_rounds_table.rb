class CreateRoundsTable < ActiveRecord::Migration
  def change
    create_table   :rounds do |t|
      t.references :user, index: true, :name => 'user_id_ix'
      t.references :deck, index: true, :name => 'deck_id_ix'

      t.timestamps(null: false)
    end
  end
end
