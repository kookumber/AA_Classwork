require 'byebug'

class Pet
    def initialize(name)
        @name = name
    end
    
    #The @total_pets below is a class instance variable. 
    #Like an instance variable but defined on the class
    #The Pet 
    def self.add_pet 
        @total_pets ||= 0
        @total_pets += 1
        
    end

    def self.total_pets
        @total_pets
    end

end

class Dog < Pet

    puts self # 1 => puts Dog right when you load the file

    def self.doggie_things?
        puts.self # 2 => puts Dog when we call the method on the class e.g, Dog.doggie_things
    end

    def who_am_i?
        puts.self # 3 => puts the Dog instance when called with dog instance
    end

    def eat
        puts 'eating!'
    end

    def initialize(name)
        super(name)
        @secret = "I'm a goat in disguise"
        self.class.add_pet
    end

    def do_this_with_args(this, *args)
        self.send(this, *args)
    end
    
    def juggle(thing, num)
        num.times do
            puts "juggling #{thing}"
        end
    end

    #takes in any number of method names and defines it for you
    #when you call it on the class method. Use this when in place of writing multiple 
    #methods that are similar to each other
    def self.create_tricks(*trick_names) #can use similar format to write your own attr_reader
        p self #self is Dog
        trick_names.each do |trick_name|
            p self #self is Dog
            define_method(trick_name) do |num = 1| #num here is an argument that the method can take in
                p self #self is now an instance of the class
                num.times do
                    puts "#{trick_name}ing!"
                end
            end
        end
    end

    private

    attr_reader :secret

    #using instance_var.instance_variable_get('@instance var') will give us access even though it's private
    #
    def tell_secret
        puts "My secret is: #{@secret}"
    end

end