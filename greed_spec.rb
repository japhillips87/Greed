require 'rspec'
require_relative 'greed'
describe Greed, '#score' do

  it 'should return 100 when a single 1 is rolled' do
    Greed.score([1]).should == 100
  end

  it 'should return 50 when a single 5 is rolled' do
    Greed.score([5]).should == 50
  end

  it 'should return the sum of individual 1s and 5s' do
    Greed.score([1,5,5,1]).should == 300
  end

  it 'should return correct score when three-of-a-kind rolled' do
    Greed.score([1,1,1]).should == 1000
    Greed.score([2,2,2]).should == 200
    Greed.score([3,3,3]).should == 300
    Greed.score([4,4,4]).should == 400
    Greed.score([5,5,5]).should == 500
    Greed.score([6,6,6]).should == 600
  end

  it 'should return correct score when four-of-a-kind is rolled' do
    Greed.score([1,1,1,1]).should == 2000
    Greed.score([2,2,2,2]).should == 400
    Greed.score([3,3,3,3]).should == 600
    Greed.score([4,4,4,4]).should == 800
    Greed.score([5,5,5,5]).should == 1000
    Greed.score([6,6,6,6]).should == 1200
  end

  it 'should return correct score when five-of-a-kind is rolled' do
    Greed.score([1,1,1,1,1]).should == 4000
    Greed.score([2,2,2,2,2]).should == 800
    Greed.score([3,3,3,3,3]).should == 1200
    Greed.score([4,4,4,4,4]).should == 1600
    Greed.score([5,5,5,5,5]).should == 2000
    Greed.score([6,6,6,6,6]).should == 2400
  end

  it 'should return correct score when six-of-a-kind is rolled' do
    Greed.score([1,1,1,1,1,1]).should == 8000
    Greed.score([2,2,2,2,2,2]).should == 1600
    Greed.score([3,3,3,3,3,3]).should == 2400
    Greed.score([4,4,4,4,4,4]).should == 3200
    Greed.score([5,5,5,5,5,5]).should == 4000
    Greed.score([6,6,6,6,6,6]).should == 4800
  end

  it 'should return 800 when three pairs are rolled' do
    Greed.score([4,4,3,3,6,6]).should == 800
    Greed.score([4,3,3,3,6,6]).should == 300
    Greed.score([1,1,3,3,6,6]).should == 800
  end

  it 'should return 1500 when a straight is rolled' do
    Greed.score([1,2,3,4,5,6]).should == 1500
    Greed.score([5,2,3,1,4,6]).should == 1500
  end

  it 'should return 0 for non-scoring rolls' do
    Greed.score([]).should == 0
    Greed.score([4,2,6,4,2,3]).should == 0
    Greed.score([2,2,3,3,4,6]).should == 0
  end

  it 'should return the right score for random scoring rolls' do
    Greed.score([3,6,5,3,4,1]).should == 150
    Greed.score([4,4,2,3,1,4]).should == 500
  end
end
