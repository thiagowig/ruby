require_relative "media"
require_relative "currency_formatter"

class Book < Media

  attr_reader :category, :author

  include CurrencyFormatter

  def initialize(title, author, isbn = 1, pages, price, category)
    super()
    @title = title
    @author = author
    @isbn = isbn
    @pages = pages
    @category = category
    @price = price
    @discount = 0.2
  end

  def to_s
    "Author: #{@author}.
     ISBN : #{@isbn}.
     Pages: #{@pages}.
     Category: #{@category}.
     Title: #{@title}"
  end

  def eql?(other)
    @title == other.title
  end

  def hash
    @isbn.hash
  end

end