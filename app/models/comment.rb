class Comment < ActiveRecord::Base
  attr_accessible :author, :text, :time
end
