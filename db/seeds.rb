require 'rest-client'
require 'json'

response = RestClient.get('http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list')
reponse_json = JSON.parse(response)

reponse_json['drinks'].each do |drink|
  ingredient = drink['strIngredient1']
  Ingredient.create!(name: ingredient)
end
