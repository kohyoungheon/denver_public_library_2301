class Library
  attr_reader :name, :books, :authors
  attr_writer :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    author.books.each do |book|
      @books << book
    end
  end

  def publication_time_frame_for(author)
    time_frame_hash = {:start => "", :end => ""}
    all_years = []
    author.books.each do |book|
      all_years << book.publication_year.to_i
    end
    time_frame_hash[:start] = all_years.min.to_s
    time_frame_hash[:end] = all_years.max.to_s
    return time_frame_hash
  end
end
