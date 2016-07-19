class AddNamesToAnswers < ActiveRecord::Migration
  def change
    add_column(:answers, :answer1, :string)
    add_column(:answers, :answer2, :string)
    add_column(:answers, :answer3, :string)
    add_column(:answers, :answer4, :string)
    remove_column(:answers, :name, :string)
  end
end
