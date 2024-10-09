%include "../include/io.mac"

extern ant_permissions

extern printf
global check_permission

section .text

check_permission:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     eax, [ebp + 8]  ; id and permission
    mov     ebx, [ebp + 12] ; address to return the result
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    ; gasesc identificatorul furnicii
    mov     ecx, eax
    ; elimin bitii care reprezinta salile si pastreaza 
    ; doar identificatorul furnicii (elimina ultimii 24 de biti)
    shr     ecx, 24

    ; Extrage permisiunile furnicii
    mov     edx, eax
    ; elimina identificatorul furnicii si pastreaza doar
    ; bitii care reprezinta salile dorite (elimina primii 8 biti)
    shl     edx, 8
    shr     edx, 8

    ; ma duc la lista de permisiuni din vectorul initial
    mov     esi, dword [ant_permissions + ecx * 4]
    ; esi va fi acum lista de permisiuni a furnicii cu indexul dat

    ; initializez rezultatul cu 1 (presupun ca salile sunt corecte)
    mov     dword [ebx], 1

    ; verific bit cu bit
loop_bit:
    test    edx, edx    ; verific daca edx nu e gol (daca e 0 sare la exit)
    jz      loop_exit

    ; extrag ultimul bit si vad daca e 0 sau 1
    test    edx, 1
    ; daca ultimul bit e 0
    jz      loop_bit_continue

    ; daca ultimul bit din edx (din sali dorite) e 1, verific cu cele permise 
    mov     ecx, esi
    test    ecx, 1
    ; daca bitul din esi e 0, rezultatul va deveni 0
    jz      change_result_to_0

loop_bit_continue:
    ; sterg si ultimul bit din esi si din edx
    shr     esi, 1
    shr     edx, 1
    jmp     loop_bit

change_result_to_0:
    mov     dword [ebx], 0
    jmp     loop_exit

loop_exit :

    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
