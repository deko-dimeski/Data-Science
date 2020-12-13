quantity = int(input())
days = int(input())
christmas_spirit = 0

ornament_set = 0
tree_skirt = 0
tree_garlands = 0
tree_lights = 0

for i in range(days):
    if (i + 1) % 11 == 0:
        quantity += 2
    if (i + 1) % 2 == 0:
        ornament_set += quantity
        christmas_spirit += 5
    if (i + 1) % 3 == 0:
        tree_skirt += quantity
        tree_garlands += quantity
        christmas_spirit += 13
    if (i + 1) % 5 == 0:
        tree_lights += quantity
        christmas_spirit += 17
    if (i + 1) % 15 == 0:
        christmas_spirit += 30
    if (i + 1) % 10 == 0:
        christmas_spirit -= 20
        tree_skirt += 1
        tree_garlands += 1
        tree_lights += 1
        if i + 1 == days:
            christmas_spirit -= 30

total_cost = ornament_set * 2 + tree_skirt * 5 + tree_garlands * 3 + tree_lights * 15

print(f'Total cost: {total_cost}')
print(f'Total spirit: {christmas_spirit}')