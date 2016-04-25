class Game
  attr_reader :tribes

  def initialize(tribe1, tribe2)
    @tribes = [tribe1, tribe2]
  end

  def add_tribe(tribe)
    @tribes << tribe
  end

  def immunity_challenge
    @tribes.shuffle.first
  end

  def clear_tribes
    @tribes.clear
  end

  def merge(name)
    members = @tribes[0].members
    @tribes[1].members.each { |member| members << member }
    Tribe.new(name: name, members: members)
  end

  def individual_immunity_challenge
    immunity_challenge.tribal_council
  end
end
