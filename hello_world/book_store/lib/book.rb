require_relative "media"

class Book < Media

  attr_reader :category, :author

  def initialize(title, author, isbn = 1, pages, price, category)
    @title = title
    @author = author
    @isbn = isbn
    @pages = pages
    @category = category
    @price = price
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