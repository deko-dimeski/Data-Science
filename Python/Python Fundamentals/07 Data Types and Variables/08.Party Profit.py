party_size = int(input())
days = int(input())
earnings = 0

for d in range(1, days + 1):
    # every 10th day
    if d % 10 == 0:
        party_size -= 2
    if d % 15 == 0:
        party_size += 5
    # every day
    earnings += 50
    earnings -= 2 * party_size
    # 3rd day
    if d % 3 == 0:
        earnings -= 3 * party_size
    # 5th day
    if d % 5 == 0:
        earnings += 20 * party_size
        if d % 3 == 0:
            earnings -= 2 * party_size

print(f"{party_size} companions received {int(earnings / party_size)} coins each.")
