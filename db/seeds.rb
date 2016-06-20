def create_deck(deck_length, questions, answers, name, description, author)
  deck = Deck.create!(name: name, description: description, author: author)
  index = 0
  deck_length.times do
    Card.create!(deck: deck, question: questions[index], correct_answer: answers[index])
    index += 1
  end
end

author = User.create!(username: "admin", password: "password", email: "admin@email.com")

questions_test = [
              "What's Brian's favorite color?",
              "What's Jeffrey's favorite color?",
              "What's Brian's favorite hairstyle on a girl?",
              "What's Brian's favorite hairstyle on a guy?",
              "Does money in Brian's wallet? (Yes/No)",
              "Brian getting a girlfriend: 'stretch goal' or 'in progress'?"
              ]

answers_test = [
              "Green",
              "Hot Pink",
              "Straight",
              "Brandon's",
              "No",
              "IN PROGRESS"
              ]

pan_question = [
              "Has Pan solved Sudoku using only HTML? True/True",
              "What branch does Pan push to?",
              "How does Pan prepare for work in the morning?",
              "Is Pan a robot?",
              "Does money in Brian's wallet? (No/No)",
              "Pan has won Iron Chef using only what cooking utensil?",
              "What's Pan's favorite vegetable?",
              "Since Pan doesn't make mistakes, what color scheme does he code in? (Hint: He doesn't make mistakes)",
              "What's Pan's favorite word?"
              ]

pan_answer = [
              "True",
              "Master",
              "Pan doesn't need to prepare. He's always ready",
              "Yes",
              "No",
              "Pan",
              "Eggpans",
              "Black/Black",
              "Pantastic"
              ]

r_question = [
              "Who are Iullia's favorite students?",
              "What's Iullia's favorite type of food?",
              "Where is from Iullia from?"
            ]

r_answer = [
              "Brandon and Brian",
              "We don't know",
              "Earth"
          ]

description_b = "A deck about the life of Brian"
description_p = "A flash card deck about Pan FACTS"
description_i = "Iullia trivia"
create_deck(questions_test.length, questions_test, answers_test, "Brian", description_b, author)
create_deck(pan_question.length, pan_question, pan_answer, "Pan", description_p, author)
create_deck(r_question.length, r_question, r_answer, "Iullia", description_i, author)
