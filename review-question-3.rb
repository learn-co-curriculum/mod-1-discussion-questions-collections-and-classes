# begin to build a simple program that models Instagram
# you should have a User class, a Photo class and a comment class
class User
  attr_accessor :name
   def initialize(name)
   @name = name
  end

  def photos
    Photo.all.collect{ |photo| photo.user == self ? photo : nil}
  end

end

class Photo
  @@all = []
  attr_accessor :user

  def initialize(user=nil)
    @user = user
    Photo.all << self
  end

  def self.all
    @@all
  end

  def all
    Photo.all
  end

  def comments
    Comment.all.collect{ |comment| comment.content == self ? comment : nil}
  end

  def make_comment(comment)
     Comment.new(self.user, self, "this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
  end

end

class Comment
  @@all = []
  attr_accessor :user, :content, :comment
  def initialize(user, content, comment)
    @user = user
    @content = content
    @comment = comment
    Comment.all << self
  end

  def self.all
   @@all
  end

  def all
    Comment.all
  end
end

sandwich_photo = Photo.new
sophie = User.new("Sophie")
sandwich_photo.user = sophie
p sandwich_photo.user.name
# => "Sophie"
p sophie.photos
# => [#<Photo:0x00007fae2880b370>]


p sandwich_photo.comments
# => []

sandwich_photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
p sandwich_photo.comments
# => [#<Comment:0x00007fae28043700>]

p Comment.all
#=> [#<Comment:0x00007fae28043700>]
