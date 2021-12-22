class Library

  attr_reader :books

  def initialize
    @database = Database.new
  end

  def add_book(book)
    save_book book do
      @books[book.category] ||= []
      @books[book.category] << book
    end
  end

  private def save_book(book)
    @database.save book
    yield
  end

  def load_books
    @books ||= @database.load_books
  end

  def filter_by_category(category)
    @books[category].each do |book|
      yield book if block_given?
    end
  end

  def filter_by_category02(category, &block)
    @books[category].each do |book|
      block.call book
    end
  end

  def filter_by_category03(category, block)
    @books[category].each do |book|
      block.call book
    end
  end

  def filter_by_category04(category)
    books.select { |book| book.category == category}
  end

end
