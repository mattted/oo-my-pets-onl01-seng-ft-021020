require 'pry'

class Owner
  # code goes here

  attr_reader :name, :species

  @@all_owners = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all_owners << self
    @cats = []
    @dogs = []
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all_owners
  end

  def self.count
    @@all_owners.uniq.length
  end

  def self.reset_all
    @@all_owners.clear
  end

  def cats
    @cats
  end

  def dogs
    @dogs
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.each { |dog| dog.mood = "happy" }
  end

  def feed_cats
    cats.each { |cat| cat.mood = "happy" }
  end

  def sell_pets
    cats.each do |cat|
      cat.owner = nil
      cat.mood = "nervous"
    end

    dogs.each do |dog|
      dog.owner = nil
      dog.mood = "nervous"
    end
    cats.clear
    dogs.clear
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

end