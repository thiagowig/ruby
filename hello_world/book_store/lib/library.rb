class Library

  attr_reader :books

  def initialize
    @books = {}
  end

  def add_book(book)
    @books[book.category] ||= []
    @books[book.category] << book
  end

  def books
    @books.values.flatten
  end

end
