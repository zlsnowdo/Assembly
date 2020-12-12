;ECE 109-Spring 2020
;Program 2:Moving 8x8 block that changes colors using wasd and other keys
;Zachary Snowdon, April 13, 2020
.ORIG x3000

BRnzp JUMP

rLOOP	LD R1, RED			;Changes color to red
		BRnzp MOVE			
yLOOP	LD R1, YELLOW		;Changes color to yellow
		BRnzp MOVE
gLOOP	LD R1, GREEN		;Changes color to green
		BRnzp MOVE
bLOOP	LD R1, BLUE			;Changes color to blue
		BRnzp MOVE
whLOOP	LD R1, WHITE1		;Changes color to white
		BRnzp MOVE
qLOOP	LEA R0, PROMPT		;Prints ending string
		PUTS
		HALT
		
aLOOP		LD R5, ABOUND
			ADD R5, R5, R6
			BRnz MOVE
			LD R5, ABOUND
			ADD R6, R6, #-1
			ADD R5, R5, R6
			BRn MOVE				;Tests for boundary
			LD R5, aMOVE1			;Moves starting point to left
			ADD R2, R2, R5
			LD R3, PIXEL1
			LD R4, ROWp1
			LD R5, wMOVE1
			ADD R2, R2, R5
			LD R5, FOUR1
	LOOP11	STR R1, R2, #0			;Loop 11 and 12 print the new box
			ADD R2, R2, #1
			ADD R3, R3, #-1
			BRp LOOP11
			LD R3, PIXEL1
			ADD R2, R2, R4
			ADD R2, R2, #-1
	LOOP12   STR R1, R2, #0
			ADD R2, R2, #-1
			ADD R3, R3, #-1
			BRp LOOP12
			LD R3, PIXEL1
			ADD R2, R2, R4
			ADD R2, R2, #1
			ADD R5, R5, #-1
			BRp LOOP11
			LD R5, dMOVE1			;Moves coordinate to right
			ADD R2, R2, R5
			LD R5, ROWn1			;Moves coordinate down a row
			ADD R2, R2, R5
			LD R5, sMOVE1			;Moves coordinate down a block
			ADD R2, R2, R5
			LD R7, BLACK1			
			LD R3, PIXEL1
			LD R4, ROWn1
			LD R5, wMOVE1
			ADD R2, R2, R5
			LD R5, FOUR1
	LOOP13	STR R7, R2, #0			;Loop 13 and 14 delete the old box
			ADD R2, R2, #1
			ADD R3, R3, #-1
			BRp LOOP13
			LD R3, PIXEL1
			ADD R2, R2, R4
			ADD R2, R2, #-1
	LOOP14  STR R7, R2, #0
			ADD R2, R2, #-1
			ADD R3, R3, #-1
			BRp LOOP14
			LD R3, PIXEL1
			ADD R2, R2, R4
			ADD R2, R2, #1
			ADD R5, R5, #-1
			BRp LOOP13
			LD R5, sMOVE1
			ADD R2, R2, R5
			LD R5, ROWp1
			ADD R2, R2, R5
			LD R5, aMOVE1
			ADD R2, R2, R5
			BRnzp MOVE
			
RED		.FILL x7C00
GREEN	.FILL x03E0
BLUE	.FILL x001F
YELLOW	.FILL x7FED
WHITE1 .FILL x7FFF
COORD1 .FILL xDF40
PIXEL1 .FILL #8
ROWp1  .FILL #128
FOUR1  .FILL #4
r	   .FILL #-114
BLACK1	.FILL x0000
ROWn1	.FILL #-128
w1		.FILL #-119
wpos1	.FILL #119
apos1	.FILL #97
a1		.FILL #-97
s1		.FILL #-115
spos1	.FILL #115
d1		.FILL #-100
dpos1	.FILL #100
wMOVE1	.FILL #-1024
sMOVE1	.FILL #1024
dMOVE1	.FILL #8
aMOVE1	.FILL #-8
q		.FILL #-113
rpos1	.FILL #114
y		.FILL #-121
ypos	.FILL #121
g		.FILL #-103
gpos	.FILL #103
b		.FILL #-98
bpos	.FILL #98
PROMPT  .STRINGZ "Thank you for playing" 
UPBOUND .FILL x3880
DBOUND	.FILL x500
RBOUND	.FILL #-7
ABOUND	.FILL #7
R1BOUND .FILL #-6
wh		.FILL #-32
whpos	.FILL #32




