require 'rspec'
require_relative 'zombiegame'
require_relative 'hopetown'
require_relative 'hospital_level_1'
require_relative 'police_station'
require_relative 'hardware_store'
require_relative 'house'
require_relative 'rooftop'
require_relative 'items'
require_relative 'player'
require_relative 'monsters'

describe Item do

  before do
    @item = Item.new
    @weapon = Weapon.new
    @melee = Melee.new
    @sword = Sword.new
    @axe = Axe.new
    @ranged = Ranged.new
    @pistol = Pistol.new
    @shotgun = Shotgun.new
  end

  it "item can be created" do
    expect{@item}.to_not raise_error
  end
  it "weapon can be created" do
    expect{@weapon}.to_not raise_error
  end
  it "sword can be created" do
    expect{@sword}.to_not raise_error
  end
  it "axe can be created" do
    expect{@axe}.to_not raise_error
  end
  it "gun can be created" do
    expect{@gun}.to_not raise_error
  end
  it "pistol can be created" do
    expect{@pistol}.to_not raise_error
  end
  it "shotgun can be created" do
    expect{@shotgun}.to_not raise_error
  end

end
