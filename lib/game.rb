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
    tribe = Tribe.new(name: name, members: members)
    clear_tribes
    @tribes.push tribe
    return tribe
  end

  def individual_immunity_challenge
    @tribes.first.members.shuffle.first
  end
end
