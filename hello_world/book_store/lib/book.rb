class Book

  attr_accessor :price, :author
  attr_reader :isbn, :category, :title

  def initialize(author, isbn = 1, pages, price, category, title)
    @author = author
    @isbn = isbn
    @pages = pages
    @price = price
    @category = category
    @title = title
  end

  def to_s
    "Author: #{@author}. ISBN : #{@isbn}. Pages: #{@pages}!. Category: #{title}. Category: #{@title}"
  end

  def eql?(other)
    @isbn == other.isbn
  end

  def hash
    @isbn.hash
  end

end