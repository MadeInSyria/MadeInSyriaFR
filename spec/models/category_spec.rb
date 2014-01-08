require 'spec_helper'

describe Category do
  before do 
    @category = Category.new(name: "test cat")
  end

  subject{ @category }

  it { should respond_to(:name) }

  it {should_be valid}

  describe "when name is not present" do
    before { @category.name = nil }
    it { should_not be_valid }
  end
end
