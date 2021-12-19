class Book

  attr_accessor :price
  attr_accessor :author
  attr_reader :isbn
  attr_reader :category

  def initialize(author, isbn = 1, pages, price, category)
    @author = author
    @isbn = isbn
    @pages = pages
    @price = price
    @category = category
  end

  def to_s
    "Author: #{@author}. ISBN : #{@isbn}. Pages: #{@pages}!. Category: #{@category}"
  end

end