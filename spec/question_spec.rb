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
end
