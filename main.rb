require_relative 'library'

system = LibraryManagement.new

loop do
  puts "\n=== BOOK & JSON TEST MENU ==="
  puts "1. Add New Book"
  puts "2. List All Books"
  puts "3. View Total Count Statistics"
  puts "4. Exit"
  print "Your choice: "

  choice = gets.chomp

  case choice
  when "1"
    print "Enter book title: "
    title = gets.chomp
    print "Enter author name:"
    author = gets.chomp
    system.add_book(title,author)
  when "2" 
    system.list_all_books
   when "3"
    puts "\nTotal Books in System: #{InventoryEntry.read_outside}"
  when "4"
    puts "Exiting test system. Goodbye!"
    break 
  else
  puts "Invalid option!"
  end
end