JUMP
		LD R1, WHITE1
		LD R2, COORD1
		LD R3, PIXEL1
		LD R4, ROWp1
		LD R6, FOUR1

LOOPM
	LOOP	STR R1, R2, #0
			ADD R2, R2, #1			;Move bit to left
			ADD R3, R3, #-1			
			BRp LOOP
			LD R3, PIXEL1
			ADD R2, R2, R4			;Brings row down one
			ADD R2, R2, #-1
	LOOP2  	STR R1, R2, #0
			ADD R2, R2, #-1
			ADD R3, R3, #-1
			BRp LOOP2
			LD R3, PIXEL1
			ADD R2, R2, R4
			ADD R2, R2, #1
			ADD R6, R6, #-1
			BRp LOOPM

MOVE	GETC
		LD R5, w1				;Tests for w
		ADD R0, R0, R5
		BRz wLOOP				
		LD R5, wpos1
		ADD R0, R0, R5
		LD R5, s1				;Tests for s
		ADD R0, R0, R5
		BRz sLOOP	
		LD R5, spos1
		ADD R0, R0, R5
		LD R5, d1				;Tsts for d
		ADD R0, R0, R5
		BRz dLOOP	
		LD R5, dpos1
		ADD R0, R0, R5
		LD R5, a1				;Tests for a
		ADD R0, R0, R5
		BRz aLOOP
		LD R5, apos1
		ADD R0, R0, R5
		LD R5, r				;Tests for r
		ADD R0, R0, R5
		BRz rLOOP
		LD R5, rpos1
		ADD R0, R0, R5
		LD R5, y				;Tests for y
		ADD R0, R0, R5
		BRz yLOOP
		LD R5, ypos
		ADD R0, R0, R5
		LD R5, g				;Tests for g
		ADD R0, R0, R5
		BRz gLOOP
		LD R5, gpos
		ADD R0, R0, R5
		LD R5, b				;Tests for b
		ADD R0, R0, R5
		BRz bLOOP
		LD R5, bpos
		ADD R0, R0, R5
		LD R5, wh				;Tests for space
		ADD R0, R0, R5
		BRz whLOOP
		LD R5, whpos
		ADD R0, R0, R5
		LD R5, q				;Tests for q
		ADD R0, R0, R5
		BRz qLOOP
		BRnp MOVE

HALT

wLOOP	
	BOUND	LD R5, UPBOUND
			ADD R5, R5, R2
			BRnz MOVE				;Tests for boundary
			LD R5, wMOVE
			ADD R2, R2, R5			;Moves coordinate up a block
			LD R5, ROWn
			ADD R2, R2, R5
			LD R3, PIXEL
			LD R4, ROWp
			LD R5, wMOVE
			ADD R2, R2, R5
			LD R5, FOUR
	LOOP1	STR R1, R2, #0			;Loop 1 and 1q print new block
			ADD R2, R2, #1
			ADD R3, R3, #-1
			BRp LOOP1
			LD R3, PIXEL
			ADD R2, R2, R4
			ADD R2, R2, #-1
	LOOP1q  STR R1, R2, #0
			ADD R2, R2, #-1
			ADD R3, R3, #-1
			BRp LOOP1q
			LD R3, PIXEL
			ADD R2, R2, R4
			ADD R2, R2, #1
			ADD R5, R5, #-1
			BRp LOOP1
			LD R5, sMOVE
			ADD R2, R2, R5
			ADD R2, R2, R5
			LD R7, BLACK			
			LD R3, PIXEL
			LD R4, ROWn
			LD R5, wMOVE
			ADD R2, R2, R5
			LD R5, FOUR
	LOOP1u	STR R7, R2, #0			;Loop 1u and 1y delete old block
			ADD R2, R2, #1
			ADD R3, R3, #-1
			BRp LOOP1u
			LD R3, PIXEL
			ADD R2, R2, R4
			ADD R2, R2, #-1
	LOOP1y  STR R7, R2, #0
			ADD R2, R2, #-1
			ADD R3, R3, #-1
			BRp LOOP1y
			LD R3, PIXEL
			ADD R2, R2, R4
			ADD R2, R2, #1
			ADD R5, R5, #-1
			BRp LOOP1u
			BRnzp	MOVE
			
