str_1 = input()
str_2 = input()

for i in range(len(str_2)):
    if str_1[i] != str_2[i]:
        str_1 = str_2[:i+1] + str_1[i+1:]
        print(str_1)