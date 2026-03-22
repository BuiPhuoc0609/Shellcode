option casemap:none

LIST_ENTRY STRUCT
    Flink                           dq ?
    Blink                           dq ?
LIST_ENTRY ENDS

UNICODE_STRING STRUCT
    Length2                         dw ?
    MaximumLength                   dw ?
    Buffer                          dq ?
UNICODE_STRING ENDS

LDR_DATA_TABLE_ENTRY STRUCT
    InLoadOrderLinks                LIST_ENTRY <>
    InMemoryOrderLinks              LIST_ENTRY <>
    InInitializationOrderLinks      LIST_ENTRY <>
    DllBase                         dq ?
    EntryPoint                      dq ?
    SizeOfImage                     dd ?
    Padding0                        dd ?
    FullDllName                     UNICODE_STRING <>
    BaseDllName                     UNICODE_STRING <>
LDR_DATA_TABLE_ENTRY ENDS

PEB_LDR_DATA STRUCT
    Length2                          dd ?
    Initialized                     db ?
    Padding0                        db 3 dup(?)
    SsHandle                        dq ?
    InLoadOrderModuleList           LIST_ENTRY <>
    InMemoryOrderModuleList         LIST_ENTRY <>
    InInitializationOrderModuleList LIST_ENTRY <>
PEB_LDR_DATA ENDS

PEB STRUCT
    Reserved1                       db 2 dup(?)
    BeingDebugged                   db ?
    Reserved2                       db ?
    Padding0                        dd ?
    Reserved3                       dq 2 dup(?)
    Ldr                             dq ?
PEB ENDS

IMAGE_DOS_HEADER STRUCT
    e_magic                         word  ?
    e_cblp                          word  ?
    e_cp                            word  ?
    e_crlc                          word  ?
    e_cparhdr                       word  ?
    e_minalloc                      word  ?
    e_maxalloc                      word  ?
    e_ss                            word  ?
    e_sp                            word  ?
    e_csum                          word  ?
    e_ip                            word  ?
    e_cs                            word  ?
    e_lfarlc                        word  ?
    e_ovno                          word  ?
    e_res                           word  ?
    rev0                            word  ?
    rev1                            word  ?
    rev2                            word  ?
    e_oemid                         word  ?
    e_oeminfo                       word  ?
    e_res2                          word  ?
    rev3                            word  ?
    rev4                            word  ?
    rev5                            word  ?
    rev6                            word  ?
    rev7                            word  ?
    rev8                            word  ?
    rev9                            word  ?
    rev10                           word  ?
    rev11                           word  ?
    e_lfanew                        dword ?
IMAGE_DOS_HEADER ENDS

IMAGE_FILE_HEADER STRUCT
    Machine                         word  ?
    NumberOfSections                word  ?
    TimeDateStamp                   dword ?
    PointerToSymbolTable            dword ?
    NumberOfSymbols                 dword ?
    SizeOfOptionalHeader            word  ?
    Characteristics                 word  ?
IMAGE_FILE_HEADER ENDS

IMAGE_DATA_DIRECTORY STRUCT
    VirtualAddress                  dword ?
    isSize                          dword ?
IMAGE_DATA_DIRECTORY ENDS

IMAGE_OPTIONAL_HEADER64 STRUCT
    Magic                           word  ?
    MajorLinkerVersion              byte  ?
    MinorLinkerVersion              byte  ?
    SizeOfCode                      dword ?
    SizeOfInitializedData           dword ?
    SizeOfUninitializedData         dword ?
    AddressOfEntryPoint             dword ?
    BaseOfCode                      dword ?
    ImageBase                       qword ?
    SectionAlignment                dword ?
    FileAlignment                   dword ?
    MajorOperatingSystemVersion     word  ?
    MinorOperatingSystemVersion     word  ?
    MajorImageVersion               word  ?
    MinorImageVersion               word  ?
    MajorSubsystemVersion           word  ?
    MinorSubsystemVersion           word  ?
    Win32VersionValue               dword ?
    SizeOfImage                     dword ?
    SizeOfHeaders                   dword ?
    CheckSum                        dword ?
    Subsystem                       word  ?
    DllCharacteristics              word  ?
    SizeOfStackReserve              qword ?
    SizeOfStackCommit               qword ?
    SizeOfHeapReserve               qword ?
    SizeOfHeapCommit                qword ?
    LoaderFlags                     dword ?
    NumberOfRvaAndSizes             dword ?
    DataDirectory                   IMAGE_DATA_DIRECTORY 16 dup(<?>)
