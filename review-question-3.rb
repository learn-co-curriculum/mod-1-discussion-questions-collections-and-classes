# begin to build a simple program that models Instagram
# you should have a User class, a Photo class and a comment class
require 'pry'

class User
    attr_reader :name
    @@all = []

    def initialize (name)
        @name = name
        @@all << self
    end

    def photos
        Photo.all.select {|photo| photo.user == self}
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

    def make_comment (text)
        Comment.new(text, self)
    end

    def comments
        Comment.all.select {|comment| comment.photo == self}
    end
        
end

class Comment
    attr_accessor :text, :photo
    @@all = []


    def initialize (text, photo)
        @text = text
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
sandwich_photo.user.name
# => "Sophie"
sophie.photos
# => [#<Photo:0x00007fae2880b370>]


sandwich_photo.comments
# => []

sandwich_photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
sandwich_photo.comments
# => [#<Comment:0x00007fae28043700>]

Comment.all
#=> [#<Comment:0x00007fae28043700>]
binding.pry