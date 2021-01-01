n = int(input())

for first_letter in range(n):
    for second_letter in range(n):
        for third_letter in range(n):
            print((chr(97 + first_letter) + (chr(97 + second_letter) + (chr(97 + third_letter)))))

