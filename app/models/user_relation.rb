class UserRelation < Relation
  belongs_to :followed_user, :class_name => "User", :foreign_key => "receiver_id"
end