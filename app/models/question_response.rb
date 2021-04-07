class QuestionResponse
  def initialize(correct:)
    @correct = correct == "true"
  end

  def correct?
    @correct
  end

  def text
    if correct?
      "Correct!"
    else
      "Not Quite!"
    end
  end

  def body_class
    if correct?
      "bg-green-500"
    else
      "bg-red-500"
    end
  end
end
