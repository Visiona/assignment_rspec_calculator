require 'calculator.rb'

describe Calculator do

  let(:calculator){Calculator.new}

  describe "#add" do
    it "returns the sum of two positive numbers" do
      expect(calculator.add(2,3)).to eq(5)
    end

    it "returns the sum of two negative numbers" do
      expect(calculator.add(-2,-3)).to eq(-5)
    end

    it "returns the sum of positive and negative numbers" do
      expect(calculator.add(2,-3)).to eq(-1)
    end

    it "returns the sum of two positive floats" do
      expect(calculator.add(0.2,0.3)).to eq(0.5)
    end

      it "returns the sum of negative and positive floats" do
      expect(calculator.add(-0.2,0.3).round(1)).to eq(0.1)
    end

    it "returns the sum of integers and floats" do
      expect(calculator.add(2,0.3)).to eq(2.3)
    end
  end


  describe "#subtract" do
    it "returns difference of two positive numbers" do
      expect(calculator.subtract(2,3)).to eq(-1)
    end

    it "returns difference of negative and negative number" do
      expect(calculator.subtract(-2,3)).to eq(-5)
    end

    it "returns difference of two negative numbers" do
      expect(calculator.subtract(2,3)).to eq(-1)
    end

    it "returns difference of two positive floats" do
      expect(calculator.subtract(0.2,0.3).round(1)).to eq(-0.1)
    end

    it "returns difference of negative and positive floats" do
      expect(calculator.subtract(-0.2,0.3)).to eq(-0.5)
    end

    it "returns difference of integer and a float" do
      expect(calculator.subtract(2,0.3).round(1)).to eq(1.7)
    end
  end

  describe "#multiply" do
    it "returns product of two positive integers" do
      expect(calculator.multiply(2,3)).to eq(6)
    end

    it "returns product of two negative integers" do
      expect(calculator.multiply(-2,-3)).to eq(6)
    end

    it "returns product of positive and negative integers" do
      expect(calculator.multiply(2,-3)).to eq(-6)
    end

    it "returns product of two positive floats" do
      expect(calculator.multiply(0.2,0.3)).to be_within(0.05).of(0.06)
    end

    it "returns product of negative and positive float" do
      expect(calculator.multiply(-0.2,0.3)).to be_within(0.05).of(-0.06)
    end

    it "returns product of two negative floats" do
      expect(calculator.multiply(-0.2,-0.3)).to be_within(0.05).of(0.06)
    end

    it "returns product of integer and a float" do
      expect(calculator.multiply(0.2,3)).to be_within(0.005).of(0.6)
    end
  end

  describe "#divide" do

    it "returns quotient of two integers - first grater then the other" do
      expect(calculator.divide(3,2)).to eq(1.5)
    end

    it "returns quotient of two integers - first smaller then the other" do
      expect(calculator.divide(2,3)).to be_within(0.01).of(0.66)
    end

    it "returns quotient of two negative integers - first grater then the other" do
      expect(calculator.divide(-3,-2)).to eq(1.5)
    end

    it "returns quotient of two floats- first grater then the other" do
      expect(calculator.divide(0.3,0.2)).to be_within(0.01).of(1.49)
    end

    it "returns quotient of two integers - an integer when there is no reminder" do
      expect(calculator.divide(4,2)).to eq(2)
    end

    it "raises an error if there is division by zero" do
      expect do
        calculator.divide(3,0)
      end.to raise_error(ArgumentError)
    end
  end

  describe "#pow" do
    it "returns power of two integers" do
      expect(calculator.pow(2,3)).to eq(8)
    end

    it "returns results of positive integer rosed to power of negative int" do
      expect(calculator.pow(2,-3)).to eq(0.125)
    end

    it "returns result of rising negative integer to power of odd integer" do
      expect(calculator.pow(-2,3)).to eq(-8)
    end

    it "returns result of rising negative integer to power of even integer" do
      expect(calculator.pow(-2,2)).to eq(4)
    end

    it "returns result of rising integer to decimal power" do
      expect(calculator.pow(2,0.2)).to be_within(0.01).of(1.148)
    end

    it "returns result of rising decimal to integer power" do
      expect(calculator.pow(0.2,2)).to be_within(0.01).of(0.04)
    end
  end

  describe "#sqrt" do
    it "returns square root of positive integer for round roots" do
      expect(calculator.sqrt(9)).to eq(3)
    end

    it "returns error for square root of negative integer" do
      expect do
        calculator.sqrt(-2)
      end.to raise_error(ArgumentError)
    end

    it "returns 2-digit decimal for non-round roots" do
      expect(calculator.sqrt(8)).to eq(2.83)
    end

    it "returns square root of float" do
      expect(calculator.sqrt(0.25)).to eq(0.5)
    end
  end

  describe "#memory=" do
    # before do
    #   calculator.memory = 12
    # end

    it "returns overwritten results to memory function" do
      calculator.instance_variable_set(:@memory, 12)
      expect(calculator.memory=(20)).to eq(20)
    end
  end

  describe "#memory" do

    it "returns the object in memory" do
      calculator.instance_variable_set(:@memory, 12)
      expect(calculator.memory).to eq(12)
    end

    it "clears memory when returned object, and starts as nil" do
      expect(calculator.instance_variable_get(:@memory)).to eq(nil)
    end
  end

  describe "#stringify" do
    it "checks if the output of a function is a string" do
      calculator.instance_variable_set(:@stringify, 2)
      expect(calculator.output(12)).to be_a(String)
    end
  end

end