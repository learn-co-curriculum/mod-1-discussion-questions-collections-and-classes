# begin to build a simple program that models Instagram
# you should have a User class, a Photo class and a comment class

class User
    attr_accessor :name
    @@all =[]
    def initialize(name)
        @name = name

        User.all<<self

    end

    def self.all
        @@all
    end

    def photos
        Photo.all.select do |i|
            i.user == self
        end
    end

end

class Comment
    @@all =[]
    attr_accessor :user, :photo
    def initialize(comment,photo)
        @comment = comment
        @user = user
        @photo = photo

        Comment.all<<self
    end

    def self.all
        @@all
    end

end

class Photo
    @@all =[]
    attr_accessor :user, :comment
    def initialize()
        @user
        @comment
        Photo.all<<self
    end

    def self.all
        @@all
    end

    def comments
        Comment.all.select do |i|
            i.photo == self
        end
    end


    def make_comment(string)
        Comment.new(string,self)
    end


end


sandwich_photo = Photo.new
sophie = User.new("Sophie")
sandwich_photo.user = sophie
puts sandwich_photo.user.name
# => "Sophie"
puts sophie.photos
# => [#<Photo:0x00007fae2880b370>]


puts sandwich_photo.comments
# => []

sandwich_photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
puts sandwich_photo.comments
# => [#<Comment:0x00007fae28043700>]

Comment.all
#=> [#<Comment:0x00007fae28043700>]
