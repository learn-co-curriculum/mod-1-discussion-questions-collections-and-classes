# Finish the implementation of the Car class so it has the functionality described below
# Finish the implementation of the Car class so it has the functionality described below

class Car1
  @@all = []
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
    Car1.all << self
  end

  def self.all
    @@all
  end

  def all
    Car1.all
  end

  def self.drive
   p "VROOOOOOOOOOOOM!"
  end

end

class Car2
  @@all = []
  attr_reader :make, :model

  def initialize(args)
     args.each do |k, v|
      instance_variable_set("@#{k}", v) unless v.nil?
     end
    Car2.all << self
  end

  def self.all
    @@all
  end

  def all
    Car2.all
  end

  def self.drive
   p "VROOOOOOOOOOOOM!"
  end

end

 volvo_lightning = Car1.new("Volvo", "Lightning")
 yugo = Car1.new("Zastava", "Yugo")
 lada = Car1.new("AvtoVAZ", "Lada")

 p volvo_lightning.make
# #=> "Volvo"
 p volvo_lightning.model
#=> "Lightning"

 p Car1.drive
# => "VROOOOOOOOOOOOM!"


p Car1.all
#=> [#<Car:0x00007fae28930f20>, #<Car:0x00007fae28923370>, #<Car:0x00007fae2891ae78>]

#BONUS:
 volvo_lightning = Car2.new(make: "Volvo", model: "Lightning")

 p volvo_lightning.make
#=> "Volvo"
 p volvo_lightning.model
#=> "Lightning"
