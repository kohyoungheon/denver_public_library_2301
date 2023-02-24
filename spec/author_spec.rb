require './lib/author'

RSpec.describe Author do
  before(:each) do
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  describe "#initialize" do
    it "is an instance of Author" do
      expect(@charlotte_bronte).to be_instance_of(Author)
    end

    it "has attributes" do
      expect(@charlotte_bronte.name).to eq("Charlotte Bronte")
      expect(@charlotte_bronte.books).to eq([])
    end
  end

  describe "#write" do
    it "creates a book under the author" do
      jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")

      expect(jane_eyre.class).to eq(Book)
      expect(jane_eyre.title).to eq("Jane Eyre")

      villette = @charlotte_bronte.write("Villette", "1853")
      expect(villette.class).to eq(Book)
      expect(villette.title).to eq("Villette")

      expect(@charlotte_bronte.books.length).to eq(2)
      expect(@charlotte_bronte.books.include?(jane_eyre)).to eq(true)
      expect(@charlotte_bronte.books.include?(villette)).to eq(true)
    end
  end
end