class BuzzActivity < Activity
  belongs_to :buzz, :foreign_key => "about_id"
end