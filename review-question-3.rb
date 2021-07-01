#Claude, Yann, Julian, Sam G, Joanna

class User
  attr_accessor :name, :user
  
  def initialize(name)
    @name = name
  end

  def photos
    Photo.all.select do |photo|
     photo.user == self
    end
  end

end


class Photo 
  attr_accessor :user, :name, :input

  @@all =[]

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def comments
    Comment.all.select do |comment|
      comment.user == self 
    end
  end


class Comment

  @@all =[]

  attr_accessor :input

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def make_comment(input)
    @input= input
  end

end


sandwich_photo = Photo.new
sophie = User.new("Sophie")
sandwich_photo.user = sophie
sandwich_photo.user.name
# # => "Sophie"
# sophie.photos
# # => [#<Photo:0x00007fae2880b370>]


#sandwich_photo.comments
# # => []

sandwich_photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
sandwich_photo.comments
# # => [#<Comment:0x00007fae28043700>]

# Comment.all
# #=> [#<Comment:0x00007fae28043700>]
