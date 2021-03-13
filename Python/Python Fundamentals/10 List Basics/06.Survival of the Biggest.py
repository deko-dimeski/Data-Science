numbers = input().split(' ')
numbers = list(map(int, numbers))
remove = int(input())

for n in range(remove):
    minimum = min(numbers)
    numbers.remove(minimum)

print(numbers)
