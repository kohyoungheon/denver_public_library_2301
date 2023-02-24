require './lib/library'

RSpec.describe Library do
  before(:each) do
    @library = Library.new("Denver Library")

    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @villette = @charlotte_bronte.write("Villette", "March 10, 1853")

    @bob= Author.new({first_name: "Bob", last_name: "Bobson"})
    @bobs_novel = @bob.write("Bob's Novel", "December 11, 2021")
    @bobs_poems = @bob.write("Bob's Poems", "June 22, 2022")
  end

  describe "#initialize" do
    it "is an instance of Library" do
      expect(@library).to be_instance_of(Library)
    end

    it "has attributes" do
      expect(@library.name).to eq("Denver Library")
      expect(@library.books).to eq([])
      expect(@library.authors).to eq([])
    end
  end

  describe "#add_author" do
    it "stores author and all books author has written" do
      expect(@library.authors).to eq([])
      expect(@library.books).to eq([])

      @library.add_author(@charlotte_bronte)
      expect(@library.authors).to eq([@charlotte_bronte])
      expect(@library.books).to eq([@jane_eyre, @villette])

      @library.add_author(@bob)
      expect(@library.authors).to eq([@charlotte_bronte, @bob])
      expect(@library.books).to eq([@jane_eyre, @villette, @bobs_novel, @bobs_poems])
    end
  end

  describe "#publication_time_frame_for" do
    it "returns authors first and last publication in a hash" do

      timeframe_1 = @library.publication_time_frame_for(@charlotte_bronte)

      expect(timeframe_1).to be_instance_of(Hash)
      expect(timeframe_1).to eq({:start => "1847", :end =>"1853"})

      @examplebook1 = @charlotte_bronte.write("ex1", "October 16, 1747")
      @examplebook2 = @charlotte_bronte.write("ex2", "October 16, 1947")
      @examplebook3 = @charlotte_bronte.write("ex3", "October 16, 2047")
      @examplebook4 = @charlotte_bronte.write("ex1", "October 16, 1317")
      @examplebook5 = @charlotte_bronte.write("ex1", "October 16, 1004")

      timeframe_2 = @library.publication_time_frame_for(@charlotte_bronte)

      expect(@charlotte_bronte.books.length).to eq(7)
      expect(timeframe_2).to eq({:start => "1004", :end =>"2047"})
    end
  end

  describe "#check_out" do
    it "checks out a book if available" do

      expect(@library.books.length).to eq(0)
      
      randombook = @charlotte_bronte.write("LALALALA", "October 10, 2000")
      expect(@library.check_out(randombook)).to eq("We do not have this book.")

      @library.add_author(@charlotte_bronte)
      expect(@library.books).to eq([@jane_eyre, @villette, randombook])

      expect(@library.books.length).to eq(3)
      expect(@library.check_out(randombook)).to eq([randombook])

      expect(@library.books.length).to eq(2)
      expect(@library.books).to eq([@jane_eyre, @villette])

      expect(@library.checked_out_books.length).to eq(1)
      expect(@library.checked_out_books).to eq([randombook])
    end
  end

  # describe "#return" do
  #   it "returns book if it was check out" do
  #     @library.add_author(@charlotte_bronte)
  #     require 'pry'; binding.pry

  #     expect(@library.books.length).to eq(2)
  #     expect(@library.checked_out_books).to eq([])
  #     expect(@library.return(@jane_eyre)).to eq("Are you sure you checked out this book?")

  #     @library.check_out(@jane_eyre)
  #     expect(@library.checked_out_books).to eq([@jane_eyre])
  #     expect(@library.return(@jane_eyre)).to eq([@jane_eyre])

  #   end
  # end
end