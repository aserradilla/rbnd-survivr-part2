require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

require 'colorizr'

#After your tests pass, uncomment this code below
#=========================================================
# Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!

# Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))

# Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
  contestants = []
  8.times do
    tribe = @borneo.immunity_challenge
    voted = tribe.tribal_council
    puts "#{voted.name.capitalize} was voted off."
    contestants.push voted
  end
  puts ""
  contestants.length
end

def phase_two
  contestants = []
  3.times do
    inmune = @borneo.individual_immunity_challenge
    puts "#{inmune.name.capitalize} won the individual inmune challenge and is safe from elimination"
    voted = @merge_tribe.tribal_council(inmune: inmune)
    puts "#{voted.name.capitalize} was voted off."
    puts
    contestants.push voted
  end
  contestants.length
end

def phase_three
  7.times do
    inmune = @borneo.individual_immunity_challenge
    puts "#{inmune.name.capitalize} won the individual inmune challenge and is safe from elimination"
    member = @merge_tribe.tribal_council(inmune: inmune)
    puts "#{member.name.capitalize} is member #{@jury.members.length+1} of the jury."
    @jury.add_member member
  end
  @jury.members.length
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
puts
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
puts ""
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists
vote_results = @jury.cast_votes(finalists) #Jury members report votes
puts
@jury.report_votes(vote_results) #Jury announces their votes
puts
@jury.announce_winner(vote_results) #Jury announces final winner
