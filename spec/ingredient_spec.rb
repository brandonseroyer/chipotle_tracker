require 'spec_helper'

describe Ingredient do

  it("validates presence of name") do
    ingredient = Ingredient.new({:name => ''})
    expect(ingredient.save()).to(eq(false))
  end

  it("ensures the length of name is at least 1 character long") do
    ingredient = Ingredient.new({:name => ''.*(1)})
    expect(ingredient.save()).to(eq(false))
  end

  it("capitalize the name") do
    ingredient = Ingredient.create({:name => "guacamole"})
    expect(ingredient.name()).to(eq("Guacamole"))
  end

#   it("creates customized order") do
#     test_order = Ingredient.create([])
#     expect(test_order.toppings).to(eq([]))
#   end
end
