class Post < ApplicationRecord
    belongs_to :user
    belongs_to :channel
    has_many :comments, :dependent => :destroy
end
