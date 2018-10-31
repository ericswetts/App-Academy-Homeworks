require 'rspec'
require 'dessert'
require 'chef'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  # let(:chef) { double("chef") }
  subject(:brownie) do
    Dessert.new("square", 5, "Bill")
  end
  subject(:bad_brownie) do
    Dessert.new("square","5", "Bill")
  end

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("square")
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq(5)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{bad_brownie}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      brownie.add_ingredient("flour")
      expect(brownie.ingredients[0]).to eq("flour")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      shuffled = brownie.mix!
      expect(brownie.ingredients).to eq(shuffled)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      brownie.eat
      expect(brownie.quantity).to eq(4)
    end


    it "raises an error if the amount is greater than the quantity" do
      expect{brownie.eat(6)}.to raise_error(RuntimeError,"I don't have that many!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
    # allow(:chef).to receive(:titleize)
    # expect
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
