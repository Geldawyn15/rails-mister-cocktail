# frozen_string_literal: true

require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
img_url = 'https://www.thecocktaildb.com/images/ingredients/'

html_content = open(url).read
doc = JSON.parse(html_content)
ingredients = doc['drinks']
Ingredient.destroy_all

ingredients.each do |i|
  Ingredient.create!(
    name: i['strIngredient1'],
    image_url: "#{img_url}#{i['strIngredient1']}.png"
  )
end
