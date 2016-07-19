class Survey < ActiveRecord::Base
  has_many(:questions)
  validates(:title, {:presence => true, :length => {:maximum => 50}})
  before_save(:capitalize_title)

private
  define_method(:capitalize_title) do
    self.title = (title().capitalize())
  end

end