IMAGE_OPTIONAL_HEADER64 ENDS

IMAGE_OPTIONAL_HEADER32 STRUCT
    Magic                           word  ?
    MajorLinkerVersion              byte  ?
    MinorLinkerVersion              byte  ?
    SizeOfCode                      dword ?
    SizeOfInitializedData           dword ?
    SizeOfUninitializedData         dword ?
    AddressOfEntryPoint             dword ?
    BaseOfCode                      dword ?
    BaseOfData                      dword ?
    ImageBase                       dword ?
    SectionAlignment                dword ?
    FileAlignment                   dword ?
    MajorOperatingSystemVersion     word  ?
    MinorOperatingSystemVersion     word  ?
    MajorImageVersion               word  ?
    MinorImageVersion               word  ?
    MajorSubsystemVersion           word  ?
    MinorSubsystemVersion           word  ?
    Win32VersionValue               dword ?
    SizeOfImage                     dword ?
    SizeOfHeaders                   dword ?
    CheckSum                        dword ?
    Subsystem                       word  ?
    DllCharacteristics              word  ?
    SizeOfStackReserve              dword ?
    SizeOfStackCommit               dword ?
    SizeOfHeapReserve               dword ?
    SizeOfHeapCommit                dword ?
    LoaderFlags                     dword ?
    NumberOfRvaAndSizes             dword ?
    DataDirectory                   IMAGE_DATA_DIRECTORY 16 dup(<?>)
IMAGE_OPTIONAL_HEADER32 ENDS

IMAGE_NT_HEADER STRUCT
    Signature                       dword ?
    FileHeader                      IMAGE_FILE_HEADER <>
    OptionalHeader                  IMAGE_OPTIONAL_HEADER64 <>
IMAGE_NT_HEADER ENDS

IMAGE_NT_HEADER32 STRUCT
    Signature                       dword ?
    FileHeader                      IMAGE_FILE_HEADER <>
    OptionalHeader                  IMAGE_OPTIONAL_HEADER32 <>
IMAGE_NT_HEADER32 ENDS

IMAGE_IMPORT_DESCRIPTOR STRUCT
    OriginalFirstThunk              dword ?
    TimeDateStamp                   dword ?
    ForwarderChain                  dword ?
    Namee                           dword ?
    FirstThunk                      dword ?
IMAGE_IMPORT_DESCRIPTOR ENDS

IMAGE_THUNK_DATA64 STRUCT
    AddressOfData                   qword ?
IMAGE_THUNK_DATA64 ENDS

IMAGE_THUNK_DATA32 STRUCT
    AddressOfData                   dword ?
IMAGE_THUNK_DATA32 ENDS

IMAGE_SECTION_HEADER STRUCT
    Namee                           byte 8 dup(?)
    VirtualSize                     dword ?
    VirtualAddress                  dword ?
    SizeOfRawData                   dword ?
    PointerToRawData                dword ?
    PointerToRelocations            dword ?
    PointerToLinenumbers            dword ?
    NumberOfRelocations             word  ?
    NumberOfLinenumbers             word  ?
    Characteristics                 dword ?
IMAGE_SECTION_HEADER ENDS

IMAGE_EXPORT_DIRECTORY STRUCT
    Characteristics                 dword ?
    TimeDateStamp                   dword ?
    MajorVersion                    word  ?
    MinorVersion                    word  ?
    Name2                           dword ?
    Base2                           dword ?
    NumberOfFunctions               dword ?
    NumberOfNames                   dword ?
    AddressOfFunctions              dword ?
    AddressOfNames                  dword ?
    AddressOfNameOrdinals           dword ?
IMAGE_EXPORT_DIRECTORY ENDS


.code

ResolveOne proc
    push rbp
    mov rbp, rsp
    sub rsp, 60h

    mov [rbp-8],  rcx
    mov [rbp-10h],rdx
    mov [rbp-18h],r8
    mov [rbp-20h],r9

    mov rax, [rbp+30h]
    mov [rbp-28h], rax
    mov eax, [rbp+38h]
    mov [rbp-2Ch], eax

    mov dword ptr [rbp-30h], 0

find_loop:
    mov eax, [rbp-30h]
    cmp eax, [rbp-2Ch]
    jae not_found

    mov rcx, [rbp-18h]
    mov edx, dword ptr [rcx + rax*4]
    add rdx, [rbp-10h]

    mov r8, rdx
    mov r9, [rbp-8]

