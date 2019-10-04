class Author < ApplicationRecord
  has_many :books

  def self.search(search)
        
    if search
      result = Author.select {|a| a.name.include? (search.capitalize)}
    else
      Author.all
    end

  end

end
