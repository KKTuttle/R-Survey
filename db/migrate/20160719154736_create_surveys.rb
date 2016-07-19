class CreateSurveys < ActiveRecord::Migration
  def change
    create_table(:surveys) do |t|
      t.column(:title, :string)
    end
    add_column(:questions, :survey_id, :integer)
  end
end
