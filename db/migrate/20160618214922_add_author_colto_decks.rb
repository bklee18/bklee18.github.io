class AddAuthorColtoDecks < ActiveRecord::Migration
  def change
    add_reference :decks, :author, index: true
  end
end
