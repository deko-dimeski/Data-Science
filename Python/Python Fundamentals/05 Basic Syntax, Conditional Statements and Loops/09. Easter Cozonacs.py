budget = float(input())
flour_price = float(input())

eggs_price = 0.75 * flour_price
milk_price = (1.25 * flour_price) * 0.25
cozonac_cost = flour_price + eggs_price + milk_price
colored_eggs_count = 0

cozonacs_count = int(budget / cozonac_cost)
money_left = budget - (cozonacs_count * cozonac_cost)

for i in range(cozonacs_count):
    colored_eggs_count += 3
    if (i + 1) % 3 == 0:
        colored_eggs_count -= (i + 1) - 2

print(f'You made {cozonacs_count} cozonacs! Now you have {colored_eggs_count} eggs and {money_left:.2f}BGN left.')