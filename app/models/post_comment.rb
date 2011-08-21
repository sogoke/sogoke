class PostComment < Comment
  belongs_to :post, :foreign_key => "sogoke_id"
end