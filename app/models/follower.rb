require 'pry'
require_relative 'bloodoath.rb'


class Follower 
  attr_accessor :name, :age, :life_motto
  @@all = []
  def initialize(name, age, life_motto)
    @name = name
    @age = age 
    @life_motto = life_motto
    @@all << self
  end

  def join_cult(cult)
    BloodOath.new(cult, self)
  end
  
  def my_cult_slogans
    oaths.map {|oath| oath.cult.slogan}
  end

  def self.most_active
    # binding.pry
    follower_cults = self.all.map do |follower|
      {follower => follower.cults.length}
    end
    follower_activity.max_by {|k, v| v}
  end

  def self.of_a_certain_age(age)
    self.all.map {|follower| follower.age == age}
  end

  def cults
    oaths.map do |oath|
      oath.cult
    end
  end

  def oaths 
    BloodOath.all.select {|oath| oath.follower == self}
  end

  def self.all 
    @@all 
  end
end

