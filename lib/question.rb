class Question < ActiveRecord::Base
  belongs_to(:survey)
  has_many(:answers)
  validates(:description, {:presence => true, :length => {:maximum => 99}})

end
