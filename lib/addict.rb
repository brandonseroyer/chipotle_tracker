class Addict < ActiveRecord::Base
  has_many(:relapses)
  validates(:name, {:presence => true, :length => { :minimum => 1 }})
  before_save(:capitalize_name)

  private

  def capitalize_name
    self.name=(name().split.map {|i| i.capitalize }.join(' '))
  end
end
