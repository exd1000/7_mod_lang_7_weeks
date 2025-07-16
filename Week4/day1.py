# try / except / else / finally
def divide(x, y):
    try:
        result = x / y
    except ZeroDivisionError:
        print("You can't divide by zero!")
    else:
        print(f"Result is {result}")
    finally:
        print("Execution completed.")

divide(10, 2)
divide(10, 0)


# Raising Custom Exceptions
class NegativeNumberError(Exception):
    pass

def square_root(x):
    if x < 0:
        raise NegativeNumberError("Cannot take square root of negative number.")
    return x ** 0.5

try:
    square_root(-9)
except NegativeNumberError as e:
    print("Caught:", e)



# Basic Logging
import logging

# Set up basic config
logging.basicConfig(level=logging.INFO)

def login(user):
    if user == "admin":
        logging.info("Admin logged in.")
    else:
        logging.warning("Non-admin access attempt.")

login("admin")
login("guest")


# Logging with Different Levels
logging.debug("This is for debugging")
logging.info("Normal operation message")
logging.warning("Something's odd")
logging.error("Something failed")
logging.critical("System crash imminent")
# Log to a file:
logging.basicConfig(filename='app.log', level=logging.DEBUG)



# Full Example: Logging + Exception Handling
def process_data(data):
    try:
        number = int(data)
        return number * 10
    except ValueError as e:
        logging.error("Conversion failed: %s", e)
        return None
    finally:
        logging.info("Attempted to process: %s", data)

print(process_data("42"))     # → 420
print(process_data("oops"))   # → logs error        



# unittest Basics
# run via terminal: python -m unittest your_file.py
import unittest

def multiply(a, b):
    return a * b

class TestMultiply(unittest.TestCase):
    def test_multiply(self):
        self.assertEqual(multiply(2, 3), 6)

    def test_zero(self):
        self.assertEqual(multiply(0, 5), 0)

if __name__ == "__main__":
    unittest.main()


# Debugging with pdb
# Insert this into any line of code:
import pdb; pdb.set_trace()


# Full Error Trace
# traceback to capture or print full exception stack traces:
import traceback

try:
    1 / 0
except Exception as e:
    logging.error("Something went wrong:\n%s", traceback.format_exc())



# real world example
import logging

logging.basicConfig(level=logging.INFO)

def get_discount_price(price, discount):
    try:
        if price < 0 or discount < 0:
            raise ValueError("Price and discount must be non-negative.")
        return price - (price * discount)
    except ValueError as e:
        logging.error(f"Invalid input: {e}")
        return None
    finally:
        logging.info("Discount calculation attempted.")

print(get_discount_price(100, 0.2))     # ✅ 80.0
print(get_discount_price(-10, 0.2))     # ❌ Logs error



# testing example
# Run tests with: python -m unittest this_file.py
import unittest

def divide(x, y):
    if y == 0:
        raise ZeroDivisionError("Division by zero not allowed.")
    return x / y

class TestMath(unittest.TestCase):
    def test_divide(self):
        self.assertEqual(divide(10, 2), 5)
    
    def test_divide_by_zero(self):
        with self.assertRaises(ZeroDivisionError):
            divide(5, 0)



# Exercise 1: Basic try/except
# Write a function that converts a string to an integer. If conversion fails, return None.

def str_to_int(s):
    try: 
        return int(s)
    except ValueError:
        return None



# Exercise 2: Custom error + logging
# Add a custom InvalidEmailError and log when someone enters an email without @.
import logging 
logging.basicConfig(level=logging.INFO)

class InvalidEmailError(Exception):
    pass

def check_email(email):
    if '@' not in email:
        logging.error('Invalid email: %s',email)
        raise InvalidEmailError("Missing '@' in email")
        # raise InvalidEmailError('Missing '@' in email') ❌ This breaks due to incorrect string formatting.
    return True


# Exercise 3: List processing with error handling
# Take a list of strings and return a list of their float conversions. Skip invalid ones but log them.
def convert_floats(values):
    result = []
    for v in values: 
        try: 
            result.append(float(v))
        except ValueError:
            logging.warning(f'Invalid float: {v}')
    return result 



# Exercise 4: Real-world API usage
# Simulate calling a web API using requests.get() to a known invalid URL. Handle requests.exceptions.RequestException and log the error.
import requests
def fetch_data():
    try:
        response = requests.get('https://google.com')
        response.raise_for_status()
    except requests.exceptions.RequestException as e:
        logging.error('Request failed: %s', e)
        return None

# Exercise 5: Build a small test suite
# Write unittest tests for a small calculator class that supports add, subtract, divide, and multiply. Include at least one test for invalid input.

class Calculator:
    def add(self,a,b): return a+b
    def sub(self,a,b): return a-b
    def mul(self,a,b,): return a*b
    def div(self,a,b):
        if b == 0:
            raise ZeroDivisionError('Can\'t divide by zero')
        return a/b
    
import unittest

class TestCalculator(unittest.TestCase):
    def setUp(self):
        self.calc = Calculator()

    def test_add(self):
        self.assertEqual(self.calc.add(2,3),5)

    def test_divide_by_zero(self):
        with self.assertRaises(ZeroDivisionError):
            self.calc.div(10, 0)
            # self.calc.div(10/0) …runs 10/0 before it’s passed into div(), so Python throws the error before it ever reaches your method.
