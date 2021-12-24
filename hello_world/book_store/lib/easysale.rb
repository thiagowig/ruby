module EasySale
  class Set

    require_relative 'my_system_exception'

    attr_reader :books

    include Enumerable

    def initialize
      @database = Database.new
    end

    def add_book(book)
      save_book book do
        @books << book
      end if book.kind_of? Media
    end

    private def save_book(book)
      @database.save book
      yield
    end

    def books
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

    def each
      books.each { |book| yield book}
    end

    def raise_error
      raise MySystemException
    end

    def named_parameters(first: 1, second: "second")
      p "First: #{first}. Second: #{second}"
    end

  end

end
