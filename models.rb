require './helpers'

class Gitcommit < ActiveRecord::Base
  has_many :gitcommitfiles
  
  def to_s
    "#{commit_id}"
  end
end

class Gitfile < ActiveRecord::Base
  has_many :gitcommitfiles
  
  def to_s
    "#{name}"
  end
end

class Gitcommitfile < ActiveRecord::Base
  belongs_to :gitcommit
  belongs_to :gitfile
  
  def to_s
    "#{gitfile}"
  end
  
  def friendly_size
    readable_file_size size
  end
  
  def size_class
    if size > 2000
      "too-big"
    else
      "normal"
    end
  end
end