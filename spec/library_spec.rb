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
end