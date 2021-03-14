#Modulo
#Ein programm zum Modulo ausrechnen

.data

	z1: .byte 0
	
	g: .asciiz "Ihre Zahl ist gerade"
	ug: .asciiz "Ihre Zahll ist ungerade"
	
.text
main:

	li $v0, 5
	syscall
	sb $v0, z1					#Liesst erste Zahl ein

	lb $t1, z1					#Schreibt Z1 auf $t1
	li $t2, 1
	
	ForMod:
	ble $t1, $t2, endForMod				#Beendet die Schleife wenn sie Kleiner gleich 1 ist
		
		 subi $t1, $t1, 2
		 
		 j ForMod	
	endForMod: 
	
	beq $t1, $t2, Ungerade
	beqz $t1, Gerade
	
	j exit
	
	
	Ungerade:
	
	la $a0, ug			#gibt ungerade aus
	la $v0, 4
	syscall
	
	j exit
	
	Gerade:
	
	la $a0, g			#gibt gerade aus
	la $v0, 4
	syscall
	
	j exit
	
	
exit:
	li $v0, 10					#Exit Routine
	syscall
	
	
	
	
	
	
	
	
	
	
	
