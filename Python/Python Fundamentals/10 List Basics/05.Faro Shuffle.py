cards = list(input().split(' '))
shuffles = int(input())

half = int(len(cards) / 2)

for n in range(shuffles):
    first_deck = cards[0:half]
    second_deck = cards[half:int(len(cards))]
    interwoven = list()

    for i in range(half):
        interwoven.append(first_deck[i])
        interwoven.append(second_deck[i])

    cards = interwoven
    del interwoven

print(cards)



# a b c d e f g h
#
# a   b   c   d
#   e   f   g   h
#
# a e b f c g d h
