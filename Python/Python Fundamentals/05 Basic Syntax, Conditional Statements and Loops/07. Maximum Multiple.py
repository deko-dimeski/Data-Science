divisor = int(input())
bound = int(input())
N = bound

while (N % divisor) > 0:
    N -= 1
print(N)