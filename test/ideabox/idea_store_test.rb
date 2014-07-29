gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ideabox/idea'
require './lib/ideabox/idea_store'


class IdeaStoreTest < Minitest::Test
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

    found_idea3 = IdeaStore.find(id3)
    assert_equal "celebrate", found_idea3.title
    assert_equal "with champagne", found_idea3.description

  end
end
