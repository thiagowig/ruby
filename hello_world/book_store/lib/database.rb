require "yaml"

class Database

  def save(book)
    File.open("books.yml", "a") do |file|
      file.puts YAML.dump book
      file.puts ""
      p "File saved!"
    end
  end

  def load_books
    File.open("books.yml", "r") do |saved_book|
      YAML.load_stream saved_book
    end
  end
end
