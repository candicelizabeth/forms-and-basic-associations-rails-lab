class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  

  def artist_name=(name)
    if name != ""
      self.artist = Artist.find_or_create_by(name: name)
    end
  end

  def artist_name
    # byebug
    self.artist ? self.artist.name : nil
  end

  def notes_content=(contents)
    contents.each do |c| 
      if !c.blank? 
        self.notes.build(content: c)
      end
    end
    # byebug
  end
end
