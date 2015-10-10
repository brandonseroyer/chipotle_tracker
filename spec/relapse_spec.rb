require 'spec_helper'

describe Relapse do
  it {should belong_to(:addict)}

  it("saves a relapse") do
    test_relapse = Relapse.create({:date => '1/1/1', item: "null"})
    expect(Relapse.all()).to(eq([test_relapse]))
  end

  it("adds an ingredient to a relapse") do
    test_relapse = Relapse.create({:date => '1/1/1', :item => "null"})
    test_ingredient = Ingredient.new({name: "ketchup", fat: 4, calories: 10})
    test_relapse.ingredients.push(test_ingredient)
    expect(test_relapse.ingredients()).to(eq([test_ingredient]))
    expect(test_ingredient.relapses()).to(eq([test_relapse]))
  end

  it("returns total calories for all ingredients associated with this relapse") do
    test_relapse = Relapse.create({:date => '1/1/1', :item => "null"})
    test_ingredient = Ingredient.new({name: "ketchup", fat: 4, calories: 10})
    test_ingredient2 = Ingredient.new({name: "bread", fat: 4, calories: 20})
    test_relapse.ingredients.push(test_ingredient)
    test_relapse.ingredients.push(test_ingredient2)
    expect(test_relapse.calorie_total()).to(eq(30))
  end

  it("returns total fat for all ingredients associated with this relapse") do
    test_relapse = Relapse.create({:date => '1/1/1', :item => "null"})
    test_ingredient = Ingredient.new({name: "ketchup", fat: 4, calories: 10})
    test_ingredient2 = Ingredient.new({name: "bread", fat: 4, calories: 20})
    test_relapse.ingredients.push(test_ingredient)
    test_relapse.ingredients.push(test_ingredient2)
    expect(test_relapse.fat_total()).to(eq(8))
  end
end
