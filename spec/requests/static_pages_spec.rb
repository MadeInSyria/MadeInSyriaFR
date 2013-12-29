require 'spec_helper'

describe "StaticPages" do
  #Testing home page
  describe "Home page" do
    before { visit root_path }

    it "should have the content 'Home'" do
      expect(page).to have_content('Home')
    end

    it "should have the right title" do
      expect(page).to have_title("MadeInSyria.fr | For a Geek New World")
    end

  end

  #Testing about page
  describe "About page" do
    before { visit about_path }

    it "should have the content 'About Me'" do
      expect(page).to have_content('About me')
    end

    it "should have the right title" do
      expect(page).to have_title("MadeInSyria.fr | About me")
    end

  end

  #Testing about page
  describe "Contact" do
    before { visit contact_path}

    it "should have the content 'Contact me'" do
      expect(page).to have_content('Contact me')
    end

    it "should have the right title" do
      expect(page).to have_title("MadeInSyria.fr | Contact me")
    end

  end
end
