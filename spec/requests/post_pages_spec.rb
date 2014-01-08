require 'spec_helper'

describe "Post pages" do

  subject { page }

  let(:admin) { FactoryGirl.create(:admin) }
  before { sign_in admin }

  describe "post creation" do
    before { visit newpost_path }
    describe "with invalid information" do

      it "should not create a post" do
        expect { click_button "Post" }.not_to change(Post, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'post_content', with: "Lorem ipsum" }
      it "should create a post" do
        expect { click_button "Post" }.to change(Post, :count).by(1)
      end
    end
  end

  describe "show posts" do
    before(:all) do
      30.times { FactoryGirl.create(:post) } 
      visit posts_path 
    end
    after(:all)  { Post.delete_all }

    it { should have_selector('div.pagination') }
    it { should have_link('delete', href: post_path(Post.first)) }
  end
end