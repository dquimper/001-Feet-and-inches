require_relative 'helper'
require "carpenter_length"

class TestCarpenterLength < Test::Unit::TestCase
  context ".inches" do
    should "return the length in inch" do
      {
          0 => 0,
          1 => 1,
          12 => 0,
          0.5 => 0,
          1.5 => 1
      }.each do |l,i|
        res = CarpenterLength.new(l).inches
        assert_equal i, res, "l=#{l}: '#{i}' was expected, but was '#{res}'"
      end
    end
  end

  context ".feet" do
    should "return the length in feet" do
      {
          0 => 0,
          1 => 0,
          12 => 1,
          0.5 => 0,
          12.5 => 1
      }.each do |l,i|
        res = CarpenterLength.new(l).feet
        assert_equal i, res, "l=#{l}: '#{i}' was expected, but was '#{res}'"
      end
    end
  end

  context ".decimal" do
    should "return the length in decimal" do
      {
          0 => 0,
          0.5 => 0.5,
          1.5 => 0.5,
          12.5 => 0.5,
      }.each do |l,i|
        res = CarpenterLength.new(l).decimal
        assert_equal i, res, "l=#{l}: '#{i}' was expected, but was '#{res}'"
      end
    end
  end

  context ".fraction" do
    should "return the length in fraction (string)" do
      {
          0 => nil,
          1 => nil,
          12 => nil,
          13 => nil,
          1/32.0 => "1/32",
          1/16.0 => "1/16",
          1/8.0 => "1/8",
          1/4.0 => "1/4",
          1/2.0 => "1/2",
          3/4.0 => "3/4",
          1.5 => "1/2",
          12.5 => "1/2",
      }.each do |l,i|
        res = CarpenterLength.new(l).fraction
        assert_equal i, res, "l=#{l}: '#{i}' was expected, but was '#{res}'"
      end
    end
  end

  context ".to_s" do
    should "return the length as a string" do
      {
          0 => "0 inches",
          1 => "1 inch",
          2 => "2 inches",
          12 => "1 foot",
          24 => "2 feet",
          13 => "1 foot, 1 inch",
          25 => "2 feet, 1 inch",
          14 => "1 foot, 2 inches",
          26 => "2 feet, 2 inches",
          1/32.0 => "1/32 inches",
          1.5 => "1 and 1/2 inches",
          12.5 => "1 foot, 1/2 inches",
          13.5 => "1 foot, 1 and 1/2 inches",
          24.5 => "2 feet, 1/2 inches",
          25.5 => "2 feet, 1 and 1/2 inches"
      }.each do |l,i|
        res = CarpenterLength.new(l).to_s
        assert_equal i, res, "l=#{l}: '#{i}' was expected, but was '#{res}'"
      end
    end
  end
end
