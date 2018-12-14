
require_relative("../models/pet")
require_relative("../models/owner")
require("pry-byebug")

Pet.delete_all
Owner.delete_all

owner_1 = Owner.new({
  'first_name' => 'elsie',
  'last_name' => 'button',
  'telephone_number' => 4405545})
owner_1.save

owner_2 = Owner.new({
    'first_name' => 'george',
    'last_name' => 'glass',
    'telephone_number' => 6666666})
owner_2.save

pet_1 = Pet.new({
  'name' => 'morticia',
  'age' => 2,
  'type' => 'cat',
  'ready' => 'yes',
  'owner_id' => nil})
pet_1.save

pet_2 = Pet.new({
    'name' => 'zero',
    'age' => 1,
    'type' => 'dog',
    'ready' => 'no',
    'owner_id' => owner_1.id})
pet_2.save

pet_3 = Pet.new({
      'name' => 'medusa',
      'age' => 10,
      'type' => 'snake',
      'ready' => 'yes',
      'owner_id' => nil})
pet_3.save

pet_4 = Pet.new({
      'name' => 'egbert',
      'age' => 100,
      'type' => 'tortoise',
      'ready' => 'yes',
      'owner_id' => nil})
pet_4.save

binding.pry
nil
