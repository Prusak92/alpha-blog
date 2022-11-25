require 'test_helper'

class CategoryTest < ActiveSupport::TestCase


  test "category should be valid" do
    @category = Category.new(name: "Sports")
    assert @category.valid?
  end

  test "name should be present" do
    @category = Category.new(name: " ")
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category = Category.new(name: "Sports")
    @category.save
    @category2 = Category.new(name: "Sports")
    assert_not @category2.valid?
  end

  test "name should not be too long" do
    @category = Category.new(name: "Sports")
    @category.name = "12345678901234567"
    assert_not @category.valid?
  end

  test "name should not be too short" do
    @category = Category.new(name: "Sports")
    @category.name = "a"
    assert_not @category.valid?
  end
end