sLOOP	
	BOUND2	LD R5, DBOUND
			ADD R5, R5, R2
			BRzp MOVE				;Tests for boundary
			LD R5, sMOVE
			ADD R2, R2, R5
			LD R3, PIXEL
			LD R4, ROWp
			LD R5, wMOVE
			ADD R2, R2, R5
			LD R5, FOUR
	LOOP3	STR R1, R2, #0			;Loop3 and loop4 print new block
			ADD R2, R2, #1
			ADD R3, R3, #-1
			BRp LOOP3
			LD R3, PIXEL
			ADD R2, R2, R4
			ADD R2, R2, #-1
	LOOP4   STR R1, R2, #0
			ADD R2, R2, #-1
			ADD R3, R3, #-1
			BRp LOOP4
			LD R3, PIXEL
			ADD R2, R2, R4
			ADD R2, R2, #1
			ADD R5, R5, #-1
			BRp LOOP3
			LD R5, ROWn
			ADD R2, R2, R5
			LD R7, BLACK			
			LD R3, PIXEL
			LD R4, ROWn
			LD R5, wMOVE
			ADD R2, R2, R5
			LD R5, FOUR
	LOOP5	STR R7, R2, #0			;Loop5 and loop6 delete old block
			ADD R2, R2, #1
			ADD R3, R3, #-1
			BRp LOOP5
			LD R3, PIXEL
			ADD R2, R2, R4
			ADD R2, R2, #-1
	LOOP6   STR R7, R2, #0
			ADD R2, R2, #-1
			ADD R3, R3, #-1
			BRp LOOP6
			LD R3, PIXEL
			ADD R2, R2, R4
			ADD R2, R2, #1
			ADD R5, R5, #-1
			BRp LOOP5
			LD R5, sMOVE
			ADD R2, R2, R5
			ADD R2, R2, R5
			LD R5, ROWp
			ADD R2, R2, R5
			BRnzp MOVE
			
dLOOP		LD R5, R1BOUND
			ADD R5, R5, R6
			BRzp MOVE
			LD R5, RBOUND
			ADD R6, R6, #1
			ADD R5, R5, R6
			BRz MOVE				;Tests for boundary
			LD R5, dMOVE
			ADD R2, R2, R5
			LD R3, PIXEL
			LD R4, ROWp
			LD R5, wMOVE
			ADD R2, R2, R5
			LD R5, FOUR
	LOOP7	STR R1, R2, #0			;Loop7 and loop8 print new block
			ADD R2, R2, #1
			ADD R3, R3, #-1
			BRp LOOP7
			LD R3, PIXEL
			ADD R2, R2, R4
			ADD R2, R2, #-1
	LOOP8   STR R1, R2, #0
			ADD R2, R2, #-1
			ADD R3, R3, #-1
			BRp LOOP8
			LD R3, PIXEL
			ADD R2, R2, R4
			ADD R2, R2, #1
			ADD R5, R5, #-1
			BRp LOOP7
			LD R5, aMOVE
			ADD R2, R2, R5
			LD R5, sMOVE
			ADD R2, R2, R5
			LD R5, ROWn
			ADD R2, R2, R5
			LD R7, BLACK			
			LD R3, PIXEL
			LD R4, ROWn
			LD R5, wMOVE
			ADD R2, R2, R5
			LD R5, FOUR
	LOOP9	STR R7, R2, #0			;Loop9 and loop10 delete old block
			ADD R2, R2, #1
			ADD R3, R3, #-1
			BRp LOOP9
			LD R3, PIXEL
			ADD R2, R2, R4
			ADD R2, R2, #-1
	LOOP10  STR R7, R2, #0
			ADD R2, R2, #-1
			ADD R3, R3, #-1
			BRp LOOP10
			LD R3, PIXEL
			ADD R2, R2, R4
			ADD R2, R2, #1
			ADD R5, R5, #-1
			BRp LOOP9
			LD R5, dMOVE
			ADD R2, R2, R5
			LD R5, sMOVE
			ADD R2, R2, R5
			LD R5, ROWp
			ADD R2, R2, R5
			BRnzp MOVE
			
BLACK	.FILL x0000
COORD	.FILL xDF40
ROWp	.FILL #128
ROWn	.FILL #-128
PIXEL	.FILL #8
w		.FILL #-119
wpos	.FILL #119
apos	.FILL #97
a		.FILL #-97
s		.FILL #-115
spos	.FILL #115
d		.FILL #-100
dpos	.FILL #100
wMOVE	.FILL #-1024
sMOVE	.FILL #1024
sMOV	.FILL #5
dMOVE	.FILL #8
aMOVE	.FILL #-8
FOUR	.FILL #4