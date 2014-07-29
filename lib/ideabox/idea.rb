class Idea
  attr_accessor :id, :title, :description
  attr_reader :likes

  def initialize(title, description)
    @title = title
    @description = description
    @likes = 0
  end

  def like!
    @likes += 1
  end

  def <=>(other)
    likes <=> other.likes
  end

  def new?
    @id.nil?
    #!id
  end

  def test_an_old_idea
    idea = Idea.new('drink', 'lots of water')
    idea.id = 1
    refute idea.new?
  end

end
