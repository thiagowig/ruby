class Report
  def initialize(library)
    @library = library
  end

  def total
    #@library.books.inject(0) { |tot, book| tot += book.price }
    @library.books.map(&:price).inject(:+)
  end

  def titles
    #@library.books.map { |book| book.title  }
    @library.books.map &:title
  end
end
