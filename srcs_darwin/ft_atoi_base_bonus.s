section .text
	global	_ft_atoi_base

;	r8 == int i
;	r9 == int res
;	r10 == "int sig"
;	r11 == int x
;	r12 == char str(tmp)
;	r15 == int bazlen

_ft_atoi_base:			;	rdi == char *str, rsi == char *base
	cmp	 rdi, 0
	jz	 set_retvalue
	cmp	 rsi, 0
	jz	 set_retvalue	
	xor	 rax, rax		; init return value
	xor	 r9, r9			; res = 0
	xor	 r15, r15		; bazlen = 0
	mov	 r10, 1			; sig = 1
	jmp	 ft_error404

increment_check1:
	inc	 r15						; bazlen++

ft_error404:
	cmp	 BYTE [rsi + r15], 0		; if (base[i] == '\0')
	jz	 end_base
	mov	 r8, r15					; i = bazlen

increment_check2:
	inc	 r8							; i = bazlen + 1

base_check_error:
	cmp	 BYTE [rsi + r8], 0			; if (base[i] == '\0')
	jz	 base_check_char
	mov	 r12b, [rsi + r8]			; char tmp == base[i]
	cmp	 BYTE [rsi + r15], r12b		; if (base[bazlen] == base[i])
	je	 set_retvalue
	jmp	 increment_check2

base_check_char:
	cmp	 BYTE [rsi + r15], 9		; if (base[bazlen] == '\t')
	je	 set_retvalue
	cmp	 BYTE [rsi + r15], 10		; if (base[bazlen] == '\n')
	je	 set_retvalue
	cmp	 BYTE [rsi + r15], 11		; if (base[bazlen] == '\v')
	je	 set_retvalue
	cmp	 BYTE [rsi + r15], 12		; if (base[bazlen] == '\f')
	je	 set_retvalue
	cmp	 BYTE [rsi + r15], 13		; if (base[bazlen] == '\r')
	je	 set_retvalue
	cmp	 BYTE [rsi + r15], 32		; if (base[bazlen] == ' ')
	je	 set_retvalue
	cmp	 BYTE [rsi + r15], 43		; if (base[bazlen] == '-')
	je	 set_retvalue
	cmp	 BYTE [rsi + r15], 45
	je	 set_retvalue
	cmp	 BYTE [rsi + r15], 43		; if (base[bazlen] == '+')
	je	 set_retvalue
	jmp	 increment_check1

end_base:
	cmp	 r15, 1						; if (bazlen <= 1)
	jle	 set_retvalue
	xor  r8, r8						; i = 0
	jmp  ft_isspace

whitespace_increment:
	inc	 r8							; i++

ft_isspace:
	cmp	 BYTE [rdi + r8], 9			; if (str[i] == '\t')
	je	 whitespace_increment
	cmp	 BYTE [rdi + r8], 10		; if (str[i] == '\n')
	je	 whitespace_increment
	cmp	 BYTE [rdi + r8], 11		; if (str[i] == '\v')
	je	 whitespace_increment
	cmp	 BYTE [rdi + r8], 12		; if (str[i] == '\f')
	je	 whitespace_increment
	cmp	 BYTE [rdi + r8], 13		; if (str[i] == '\r')
	je	 whitespace_increment
	cmp	 BYTE [rdi + r8], 32		; if (str[i] == ' ')
	je	 whitespace_increment
	jmp sign_atoi

neg_increment:
	imul r10, -1				; sig *= -1

sign_increment:
	inc	 r8

sign_atoi:
	cmp	 BYTE [rdi + r8], 43	; if (str[i] == '+')
	je	 sign_increment
	cmp	 BYTE [rdi + r8], 45	; if (str[i] == '-')
	je	 neg_increment
	jmp _while_atoi

increment_atoi:
	inc	 r8

_while_atoi:
	cmp	 BYTE [rdi + r8], 0		; if (str[i] == '\0')
	jz	 set_retvalue
	xor	 r11, r11				; x = 0
	jmp ft_based

based_increment:
	inc	 r11

ft_based:
	mov	 r12b, BYTE [rsi + r11]
	cmp	 r12b, 0					; if (base[x] == '\0')
	jz	 set_retvalue
	cmp	 BYTE [rdi + r8], r12b		; if (str[i] != base[x])
	jne	 based_increment

atoi_calc:
	imul r9, r15				; res *= bazlen
	add	 r9, r11				; res += base[x]
	jmp increment_atoi

set_retvalue:
	mov	 rax, r9				; ret -> res
	imul rax, r10				; res * sig

return_end:
	ret
