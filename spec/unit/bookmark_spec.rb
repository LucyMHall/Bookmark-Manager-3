require './lib/bookmark.rb'

describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (title, url) VALUES('Makers', 'http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (title, url) VALUES('Destroy', 'http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (title, url) VALUES('Google', 'http://www.google.com');")
      array_of_bookmarks = Bookmark.all

      expect(array_of_bookmarks).to be_an Array
      expect(array_of_bookmarks[0]).to be_a Bookmark
      expect(array_of_bookmarks[1]).to be_a Bookmark
      expect(array_of_bookmarks[2]).to be_a Bookmark
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create(url: 'http://www.yahoo.com', title: 'Yahoo')
      expect(Bookmark.all[0].title).to include('Yahoo')
    end
  end
end
