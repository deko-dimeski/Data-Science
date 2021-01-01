import sys

snowballs = int(input())
highest_snowball_value = -sys.maxsize
highest_snowball_snow = None
highest_snowball_time = None
highest_snowball_quality = None

for N in range(snowballs):
    snowball_snow = int(input())
    snowball_time = int(input())
    snowball_quality = int(input())

    snowball_value = (snowball_snow / snowball_time) ** snowball_quality
    if snowball_value > highest_snowball_value:
        highest_snowball_value = snowball_value
        highest_snowball_snow = snowball_snow
        highest_snowball_time = snowball_time
        highest_snowball_quality = snowball_quality

print(f"{highest_snowball_snow} : {highest_snowball_time} = {int(highest_snowball_value)} ({highest_snowball_quality})")
