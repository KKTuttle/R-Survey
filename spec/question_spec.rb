require"spec_helper"

describe(Question) do
  it "validates presence of description" do
    question = Question.new({:description => ""})
    expect(question.save()).to(eq(false))
  end
  it("ensures the length of description is at most 99 characters") do
    question = Question.new({:description => "a".*(100)})
    expect(question.save()).to(eq(false))
  end

  describe("#answers") do
    it "tells which answers are in the question" do
      test_question = Question.create({:description => "How are you?"})
      answer1 = Answer.create({:answer1 => "great", :answer2 => "good?", :answer3 => "ok", :answer4 => "bad", :question_id => test_question.id()})
    expect(test_question.answers()).to(eq([answer1]))
    end
  end
end
