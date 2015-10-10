class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many :relapses
  validates(:name, {:presence => true, :length => { :minimum => 1 }})
  before_save(:capitalize_name)

  private

  def capitalize_name
    self.name=(name().split.map {|i| i.capitalize }.join(' '))
  end
end
