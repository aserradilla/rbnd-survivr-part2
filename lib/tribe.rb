class Tribe
  attr_reader :name, :members

  def initialize(options = {})
    @name = options[:name] if options[:name]
    @members = options[:members] if options[:members]
    puts "Created #{@name} tribe."
  end

  def to_s
    @name
  end

  def tribal_council(options = {})
    @members.pop if @members.last != options[:inmune]
  end
end
