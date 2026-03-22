chuoi = "MessageBoxA"
last = 56

head = last + len(chuoi) + 1
dem = 0
for i in range(head, last+1, -1):
    print(f"    mov byte ptr [rbp-{i}], \"{chuoi[dem]}\"")
    dem += 1


print(f"    mov byte ptr [rbp-{i-1}], 0")
