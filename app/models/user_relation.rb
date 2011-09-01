class UserRelation < Relation
  belongs_to :following_user, :class_name => "User", :foreign_key => "with_id"
  has_one :activity, :class_name => "UserRelationActivity", :foreign_key => "about_id"
end