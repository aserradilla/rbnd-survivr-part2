class Jury
  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member(member)
    @members << member
  end

  def cast_votes(finalists)
    votes_hash = {}
    finalists.each { |finalist| votes_hash["#{finalist}"] = 0 }
    @members.each do |member|
      finalist_voted = finalists.sample
      puts "#{member.name.capitalize} cast their vote to #{finalist_voted}."
      votes_hash["#{finalist_voted}"] += 1
    end
    return votes_hash
  end

  def report_votes(final_votes)
    final_votes.each do |key, value|
      puts "#{key} received #{value} votes!"
    end
  end

  def announce_winner(final_votes)
    winner = final_votes.max_by{|key, value| final_votes[key]}[0]
    puts "The winner is #{winner}!"
    return winner
  end
end
