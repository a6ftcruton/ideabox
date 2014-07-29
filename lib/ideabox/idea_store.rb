class IdeaStore

  def self.save(idea)
    # create array to store multiple ideas as a collection
    @all ||= []   # <= if all is truthy, leave it alone, if not, set @all = []
    #store the idea we pass into the collection
    if idea.new?
      idea.id = next_id
      @all << idea
    end
    idea.id
  end

  def self.count
    @all.count
  end

  def self.find(id)
    #gets saved data from self.save
    @all.find do |idea|
      idea.id == id
    end
  end

  def self.next_id
    count + 1
  end

  def self.delete_all
    @all.clear
  end
end
