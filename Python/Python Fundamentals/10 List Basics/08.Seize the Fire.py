fire_cells = input().split('#')
water = int(input())
effort = 0
cells = list()

for i in range(len(fire_cells)):
    # Parsing fire_range data
    fire_cells_values = (fire_cells[i].split(' = '))
    fire_type = fire_cells_values[0]
    fire_range = int(fire_cells_values[1])

    if water < fire_range:
        continue

    if (fire_type == 'Low') and (1 <= fire_range <= 50):
        water -= fire_range
        effort += fire_range * 0.25
        cells.append(fire_range)
    elif (fire_type == 'Medium') and (51 <= fire_range <= 80):
        water -= fire_range
        effort += fire_range * 0.25
        cells.append(fire_range)
    elif (fire_type == 'High') and (81 <= fire_range <= 125):
        water -= fire_range
        effort += fire_range * 0.25
        cells.append(fire_range)

print('Cells:')
for p in range(len(cells)):
    print(f' - {cells[p]}')

print(f'Effort: {effort:0.2f}')
print(f'Total Fire: {sum(cells)}')
