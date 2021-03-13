gifts = input().split(' ')

while True:
    command = input().split(' ')

    if command[0] == 'OutOfStock':
        gifts = ['None' if i == command[1] else i for i in gifts]
    elif command[0] == 'Required':
        if 0 <= int(command[2]) < len(gifts):
            gifts[int(command[2])] = command[1]
    elif command[0] == 'JustInCase':
        gifts[len(gifts)-1] = command[1]
    elif ' '.join(command) == 'No Money':
        break

new_gifts = list()
for i in range(len(gifts)):
    if gifts[i] != 'None':
        new_gifts.append(gifts[i])

print(' '.join(new_gifts))
