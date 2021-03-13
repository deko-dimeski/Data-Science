numbers = input().split(', ')
numbers = list(map(int, numbers))
beggars = int(input())
all_beggars_booty = list()

for i in range(beggars):
    booty = numbers[i::beggars]
    all_beggars_booty.append(sum(booty))

print(all_beggars_booty)