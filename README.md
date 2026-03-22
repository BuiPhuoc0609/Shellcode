# Shellcode

```
Yêu cầu: Lập trình và demo inject shellcode vào tiến trình bất kì, hiểu về API Resolve, kĩ thuật shellcode
```

Vì yêu cầu phải dump shellcode nên ta sẽ phải tự resolve API mà không dùng import

## Find GetProcAddress

Các bước thực hiện: 

- tìm kernel32 bằng cách duyệt từ struct PEB theo `TEB->PEB->Ldr->InMemoryOrderLoadList->currentProgram->ntdll->kernel32.BaseDll`
- tìm export table bằng các parse header `dosHeader->ntHeader->optionalHeader->dataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT]`
- duyệt từng name trong `AddressOfNames` và so sánh với `GetProcAddress`, nếu đúng thì lấy index để lấy address từ `AddressOfFunctions[index]`
- gọi `GetProcAddress` để resolve hàm `LoadLibraryA`
- lấy module handle của `user32.dll`
- gọi `MessageBox`

ta sẽ dùng 1 script python nhỏ để dễ dàng gen các biến strings local trong stack thay vì viết bằng tay
```python
chuoi = "MessageBoxA"
last = 56
head = last + len(chuoi) + 1
dem = 0
for i in range(head, last+1, -1):
    print(f"    mov byte ptr [rbp-{i}], \"{chuoi[dem]}\"")
    dem += 1
print(f"    mov byte ptr [rbp-{i-1}], 0")
```

```asm
mov byte ptr [rbp-29], "L"
mov byte ptr [rbp-28], "o"
mov byte ptr [rbp-27], "a"
mov byte ptr [rbp-26], "d"
mov byte ptr [rbp-25], "L"
mov byte ptr [rbp-24], "i"
mov byte ptr [rbp-23], "b"
mov byte ptr [rbp-22], "r"
mov byte ptr [rbp-21], "a"
mov byte ptr [rbp-20], "r"
mov byte ptr [rbp-19], "y"
mov byte ptr [rbp-18], "A"
mov byte ptr [rbp-17], 0

lea rdx, [rbp-29]
call qword ptr [rbp-8]   
mov qword ptr [rbp-37], rax      ; LoadLibraryA

mov byte ptr [rbp-48], "u"
mov byte ptr [rbp-47], "s"
mov byte ptr [rbp-46], "e"
mov byte ptr [rbp-45], "r"
mov byte ptr [rbp-44], "3"
mov byte ptr [rbp-43], "2"
mov byte ptr [rbp-42], "."
mov byte ptr [rbp-41], "d"
mov byte ptr [rbp-40], "l"
mov byte ptr [rbp-39], "l"
mov byte ptr [rbp-38], 0

lea rcx, [rbp-48]
call qword ptr [rbp-37]
mov qword ptr [rbp-56], rax ; hUser32

mov byte ptr [rbp-68], "M"
mov byte ptr [rbp-67], "e"
mov byte ptr [rbp-66], "s"
mov byte ptr [rbp-65], "s"
mov byte ptr [rbp-64], "a"
mov byte ptr [rbp-63], "g"
mov byte ptr [rbp-62], "e"
mov byte ptr [rbp-61], "B"
mov byte ptr [rbp-60], "o"
mov byte ptr [rbp-59], "x"
mov byte ptr [rbp-58], "A"
mov byte ptr [rbp-57], 0

lea rdx, [rbp-68]
mov rcx, [rbp-56]
call qword ptr [rbp-8]
mov qword ptr [rbp-76], rax ; MessageBoxA
```

## Injector

Tương tự https://github.com/BuiPhuoc0609/Process-injection/blob/main/README.md

tuy nhiên entrypoint của shellcode nằm ở `0x164` nên ta phải truyền vào đúng entrypoint lúc gọi `CreateRemoteThread`

## Thực nghiệm

<img width="1487" height="758" alt="image" src="https://github.com/user-attachments/assets/fdb19c9f-8c2f-4856-b4fa-db1e08db900a" />

chương trình đã thực hiện inject shellcode và gọi `MessageBox` thành công
