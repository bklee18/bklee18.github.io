def create_deck(deck_length, questions, answers, name)
  deck = Deck.create!(name: name)
  index = 0
  deck_length.times do
    Card.create!(deck_id: deck.id, question: questions[index], correct_answer: answers[index])
    index += 1
  end
end

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

pan_question = [
              "Has Pan solved Sudoku using only HTML? True/True",
              "What branch does Pan push to?",
              "How does Pan prepare for work in the morning?",
              "Is Pan a robot?",
              "Does money in Brian's wallet? (No/No)",
              "Pan has won Iron Chef using only what cooking utensil?",
              "What's Pan's favorite vegetable?",
              "Since Pan doesn't make mistakes, what color scheme does he code in? (Hint: He doesn't make mistakes)"
              ]

pan_answer = [
              "True",
              "Master",
              "Pan doesn't need to prepare. He's always ready",
              "Yes",
              "No",
              ".slice",
              "Eggpans",
              "Black/Black"
              ]

create_deck(questions_test.length, questions_test, answers_test, "Brian")
create_deck(pan_question.length, pan_question, pan_answer, "Pan")
