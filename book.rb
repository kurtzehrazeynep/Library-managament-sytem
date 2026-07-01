class InventoryEntry
  attr_accessor :in_library
  attr_reader :book_title, :author_name
  
  @@total_books_count = 0

  def initialize(book_title,author_name,in_library = true)
    @book_title = book_title
    @author_name = author_name
    @in_library = true
    @@total_books_count+=1
    puts "New book: '#{@book_title}-#{@author_name}' has been added."
  end

  def self.read_outside
    @@total_books_count
  end
  #Converts the object into a Hash structure.
  def to_h 
    {
    book_title: @book_title,
    author_name: @author_name,
    in_library: @in_library
    }
  end
end