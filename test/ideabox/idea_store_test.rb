gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ideabox/idea'
require './lib/ideabox/idea_store'


class IdeaStoreTest < Minitest::Test

  def teardown
    IdeaStore.delete_all
  end

  def test_save_and_retrieve_an_idea
      idea = Idea.new('celebrate', "with champagne")
      id = IdeaStore.save(idea)
      assert_equal 1, IdeaStore.count
      idea = IdeaStore.find(id)
      assert_equal "celebrate", idea.title
      assert_equal "with champagne", idea.description
  end

  def test_save_and_retrieve_multiple_items
    idea1 = Idea.new("celebrate", "with champagne")
    id1 = IdeaStore.save(idea1)
    assert_equal 1, IdeaStore.count

    idea2 = Idea.new("dream", "of unicorns and rainbows")
    id2 = IdeaStore.save(idea2)
    assert_equal 2, IdeaStore.count

    found_idea1 = IdeaStore.find(id1)
    assert_equal "celebrate", found_idea1.title
    assert_equal "with champagne", found_idea1.description

    found_idea2 = IdeaStore.find(id2)
    assert_equal "dream", found_idea2.title
    assert_equal "of unicorns and rainbows", found_idea2.description

  end

  def test_update_idea
    idea = Idea.new("drink", "tomato juice")
    id = IdeaStore.save(idea)

    idea = IdeaStore.find(id)
    idea.title = "cocktails"
    idea.description = "spicy tomato juice with vodka"

    IdeaStore.save(idea)

    assert_equal 1, IdeaStore.count

    idea = IdeaStore.find(id)
    assert_equal "cocktails", idea.title
    assert_equal "spicy tomato juice with vodka", idea.description
  end

end
