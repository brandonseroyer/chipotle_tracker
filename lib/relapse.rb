require('pry')

class Relapse < ActiveRecord::Base
  belongs_to :addict
  has_and_belongs_to_many :ingredients
  validates(:item, {:presence => true, :length => { :minimum => 1 }})
  before_save(:capitalize_item)

  define_method(:calorie_total) do
    sum = 0
    self.ingredients.each do |ingredient|
      sum += ingredient.calories
    end
    return sum
  end

  define_method(:fat_total) do
    sum = 0
    self.ingredients.each do |ingredient|
      sum += ingredient.fat
    end
    return sum
  end







private

  def capitalize_item
    self.item=(item().split.map {|i| i.capitalize }.join(' '))
  end
end
