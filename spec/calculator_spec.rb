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

    it "returns quotient of two integers when there is no reminder" do
      expect(calculator.divide(4,2)).to be_kind_of(Integer)
    end

    it "returns quotient of two integers when there is a reminder" do
      expect(calculator.divide(4,3)).to be_kind_of(Float)
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

    it "returns a decimal for non-round roots" do
      expect(calculator.sqrt(7)).to be_kind_of(Float)
    end

    it "returns square root of float" do
      expect(calculator.sqrt(0.25)).to eq(0.5)
    end

    it "returns 2-digit decimal for non-round roots" do
      root = calculator.sqrt(7).to_s
      decimal_checker = root.split(".").last.size
      expect(decimal_checker).to eq(2)
    end

  end

  describe "#memory=" do

    it "stores an object in memory"  do
      calculator.memory = 2
      expect(calculator.memory).to eq(2)
    end

    it "returns overwritten result in function memory" do
      calculator.memory = 1
      calculator.memory = 3
      expect(calculator.memory).to eq(3)
    end
  end

  describe "#memory" do

    it "returns nil if memory hasn't been set up" do
      expect(calculator.memory).to eq(nil)
    end

    it "returns last value if memory has been set up to" do
      calculator.memory = 1
      expect(calculator.memory).to eq(1)
    end

    it "clears memory after it has been set up and called" do
      calculator.memory = 12
      calculator.memory
      expect(calculator.memory).to eq(nil)
    end

  end

  context "stringify set as true" do
    let(:calc_stringify) {Calculator.new(true)}

      describe "#add" do
        it "returns a string" do
          expect(calc_stringify.add(1,2)).to be_kind_of(String)
        end
      end

      describe "#sunbtract" do
        it "returns a string" do
          expect(calc_stringify.subtract(1,2)).to be_kind_of(String)
        end
      end

      describe "#multiply" do
        it "returns a string" do
          expect(calc_stringify.multiply(1,2)).to be_kind_of(String)
        end
      end

      describe "#divide" do
        it "returns a string" do
          expect(calc_stringify.divide(1,2)).to be_kind_of(String)
        end
      end

      describe "#sqrt" do
        it "returns a string" do
          expect(calc_stringify.sqrt(5)).to be_kind_of(String)
        end
      end

      describe "#pow" do
        it "returns a string" do
          expect(calc_stringify.pow(1,2)).to be_kind_of(String)
        end
      end
  end

end