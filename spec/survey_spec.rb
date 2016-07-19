require"spec_helper"

describe(Survey) do
  describe("#capitalize_title") do
    it "capitalize first letter" do
      survey = Survey.create({:title => "new survey"})
      expect(survey.title()).to(eq("New survey"))
    end
  end

  it("validates presence of title") do
    survey = Survey.new({:title => ""})
    expect(survey.save()).to(eq(false))
  end

  it("ensures the length of title is at most 50 characters") do
    survey = Survey.new({:title => "a".*(51)})
    expect(survey.save()).to(eq(false))
  end

  describe("#questions") do
    it "tells which questions are in the survey" do
      test_survey = Survey.create({:title => "New Survey"})
      question1 = Question.create({:description => "How are you?", :survey_id => test_survey.id})
      question2 = Question.create({:description => "How Old Are You?", :survey_id => test_survey.id})
    expect(test_survey.questions()).to(eq([question1, question2]))
    end
  end
end
