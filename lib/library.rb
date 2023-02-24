class Library
  attr_reader :name, :books, :authors, :checked_out_books
  attr_writer :books, :authors, :checked_out_books

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
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

  def check_out(book)
    if @books.include?(book)
      @books.delete(book)
      @checked_out_books << book
    else
      return "We do not have this book."
    end
  end

  def return(book)
    if @checked_out_books.include?(book)
      @checked_out_books.delete(book)
      @books << book
    else
      return "Are you sure you checked out this book?"
    end
  end
end
