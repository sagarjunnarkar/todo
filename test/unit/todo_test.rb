require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  test "should not save todo without name" do
    todo = Todo.new
    assert !todo.save
  end

  test "should save todo with name sagar" do
    todo = Todo.new(name: 'sagar')
    assert todo.save
  end

  test "should save todo with name minimun 4 letters" do
    todo = Todo.new(name: 'sagar')
    assert todo.save
  end

  test "should not save todo with status false" do
    todo = Todo.new(name: 'sagar', status: true)
    assert todo.save
  end
end
