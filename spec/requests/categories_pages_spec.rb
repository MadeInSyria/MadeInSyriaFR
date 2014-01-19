require 'spec_helper'

describe "Category pages" do

  subject { page }

  let(:admin) { FactoryGirl.create(:admin) }
  before { sign_in admin }
  after(:all) { User.delete_all }

  describe "category creation" do
    before { visit newcategory_path }
    describe "with invalid information" do

      it "should not create a category" do
        expect { click_button "Create" }.not_to change(Category, :count)
      end

      describe "error messages" do
        before { click_button "Create" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'category_name', with: "Lorem ipsum" }
      it "should create a category" do
        expect { click_button "Create" }.to change(Category, :count).by(1)
      end
    end
  end

   describe "show categories" do
     before(:all) do
       30.times { FactoryGirl.create(:category) } 
       visit categories_path 
     end
     after(:all)  { Category.delete_all }

     it { should have_selector('div.pagination') }
     it { should have_link('delete', href: category_path(Category.first)) }
   end
end