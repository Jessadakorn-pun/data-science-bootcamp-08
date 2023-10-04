## To Avoid an error
try:
    print(1+1)

except ZeroDivisionError:
    print("Cannot divide by zero")
except  NameError:
    print("Variable not found in our environment")
except  SyntaxError:
    print("invalid syntax")
else:
    print("ok")
finally:
    print("end")

## To Avoid an error
try:
    print(asd)

except ZeroDivisionError:
    print("Cannot divide by zero")
except  NameError:
    print("Variable not found in our environment")
except  SyntaxError:
    print("invalid syntax")
else:
    print("ok")
finally:
    print("end")

## try except SyntaxError
try:
    eval('print(1+5')
except :
    print("Syntax error")
