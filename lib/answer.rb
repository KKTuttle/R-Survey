class Answer < ActiveRecord::Base
  belongs_to(:question)
  validates(:answer1, :answer2, :answer3, :answer4, {:presence => true, :length => {:maximum => 30}})
end
