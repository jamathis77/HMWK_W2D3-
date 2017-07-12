require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)!
Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:pudding) {Dessert.new('pudding', 1, chef)}
  let(:chef) { double("chef", name: "Joe Mama") }

  describe "#initialize" do
    it "sets a type" do
      expect(pudding.type).to eq ('pudding')
    end

    it "sets a quantity" do
      expect(pudding.quantity).to eq (1)
    end

    it "starts ingredients as an empty array" do
      expect(pudding.ingredients).to eq ([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new('pudding', 'one', "Joe Mama")}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(pudding.ingredients).to_not include('Joe Mama')
      pudding.add_ingredient('Joe Mama')
      expect(pudding.ingredients).to include('Joe Mama')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ['sugar', 'spice', 'everything nice', 'Michael Keaton']

      ingredients.each do |ingredient|
        pudding.add_ingredient(ingredient)
    end
      expect(pudding.ingredients).to eq(ingredients)
      pudding.mix!
      expect(pudding.ingredients).not_to eq(ingredients)
      expect(pudding.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      pudding.eat(1)
      expect(pudding.quantity).to eq(0)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {pudding.eat(133)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Joe Mama the great baker")
      expect(pudding.serve).to eq("Joe Mama the great baker has made 1 puddings!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(pudding)
      pudding.make_more
    end
  end
end
