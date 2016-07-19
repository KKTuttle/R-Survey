require"spec_helper"

describe(Survey) do
  describe("#capitalize_title") do
    it "capitalize first letter" do
      survey = Survey.create({:title => "new survey"})
      expect(survey.title()).to(eq("New survey"))
    end
  end
end
