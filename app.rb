require("bundler/setup")
require('pry')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  if (Ingredient.all() === []) then
  Ingredient.create({name: 'Burrito', fat: 10, calories: 300})
  Ingredient.create(name: 'Tacos', fat: 7.5, calories: 210)
  Ingredient.create(name: 'Salad', fat: 0, calories: 0)
  Ingredient.create(name: 'Burrito Bowl', fat: 0, calories: 0)
  Ingredient.create(name: 'Chicken', fat: 7, calories: 180)
  Ingredient.create(name: 'Steak', fat: 6.5, calories: 190)
  Ingredient.create(name: 'Carnitas', fat: 12, calories: 210)
  Ingredient.create(name: 'Barbacoa', fat: 7, calories: 165)
  Ingredient.create(name: 'Sofritas', fat: 10, calories: 145)
  Ingredient.create(name: 'White Rice', fat: 4, calories: 210)
  Ingredient.create(name: 'Brown Rice', fat: 5.5, calories: 210)
  Ingredient.create(name: 'Black Beans', fat: 1, calories: 210)
  Ingredient.create(name: 'Pinto Beans', fat: 1, calories: 115)
  Ingredient.create(name: 'Fajita Vegtables', fat: 0.5, calories: 20)
  Ingredient.create(name: 'Fresh Tomato Salsa', fat: 0, calories: 20)
  Ingredient.create(name: 'Roasted Chili Corn Salsa', fat: 1.5, calories: 80)
  Ingredient.create(name: 'Tomatillo Green Chili Salsa', fat: 0, calories: 15)
  Ingredient.create(name: 'Sour Cream', fat: 9.5, calories: 115)
  Ingredient.create(name: 'Cheese', fat: 7.5, calories: 100)
  Ingredient.create(name: 'Guacamole', fat: 22, calories: 230)
  Ingredient.create(name: 'Romaine Lettuce', fat: 0, calories: 10)
  Ingredient.create(name: 'Vinaigrette', fat: 25, calories: 270) end
  erb(:index)
end

get('/addicts/new') do
  erb(:addicts_form)
end

get('/addicts') do
  @addicts = Addict.all()
  erb(:addicts)
end

post('/addicts') do
  name = params.fetch('name')
  @addict = Addict.new({name: name})
  @addict.save()
  @addicts = Addict.all()
  erb(:addicts)
end

get('/addicts/:id') do
  @addict = Addict.find(params.fetch('id').to_i())
  erb(:addict_profile)
end

post('/add_relapse') do
  id = params.fetch('addict_id').to_i()
  @addict = Addict.find(id)
  new_relapse = params.fetch('date')
  addict_relapse = Relapse.new({:date => new_relapse, :item => "null"})
  @addict.relapses.push(addict_relapse)
  redirect('/addicts/' + @addict.id().to_s())
end

get('/addicts/:_id/relapse/:id') do
  addict_id = params.fetch('_id').to_i()
  @addict = Addict.find(addict_id)
  relapse_id = params.fetch('id').to_i()
  @relapse = Relapse.find(relapse_id)
  @all_ingredients = Ingredient.all()
  erb(:relapse)

end

post('/addicts/:id/relapse/') do
 @ingredient_ids = params.fetch('ingredients')
 @relapse = Relapse.find(params.fetch('id').to_i())
 @relapse.ingredients = []
 @ingredient_ids.each() do |ingredient_id|
  ingredient_id.to_i()
  ingredient = Ingredient.find(ingredient_id)
  @relapse.ingredients.push(ingredient)
  end
  @addict = Addict.find(params.fetch('id').to_i())
  @all_ingredients = Ingredient.all()
  erb(:relapse)
end



# method 1:
# addict_relapse = Relapse.create({:date => new_relapse, :addict_id => @addict.id})
#
# method 2:
# addict_relapse = Relapse.new({:date => new_relapse})
# @addict.relapses.push(addict_relapse)
#
# method 3:
# @addict.relapses.create({:date => new_relapse})
