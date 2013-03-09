class User < ActiveRecord::Base
  # Alias for acts_as_taggable_on :tags
  acts_as_taggable
  acts_as_taggable_on :skills, :interests
end

@user = User.new(:name => "Bobby")
@user.tag_list = "awesome, slick, hefty"      # this should be familiar
@user.skill_list = "joking, clowning, boxing" # but you can do it for any context!
@user.skill_list                              # => ["joking","clowning","boxing"] as TagList
@user.save

@user.tags # => [<Tag name:"awesome">,<Tag name:"slick">,<Tag name:"hefty">]
@user.skills # => [<Tag name:"joking">,<Tag name:"clowning">,<Tag name:"boxing">]

@frankie = User.create(:name => "Frankie", :skill_list => "joking, flying, eating")
User.skill_counts # => [<Tag name="joking" count=2>,<Tag name="clowning" count=1>...]
@frankie.skill_counts
