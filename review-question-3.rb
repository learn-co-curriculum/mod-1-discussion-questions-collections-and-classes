# begin to build a simple program that models Instagram
# you should have a User class, a Photo class and a comment class
class User
  attr_reader :name

  def initialize(name)
    @name = name
  end
  
  def photos
    Photo.all.select { |key| key.user == self }
  end
end

class Photo
  attr_accessor :user
  
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def comments
    Comment.all.select { |comment| comment.photo == self }
  end
  
  def make_comment(comment)
    Comment.new(comment, self)
  end
end

class Comment
  attr_accessor :photo, :comment

  @@all = []

  def initialize(comment, photo)
    @comment = comment
    @photo = photo
    @@all << self
  end

  def self.all
    @@all
  end
end

sandwich_photo = Photo.new
sophie = User.new("Sophie")
sandwich_photo.user = sophie
puts "user name"
puts sandwich_photo.user.name
# => "Sophie"
puts "photos"
puts sophie.photos
# => [#<Photo:0x00007fae2880b370>]


puts "photo comments. empty array"
pp sandwich_photo.comments
# => []

sandwich_photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
puts "another photo comment"
puts sandwich_photo.comments
# => [#<Comment:0x00007fae28043700>]

puts "all comments "
puts Comment.all
#=> [#<Comment:0x00007fae28043700>]
