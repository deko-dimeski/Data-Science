A = list()
B = list()

for i in range(11):
    A.append(str(i+1))
    B.append(str(i+1))

cards = input().split(' ')
is_terminated = False

for n in range(len(cards)):
    card = cards[n]
    if card[0] == 'A':
        if card[2:] in A:
            A.remove(card[2:])
    else:
        if card[2:] in B:
            B.remove(card[2:])
    if len(A) < 7 or len(B) < 7:
        is_terminated = True
        break

print(f"Team A - {len(A)}; Team B - {len(B)}")
if is_terminated:
    print("Game was terminated")
