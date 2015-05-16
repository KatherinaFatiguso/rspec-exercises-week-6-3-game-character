# rspec file for game_character.rb
require './game_character'
require 'rspec/its'


RSpec.describe GameCharacter do
  subject(:character) { GameCharacter.new("Gundam", 11) }
  its(:name)        { is_expected.to eq('Gundam') }
  its(:level)        { is_expected.to eq(11) }

  describe '#boss?' do
    subject { character.boss? }
    context "Define a boss if the level is 10 or greater" do
      it { is_expected.to eq(true) }
    end

    context "Define it is not a boss if the level less than 10" do
      let(:character) { GameCharacter.new("Sailor Moon", 5) } #let will override Gundam to Sailor Moon only within this context
      it { is_expected.to eq(false) }
    end
  end


  describe '#beats?' do
    subject { character.beats?(contender)}

    context "The contender is better than me" do
    let(:contender) { GameCharacter.new("Taipan", 15) }
      it { is_expected.to eq(false) }
    end

    context "I can beat the contender" do
      let(:contender) { GameCharacter.new("Cotton Tail", 3) }
      it { is_expected.to eq(true) }
    end

    context "The other player is equal to me" do
      let(:contender) { GameCharacter.new("Saiban", 11) }
      it { is_expected.to eq(false) }
    end
  end

  #using truthies
  describe '#boss?' do
    subject { character }#we are testing if the character is the boss or not

    context "Define a boss because my level is greater than 10" do
      it { is_expected.to be_boss } #true
    end

    context "Define it is not a boss because its level is less than 10" do
      let(:character) { GameCharacter.new("Sailor Moon", 5) } #let will override Gundam to Sailor Moon only within this context
      it { is_expected.to_not be_boss } #false
    end
  end

  #do the same for beats but remember it takes value..

end
