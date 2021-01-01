buckets = int(input())
tank = 0

for i in range(buckets):
    bucket = int(input())
    if tank + bucket <= 255:
        tank += bucket
    else:
        print("Insufficient capacity!")

print(tank)
