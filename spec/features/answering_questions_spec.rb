require "rails_helper"

RSpec.describe "Answering questions" do
  scenario "Viewing a question" do
    question = Question.create
    allow(Question).to receive(:new).and_return(question)

    visit(root_path)

    expect(page).to have_text(question.question)
    expect(page).to have_button(question.correct_answer)
    question.answers.each { |answer| expect(page).to have_button(answer) }
  end

  scenario "answering a question correctly" do
    question = Question.create
    allow(Question).to receive(:new).and_return(question)

    visit(root_path)
    click_on(question.correct_answer)

    expect(page).to have_text("Correct!")
    expect(page).to have_text(question.character.romaji)
    expect(page).to have_text(question.character.hiragana)
    expect(page).to have_text(question.character.katakana)
  end

  scenario "answering a question incorrectly" do
    question = Question.create
    allow(Question).to receive(:new).and_return(question)

    visit(root_path)
    click_on((question.answers - [question.correct_answer]).first)

    expect(page).to have_text("Not Quite!")
    expect(page).to have_text(question.character.romaji)
    expect(page).to have_text(question.character.hiragana)
    expect(page).to have_text(question.character.katakana)
  end

  scenario "Playing again" do
    question_a = Question.create
    question_b = Question.create
    allow(Question).to receive(:new).and_return(question_a, question_b)

    visit(root_path)
    click_on(question_a.correct_answer)
    click_on("Next Question")

    expect(page).to have_text(question_b.question)
    expect(page).to have_button(question_b.correct_answer)
    question_b.answers.each { |answer| expect(page).to have_button(answer) }
  end

  scenario "Playing multiple times" do
    question = Question.create
    allow(Question).to receive(:new).and_return(question)

    visit(root_path)
    click_on(question.correct_answer)

    expect(page).to have_text("1")
    expect(page).to have_text("100%")

    click_on("Next Question")
    click_on(question.correct_answer)

    expect(page).to have_text("2")
    expect(page).to have_text("100%")

    click_on("Next Question")
    click_on((question.answers - [question.correct_answer]).first)

    expect(page).to have_text("3")
    expect(page).to have_text("67%")

    click_on("Next Question")
    click_on((question.answers - [question.correct_answer]).first)

    expect(page).to have_text("4")
    expect(page).to have_text("50%")
  end

  scenario "Refreshing the question result page" do
    question = Question.create
    allow(Question).to receive(:new).and_return(question)

    visit(root_path)
    click_on(question.correct_answer)
    click_on("Next Question")
    click_on(question.correct_answer)

    expect(page).to have_text("2")
    expect(page).to have_text("100%")

    # refreshing the result page should not count as a further attempt
    visit(current_url)

    expect(page).to have_text("2")
    expect(page).to have_text("100%")
  end
end
