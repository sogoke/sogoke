class PostRelation < Relation
  belongs_to :following_post, :class_name => "Post", :foreign_key => "with_id"
end