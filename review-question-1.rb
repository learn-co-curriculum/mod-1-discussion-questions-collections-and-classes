## QUESTION 1

pokemon_collection = [
  {
    "id": 1,
    "name": "bulbasaur",
    "base_experience": 64,
    "height": 7,
    "is_default": true,
    "order": 1,
    "weight": 69,
    "abilities": [
        {
            "is_hidden": true,
            "slot": 3,
            "ability": {
                "name": "chlorophyll",
                "url": "http://pokeapi.co/api/v2/ability/34/"
            }
        }
    ]
},
{
  "id": 3,
  "name": "venesaur",
  "base_experience": 50,
  "height": 10,
  "is_default": true,
  "order": 1,
  "weight": 90,
  "abilities": [
      {
          "is_hidden": true,
          "slot": 3,
          "ability": {
              "name": "fire",
              "url": "http://pokeapi.co/api/v2/ability/38/"
          }
      }
  ]
},
{
  "id": 2,
  "name": "pikachu",
  "base_experience": 60,
  "height": 4,
  "is_default": true,
  "order": 1,
  "weight": 37,
  "abilities": [
      {
          "is_hidden": true,
          "slot": 3,
          "ability": {
              "name": "lightning",
              "url": "http://pokeapi.co/api/v2/ability/30/"
          }
      }
  ]
}
]


#1 How would you get the url for Bulbasaur's ability? √
#2 How would you return the first pokemon with base experience over 40? √
#3 How would you return ALL OF THE pokemon with base experience over 40? (Gotta catch em all) √
#4 How would you return an array of all of the pokemon's names? √
#5 How would you determine whether or not the pokemon array contained any pokemon with a weight greater than 60? √
#6  whatever method you use should return true if there are any such pokemon, false if not. √

#Solutions
#1:
def get_pokemons_ability(name, pokemon_collection)
  pokemon_array = pokemon_collection.select{ |pokemon| pokemon.has_value?(name)}

   pokemon_hash = pokemon_array.each do |pokemon|
     pokemon.has_key?(:abilities)
      pokemon[:abilities].each do |ability|
       ability.dig(:ability, :url)
         end
      end
end

 get_pokemons_ability("bulbasaur", pokemon_collection)

 #2:
 def get_pokemon_experiece_over_forty(pokemon_collection)
   pokemon_collection.find { |pokemon|
     if pokemon[:base_experience] > 40
        pokemon
     end
   }
 end

 get_pokemon_experiece_over_forty(pokemon_collection)

#3:
 def all_pokemons_experiece_over_forty(pokemon_collection)
   pokemon_collection.collect { |pokemon|
     if pokemon[:base_experience] > 40
         pokemon
     end
   }
 end

all_pokemons_experiece_over_forty(pokemon_collection)

#4:
def get_pokemons_names(pokemon_collection)
   pokemon_collection.collect { |pokemon|
     pokemon[:name]
  }
end

 get_pokemons_names(pokemon_collection)

#5
def get_pokemon_weight_over_sixty(pokemon_collection)
   pokemon_collection.each { |pokemon|
      pokemon[:weight] unless pokemon[:weight] < 60
    }
end

get_pokemon_weight_over_sixty(pokemon_collection)

def is_pokemon?(name, pokemon_collection)
 names = get_pokemons_names(pokemon_collection)
  p names.include?(name)

end

is_pokemon?("pikachu", pokemon_collection)
