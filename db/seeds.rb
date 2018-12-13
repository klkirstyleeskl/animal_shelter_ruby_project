
require_relative("../models/pet")
require_relative("../models/owner")
require_relative("../models/adoption")
# Pet.delete_all
# Owner.delete_all

owner_1 = Owner.new({
  'first_name' => 'elsie',
  'last_name' => 'button',
  'number_of_pets' => '2',
  'telephone_number' => 4405545})
  owner_1.save

owner_2 = Owner.new({
    'first_name' => 'george',
    'last_name' => 'glass',
    'number_of_pets' => '0',
    'telephone_number' => 6666666})
owner_2.save

pet_1 = Pet.new({
  'name' => 'morticia',
  'age' => 2,
  'type' => 'cat',
  'ready' => 'yes'})
pet_1.save

pet_2 = Pet.new({
    'name' => 'zero',
    'age' => 1,
    'type' => 'dog',
    'ready' => 'no'})
pet_2.save

pet_3 = Pet.new({
      'name' => 'medusa',
      'age' => 10,
      'type' => 'snake',
      'ready' => 'no'})
pet_3.save

pet_4 = Pet.new({
      'name' => 'egbert',
      'age' => 100,
      'type' => 'tortoise',
      'ready' => 'yes'})
pet_4.save

adoption_1 = Adoption.new({
  "pet_id" => pet_2.id,
  "owner_id" => owner_1.id
})

adoption_1.save()
