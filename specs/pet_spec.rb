require('minitest/autorun')
require('minitest/rg')
require_relative('../models/owner')
require_relative('../models/pet')

class TestPet < Minitest::Test

  def setup
    @pet_1 = Pet.new({
      'name' => 'morticia',
      'age' => 2,
      'type' => 'cat',
      'ready' => 'yes',
      'owner_id' => nil})
      
    @pet_2 = Pet.new({
        'name' => 'zero',
        'age' => 1,
        'type' => 'dog',
        'ready' => 'no'})
       'owner_id' => owner_1.id})

    @pet_3 = Pet.new({
          'name' => 'medusa',
          'age' => 10,
          'type' => 'snake',
          'ready' => 'yes',
          'owner_id' => nil})

    @pet_4 = Pet.new({
          'name' => 'egbert',
          'age' => 100,
          'type' => 'tortoise',
          'ready' => 'yes',
          'owner_id' => nil})
  end

  def test_get_pet_name()
    assert_equal(@pet_3.name, "medusa")
  end









end
