require"spec_helper"

describe(Answer) do
  it "validates presence of answers" do
    answer = Answer.new({:answer1 => "", :answer2 => "", :answer3 => "", :answer4 => ""})
    expect(answer.save()).to(eq(false))
  end
  it("ensures the length of answer is at most 30 characters") do
    answer = Answer.new({:answer1 => "a".*(31), :answer2 => "a".*(31), :answer3 => "a".*(31), :answer4 => "a".*(31)})
    expect(answer.save()).to(eq(false))
  end
end
