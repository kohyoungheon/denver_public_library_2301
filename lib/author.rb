class Author
  attr_reader :name, :books, :first_name, :last_name
  attr_writer :books

  def initialize(infohash)
    @firstname = infohash[:first_name]
    @last_name = infohash[:last_name]
    @name = @firstname + ' ' + @last_name
    @books = []
  end

  def write(title,date)
    book = Book.new({author_first_name: @firstname, author_last_name: @last_name, title: title, publication_date: date})
    @books << book
    book
  end
end
