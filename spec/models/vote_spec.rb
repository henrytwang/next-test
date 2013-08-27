require 'spec_helper'

describe Vote do
  before :each do
    @vote = Vote.new 1, 2
  end

  describe "#new" do
    it "returns a new vote object" do
      @vote.should be_an_instance_of Vote
    end
  end

end
