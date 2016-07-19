class CreateAnswers < ActiveRecord::Migration
  def change
    create_table(:answers) do |t|
      t.column(:name, :string)
      t.column(:question_id, :integer)
    end
  end
end
