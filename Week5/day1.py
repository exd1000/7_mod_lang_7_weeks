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
    

# Exercise 1 – Basic Class
# Create a class Person with attributes name and age, 
# and a method greet() that returns "Hi, I'm NAME and I'm AGE years old."

# Create a class Book with:
# 	•	attributes: title, author, year
# 	•	method summary() that returns a string summary

# Write a class with:
# 	•	attributes: width, height
# 	•	method: area() → width × height
# 	•	method: is_square() → True if width == height

# Exercise 2 – Inheritance
# Create a base class Vehicle with method move(), 
# then subclass Car and Bicycle, overriding move() in each.

# Create a class Vehicle with:
# 	•	attribute: speed
# 	•	method: drive() prints “Driving at X mph”

# Create a subclass Car that:
# 	•	adds brand
# 	•	overrides drive() to include the brand in the message

# Exercise 3 – __str__() Method
# Add __str__() to your Person class so print(person) gives a readable description.

# Add a __str__ method to Book so print(book) shows the summary.

# Exercise 4 – Encapsulation
# Write a User class with:
# 	•	private attribute _password
# 	•	method check_password(p) returns True/False


# Exercise 5 – @classmethod
# Add a from_birth_year() classmethod to Person that constructs a person using birth_year and current year.

# Exercise 6 – @staticmethod
# Add a static method is_adult(age) to Person that returns True if age ≥ 18.