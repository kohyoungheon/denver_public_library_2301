class Book
  attr_reader :firstname, :lastname, :author, :title, :publication_date, :publication_year

  def initialize(infohash)
    @firstname = infohash[:author_first_name]
    @lastname = infohash[:author_last_name]
    @author = @firstname + " " + @lastname
    @title = infohash[:title]
    @publication_date = infohash[:publication_date]
    @publication_year = infohash[:publication_date].chars.last(4).join
  end
end
