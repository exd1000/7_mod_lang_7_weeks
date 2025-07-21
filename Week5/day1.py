# Week 5 – Day 1: Object-Oriented Programming (OOP) in Python

# class - Blueprint for creating objects (a data + methods combo)
# Instance - An individual object built from a class
# __init__() - Constructor method (runs on instantiation)
# Methods - Functions defined inside a class
# Encapsulation - Hiding internal data with private attributes (convention: _name)
# self - Reference to the current object instance
# @classmethod / @staticmethod - Alternative constructors / stateless methods
# __str__() - String representation of the object
# Inheritance - Subclassing with code reuse ie one class inherits from another
# Polymorphism - Same method name, different implementations

# Basic Class
class Dog:
    def __init__(self, name, breed):
        self.name = name
        self.breed = breed

    def speak(self):
        return f"{self.name} says woof!"

    def __str__(self):
        return f"{self.name} the {self.breed}"

# Usage
benji = Dog("Benji", "Maltese")
print(benji.speak())     # → "Fido says woof!"
print(str(benji))        # → "Fido the Labrador"

# Inheritance
class Animal: # Basic class 
    def __init__(self, name):
        self.name = name

    def speak(self):
        return f"{self.name} makes a sound"

class Cat(Animal): # Subclass 
    def speak(self):
        return f"{self.name} says meow"

# Usage
a = Animal("Generic")
c = Cat("Whiskers")
print(a.speak())  # Generic makes a sound
print(c.speak())  # Whiskers says meow

# Encapsulation example
class BankAccount:
    def __init__(self, balance):
        self._balance = balance  # Protected variable

    def deposit(self, amount):
        self._balance += amount

    def withdraw(self, amount):
        if amount > self._balance:
            print("Insufficient funds")
        else:
            self._balance -= amount

    def get_balance(self):
        return self._balance

# @classmethod and @staticmethod
class Pizza:
    def __init__(self, toppings):
        self.toppings = toppings

    @classmethod
    def margherita(cls):
        return cls(["mozzarella", "tomato"])

    @staticmethod
    def oven_temp():
        return "400°F"
    

# EXERCISES 


# Create a class Person with attributes name and age, 
# and a method greet() that returns "Hi, I'm NAME and I'm AGE years old."

class Person:
    def __init__(self, name, age, gender):
        self.name = name
        self.age = age 
        self.gender = gender
    def greet(self):
        return f'Hi, I\'m {self.name} and I\'m {self.age} years old'
    
    # Add __str__() to your Person class so print(person) gives a readable description.
    def __str__(self):
        return f'{self.name} is just a {self.gender}'
    
    # Add a from_birth_year() classmethod to Person that constructs a person using birth_year and current year.
    # @classmethod
    # def from_birth_year(birth_year, current_year):
    #     age = current_year - birth_year
    #     return age
    

    # Fix needed: missing cls as the first argument and 
    # currently returns only the age instead of a new Person instance.
    @classmethod
    def from_birth_year(cls, name, birth_year, current_year, gender):
        age = current_year - birth_year
        return cls(name, age, gender)

    
    # Add a static method is_adult(age) to Person that returns True if age ≥ 18
    @staticmethod
    def is_adult(age):
        if age >= 18: 
            return True
        else: 
            return False 
    
e = Person('em',12,'girl')
print(e.greet())
print(e)



# Create a class Book with:
# 	•	attributes: title, author, year
# 	•	method summary() that returns a string summary

class Book: 
    def __init__(self, title, author, year):
        self.title = title
        self.author = author
        self.year = year 
    
    def summary(self):
        return f'{self.title} by {self.author}'
    
    # Add a __str__ method to Book so print(book) shows the summary.
    def __str__(self):
        return f'{self.title} written by {self.author} in {self.year}'

b = Book('twilight', 'stephanie meyers',2005)
print(b.summary())
print(b)

# Write a class Square with:
# 	•	attributes: width, height
# 	•	method: area() → width × height
# 	•	method: is_square() → True if width == height

class Square: 
    def __init__(self, width, height):
        self.width = width
        self.height = height
    
    def area(self):
        return self.width * self.height 
    
    def is_square(self):
        if self.width == self.height: 
            return True
        else: 
            return False
        
	# ✅ is_square() works, though could be simplified:
    # def is_square(self):
    #     return self.width == self.height


s = Square(3,12)
print(s.area(), s.is_square())

# Inheritance
# Create a base class Vehicle with attribute speed,
# method drive() prints “Driving at X mph”

class Vehicle:
    def __init__(self,speed):
        self.speed = speed
    def drive(self):
        return f'driving at {self.speed} mph'

# then subclass Car and Bicycle that adds brand
# and overrides overrides drive() to include the brand in the message

    # class Car(Vehicle):
    #     def drive(self):
    #         return f'cars drives at {self.speed} mph'
        
    # class Bike(Vehicle):
    #     def drive(self):
    #         return f'bikes drive at {self.speed} mph'


# Inheritance works — though you say you’re “adding brand”, it’s not included yet.
class Car(Vehicle):
    def __init__(self, speed, brand):
        super().__init__(speed)
        self.brand = brand
    def drive(self):
        return f'{self.brand} car drives at {self.speed} mph'
    
class Bike(Vehicle):
    def __init__(self, speed, brand):
        super().__init__(speed)
        self.brand = brand
    def drive(self):
        return f'{self.brand} bike drives at {self.speed} mph'

        
v = Vehicle(12)
c = Car(25,'honda')
bike = Bike(5,'bikes')
print(v.drive())
print(c.drive())
print(bike.drive())



# Encapsulation
# Write a User class with:
# 	•	private attribute _password
# 	•	method check_password(p) returns True/False

class User:
    def __init__(self, password):
        self._password = password
    def check_password(self, p):
        if self._password == p: 
            return True
        else: 
            return False 
        
p = User('hi')
print(p.check_password('cat'))

