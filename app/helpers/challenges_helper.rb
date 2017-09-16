module ChallengesHelper
  def self.delete_old_challenges
    challenges = Challenge.where("video != 'nil'").select{|challenge| challenge.age >= 2}.each {|challenge| Challenge.destroy(challenge.id)}
  end
end
