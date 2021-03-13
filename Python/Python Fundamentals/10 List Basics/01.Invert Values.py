numbers = input()
opposite = numbers.split(' ')

for n in range(len(opposite)):
    opposite[n] = -int(opposite[n])
print(opposite)
