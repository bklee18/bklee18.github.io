deck_info = {name: 'Brian'}
Deck.create!(deck_info)

questions_test = [
              "What's Brian's favorite color?",
              "What's Jeffrey's favorite color?",
              "What's Brian's favorite hairstyle on a girl?",
              "What's Brian's favorite hairstyle on a guy?",
              "Does money in Brian's wallet? (Yes/No)"
              ]

answers_test = [
              "Pink",
              "Hot Pink",
              "Long",
              "Brandon's",
              "No"
              ]

index = 0
5.times do
  Card.create!(deck_id: 1, question: questions_test[index], correct_answer: answers_test[index])
  index += 1
end
