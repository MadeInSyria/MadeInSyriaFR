class CreateRelationBetweenPostsAndCategories < ActiveRecord::Migration
  def change
    create_table :categories_posts do |t|
        t.belongs_to :post
        t.belongs_to :category
    end
  end
end
