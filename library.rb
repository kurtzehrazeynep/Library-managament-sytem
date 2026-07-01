#for now, just the book and JSON part
require 'json'
require_relative 'book'

class LibraryManagement
  attr_reader :bookshelf

  def initialize
    @bookshelf = []
    load_books_to_json #Upload old books as soon as it opens
  end
  def add_book(title,author)
    new_book = InventoryEntry.new(title,author)
    @bookshelf << new_book
    save_books_to_json #Update JSON each time a book is added
    puts "Book successfully saved to JSON!"
  end
#Listbooks at the terminal
  def list_all_books
    if @bookshelf.empty?
        puts "The Bookshelf is empty!"
    else puts "\n--- Current Bookshelf Inventory ---"
      @bookshelf.each do |b|
      status = b.in_library ? "In Lıbrary" : "Borrowed"
      puts "- #{b.book_title} by #{b.author_name} [#{status}]"
      end
    end 
  end
#Writing JSON
  def save_books_to_json
     books_hash_aray = @bookshelf.map {|book| book.to_h}
    File.write('books.json', JSON.pretty_generate(books_hash_aray))
  end
#Reading JSON
  def load_books_to_json
    if File.exist?('books.json') && !File.read('books.json').empty?
      saved_books = JSON.parse(File.read('books.json'))
      saved_books.each do |b|
        @bookshelf << InventoryEntry.new(b['book_title'], b['author_name'], b['in_library'])
      end
    end
  end
end