class BuzzRelation < Relation
  belongs_to :following_buzz, :class_name => "Buzz", :foreign_key => "with_id"
end