cmp_loop:
    mov al, [r8]
    mov dl, [r9]
    cmp al, dl
    jne next_name

    test al, al
    je found

    inc r8
    inc r9
    jmp cmp_loop

next_name:
    inc dword ptr [rbp-30h]
    jmp find_loop

found:
    mov eax, [rbp-30h]

    mov rcx, [rbp-20h]
    movzx eax, word ptr [rcx + rax*2]

    mov rcx, [rbp-28h]
    mov eax, dword ptr [rcx + rax*4]
    add rax, [rbp-10h]
    jmp done

not_found:
    xor rax, rax

done:
    mov rsp, rbp
    pop rbp
    ret
ResolveOne endp


ResolveAll proc
    push rbp
    mov rbp, rsp
    sub rsp, 80h

    mov rax, gs:[60h]
    mov rax, [rax + PEB.Ldr]
    mov rax, [rax + PEB_LDR_DATA.InMemoryOrderModuleList]

    mov rax, [rax]
    mov rax, [rax]

    sub rax, LDR_DATA_TABLE_ENTRY.InMemoryOrderLinks
    mov rdx, [rax + LDR_DATA_TABLE_ENTRY.DllBase]
    mov [rbp-8], rdx

    mov eax, [rdx + IMAGE_DOS_HEADER.e_lfanew]
    add rax, rdx

    mov eax, [rax + IMAGE_NT_HEADER.OptionalHeader + IMAGE_OPTIONAL_HEADER64.DataDirectory + IMAGE_DATA_DIRECTORY.VirtualAddress]
    add rax, rdx
    mov [rbp-10h], rax

    mov rcx, [rbp-10h]
    mov eax, [rcx + IMAGE_EXPORT_DIRECTORY.NumberOfNames]
    mov [rbp-14h], eax

    mov rcx, [rbp-10h]
    mov eax, [rcx + IMAGE_EXPORT_DIRECTORY.AddressOfFunctions]
    add rax, [rbp-8]
    mov [rbp-20h], rax

    mov rcx, [rbp-10h]
    mov eax, [rcx + IMAGE_EXPORT_DIRECTORY.AddressOfNames]
    add rax, [rbp-8]
    mov [rbp-28h], rax

    mov rcx, [rbp-10h]
    mov eax, [rcx + IMAGE_EXPORT_DIRECTORY.AddressOfNameOrdinals]
    add rax, [rbp-8]
    mov [rbp-30h], rax

    mov byte ptr [rbp-63], "G"
    mov byte ptr [rbp-62], "e"
    mov byte ptr [rbp-61], "t"
    mov byte ptr [rbp-60], "P"
    mov byte ptr [rbp-59], "r"
    mov byte ptr [rbp-58], "o"
    mov byte ptr [rbp-57], "c"
    mov byte ptr [rbp-56], "A"
    mov byte ptr [rbp-55], "d"
    mov byte ptr [rbp-54], "d"
    mov byte ptr [rbp-53], "r"
    mov byte ptr [rbp-52], "e"
    mov byte ptr [rbp-51], "s"
    mov byte ptr [rbp-50], "s"
    mov byte ptr [rbp-49], 0

    lea rcx, [rbp-63]
    mov rdx, [rbp-8]
    mov r8, [rbp-28h]
    mov r9, [rbp-30h]
    mov rax, [rbp-20h]
    mov [rsp+20h], rax
    mov eax, [rbp-14h]
    mov [rsp+28h], eax
    call ResolveOne
    mov rcx, [rbp-8] ;kernel32 base
    mov rsp, rbp
    pop rbp
    ret
ResolveAll endp




mainCRTStartup PROC
    push rbp
    mov rbp, rsp
    sub rsp, 100h
    xor rcx, rcx
    call ResolveAll
    mov [rbp-8], rax ; GetProcAddress
    mov [rbp-16], rcx ;hKernel32    
    
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
    
    mov byte ptr [rbp-81], "b"
    mov byte ptr [rbp-80], "r"
    mov byte ptr [rbp-79], "u"
    mov byte ptr [rbp-78], "h"
    mov byte ptr [rbp-77], 0

    mov byte ptr [rbp-86], "l"
    mov byte ptr [rbp-85], "m"
    mov byte ptr [rbp-84], "a"
    mov byte ptr [rbp-83], "o"
    mov byte ptr [rbp-82], 0

    xor rcx, rcx
    lea rdx, [rbp-86]
    lea r8, [rbp-81]
    xor r9, r9
    call qword ptr [rbp-76]
    

    mov rsp, rbp
    pop rbp
    ret
mainCRTStartup ENDP
END
