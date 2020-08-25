from math import sqrt

x_1 = 100000.0
y_1 = 10000.0
x_3 = 110000.0
y_3 = 10000.0

z1 = (((y_3 * x_3 + sqrt(y_3 * y_1 * x_1 * x_3))/(y_3 + y_1)) * (y_1 - ((sqrt(x_1) * sqrt(y_1) * sqrt(x_1 * y_1 + 4 * ((y_3 * x_3 + sqrt(y_3 * y_1 * x_1 * x_3))/(y_3 + y_1)) * (y_1 + y_3)) - x_1 * y_1)/(2 * ((y_3 * x_3 + sqrt(y_3 * y_1 * x_1 * x_3))/(y_3 + y_1))))) * ((sqrt(x_1) * sqrt(y_1) * sqrt(x_1 * y_1 + 4 * ((y_3 * x_3 + sqrt(y_3 * y_1 * x_1 * x_3))/(y_3 + y_1)) * (y_1 + y_3)) - x_1 * y_1)/(2 * ((y_3 * x_3 + sqrt(y_3 * y_1 * x_1 * x_3))/(y_3 + y_1)))))/(y_1 * (y_1 - ((sqrt(x_1) * sqrt(y_1) * sqrt(x_1 * y_1 + 4 * ((y_3 * x_3 + sqrt(y_3 * y_1 * x_1 * x_3))/(y_3 + y_1)) * (y_1 + y_3)) - x_1 * y_1)/(2 * ((y_3 * x_3 + sqrt(y_3 * y_1 * x_1 * x_3))/(y_3 + y_1)))) + y_3))

# Does matter, since it is a negative number
#z2 = (((y_3 * x_3 - sqrt(y_3 * y_1 * x_1 * x_3))/(y_3 + y_1)) * (y_1 - ((sqrt(x_1) * sqrt(y_1) * sqrt(x_1 * y_1 + 4 * ((y_3 * x_3 - sqrt(y_3 * y_1 * x_1 * x_3))/(y_3 + y_1)) * (y_1 + y_3)) - x_1 * y_1)/(2 * ((y_3 * x_3 - sqrt(y_3 * y_1 * x_1 * x_3))/(y_3 + y_1))))) * ((sqrt(x_1) * sqrt(y_1) * sqrt(x_1 * y_1 + 4 * ((y_3 * x_3 - sqrt(y_3 * y_1 * x_1 * x_3))/(y_3 + y_1)) * (y_1 + y_3)) - x_1 * y_1)/(2 * ((y_3 * x_3 - sqrt(y_3 * y_1 * x_1 * x_3))/(y_3 + y_1)))))/(y_1 * (y_1 - ((sqrt(x_1) * sqrt(y_1) * sqrt(x_1 * y_1 + 4 * ((y_3 * x_3 - sqrt(y_3 * y_1 * x_1 * x_3))/(y_3 + y_1)) * (y_1 + y_3)) - x_1 * y_1)/(2 * ((y_3 * x_3 - sqrt(y_3 * y_1 * x_1 * x_3))/(y_3 + y_1)))) + y_3))

resulting_ys1 = (x_1 * y_1)/(x_1 + z1)
intermediary_ys = y_1 - resulting_ys1
resulting_xs2 = (x_3 * y_3)/(y_3 + (y_1 - resulting_ys1))

print("Reserves at first exchange:")
print("x: " + str(x_1))
print("y: " + str(y_1))
print("Reserves at second exchange:")
print("x: " + str(x_3))
print("y: " + str(y_3))
print("")
print("Input_xs: " + str(z1))
print("Intermediary_ys: " + str(intermediary_ys))
print("Profit: " + str((x_3 - resulting_xs2) - z1) + " x")
print("")
print("These values should be the same, since the price should be equal afterwards:")
print("Ratio at 1st exchange: " + str((x_1 + z1)/resulting_ys1))
print("Ratio at 2nd exchange: " + str((resulting_xs2)/(y_3 + (y_1 - resulting_ys1))))
