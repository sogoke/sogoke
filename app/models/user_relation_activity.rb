class UserRelationActivity < Activity
  belongs_to :user_relation, :foreign_key => "about_id"
end