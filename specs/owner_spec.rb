require('minitest/autorun')
require('minitest/rg')
require_relative('../models/owner')
require_relative('../models/pet')

class TestOwner < Minitest::Test

  def setup
    @owner_1 = Owner.new({
      'first_name' => 'elsie',
      'last_name' => 'button',
      'telephone_number' => 4405545})
    @owner_2 = Owner.new({
        'first_name' => 'george',
        'last_name' => 'glass',
        'telephone_number' => 6666666})

  end

  def test_get_name()
    assert_equal(@owner_1.first_name, "elsie")
  end





end
