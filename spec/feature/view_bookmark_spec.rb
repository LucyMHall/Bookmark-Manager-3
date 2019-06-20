require './app.rb'

RSpec.feature 'Testing bookmark', :type => :feature do

  scenario 'shows home page' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end

  scenario 'viewing bookmarks' do

    Bookmark.create(url:'http://www.makersacademy.com', title: 'Makers')
    Bookmark.create(url:'http://www.destroyallsoftware.com', title: 'Destroy')
    Bookmark.create(url:'http://www.google.com', title: 'Google')

    visit '/bookmarks'
    save_and_open_page
    expect(page).to have_link("Makers", href: 'http://www.makersacademy.com')
    expect(page).to have_link("Destroy", href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link("Google", href: 'http://www.google.com')
  end
end
