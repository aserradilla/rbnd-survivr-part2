class Tribe
  attr_reader :name, :members

  def initialize(options = {})
    @name = options[:name] if options[:name]
    @members = options[:members] if options[:members]
    puts "Created " + @name.red + " tribe."
  end

  def to_s
    @name
  end

  def tribal_council(options = {})
    voted = @members.select {|member| member != options[:immune]}.sample
    @members.delete(voted)
    return voted
  end
end
