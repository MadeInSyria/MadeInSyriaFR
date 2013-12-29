require 'spec_helper'

describe "StaticPages" do
  #Testing home page
  describe "Home page" do
    it "should have the content 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_content('Home')
    end
    it "should have the right title" do
      visit '/static_pages/home'
      expect(page).to have_title("MadeInSyria.fr | Home")
    end
  end

  #Testing about page
  describe "About page" do
    it "should have the content 'About Me'" do
      visit '/static_pages/about'
      expect(page).to have_content('About me')
    end
    it "should have the right title" do
      visit '/static_pages/about'
      expect(page).to have_title("MadeInSyria.fr | About me")
    end
  end

  #Testing about page
  describe "Contact" do
    it "should have the content 'Contact me'" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact me')
    end
    it "should have the right title" do
      visit '/static_pages/contact'
      expect(page).to have_title("MadeInSyria.fr | Contact me")
    end
  end
end
