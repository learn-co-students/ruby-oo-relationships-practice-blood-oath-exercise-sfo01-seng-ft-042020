require_relative 'bloodoath.rb'
require_relative 'follower.rb'
require 'pry'

class Cult
  attr_accessor :name, :location, :founding_year, :slogan
  @@all = []
  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @@all << self
  end

  def recruit_follower(follower)
    BloodOath.new(self, follower)
  end

  def average_age
    size = followers.size
    sum = followers.map {|follower| follower.age}.sum.to_f 
    average = sum / size
  end

  def cult_population
    followers.count 
  end

  def my_followers_mottos 
    followers.each do |follower|
      puts follower.life_motto
    end
  end

  def self.find_by_name(name)
    self.all.map {|cult| cult.location == name}
  end

  def self.find_by_location(location)
    self.all.map {|cult| cult.location == name}
  end

  def self.find_by_founding_year(year)
    self.all.map {|cult| cult.founding_year == year}
  end

  def self.least_popular
    self.all.min_by do |cult|
      cult.followers.length
    end
  end

  def self.all 
    @@all 
  end

  def followers
    blood_oaths.map {|bloodoath| bloodoath.follower}
  end

  def blood_oaths
    BloodOath.all.select {|oath| oath.cult == self}
  end

end

cult_a = Cult.new("nxium", "new york", 2008, "duh")
cult_b = Cult.new("anonymous", "san francisco", 2009, "hi")
cult_c = Cult.new("bleh", "new york", 2001, "yo")
follower_a = Follower.new("thea", 23, "je suix un petit deaux")
follower_b = Follower.new("joe", 33, "luv cults")
follower_c = Follower.new("amanda", 33, "aloha")
follower_e = Follower.new("tiffaniy", 27, "sup")
cult_a.recruit_follower(follower_a)
cult_b.recruit_follower(follower_a)
cult_c.recruit_follower(follower_a)
cult_b.recruit_follower(follower_e)
cult_c.recruit_follower(follower_e)
cult_a.recruit_follower(follower_b)
cult_a.recruit_follower(follower_c)
cult_a.recruit_follower(follower_e)
blood_oath_b = BloodOath.new(cult_b, follower_c)
blood_oath_b = BloodOath.new(cult_a, follower_c)
follower_c.my_cult_slogans
Cult.least_popular
Follower.most_active

# binding.pry