class BloodOath

  attr_accessor :cult, :follower, :initiation_date
  @@all = []
  def initialize(cult, follower)
    @cult = cult 
    @follower = follower
    @initiation_date = Time.now.strftime("%m/%d/%Y") 
    @@all << self
  end

  def self.all
    @@all 
  end

end