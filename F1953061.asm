EXTRN	DISPBX:FAR
MYDATA SEGMENT
DATA  	DW      1234H,5678H,9D4CH,0D7H,8A0EH,0,-1,7D2AH,10F5H,645DH
N   	EQU     	$-DATA
MYDATA ENDS
CODE    	SEGMENT
        	ASSUME  CS:CODE,DS:MYDATA
MAIN	PROC	FAR
	PUSH	DS
	MOV	AX,0
	PUSH	AX
 	MOV     AX,MYDATA
       	 MOV     DS,AX      ;װ��DS
MOV    	 CX,N-1
MOV     	BX,OFFSET DATA
MOV	AX,WORD PTR [BX]     ;��Ϊ��ʮ��λ������ת����ʽ����ǰ���������AX
AGAIN:   	ADD	BX,2
	MOV	DX, WORD PTR [BX]		;�������������DX
	TEST	DX,1	;�жϴ����Ƿ�������
	JNZ	NEXT	;�ǵĻ�ֱ������NEXT
	CMP	AX,DX	;��ż���Ļ��Ƚϴ�С
	JLE	NEXT
	MOV	AX,DX
NEXT:	LOOP	AGAIN
	MOV	BX,AX
	CALL	DISPBX	;�����ӳ�����ʾ
	MOV	AH,2
	MOV	DL,48H
	INT	21H
	RET
MAIN	ENDP

CODE	ENDS
END	MAIN

