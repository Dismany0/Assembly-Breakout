######################## Bitmap Display Configuration ########################
# - Unit width in pixels:       4
# - Unit height in pixels:      4
# - Display width in pixels:    512
# - Display height in pixels:   512
# - Base Address for Display:   0x10008000 ($gp)
##############################################################################

    .data
##############################################################################
# Immutable Data
##############################################################################
# The address of the bitmap display. Don't forget to connect it!

#my guy my dude the bitmap writes into here
Random_stuff:
.space 0x10000

ADDR_DSPL:
    .word 0x10008000 #Don't change this, I had some memory issues loading in this value so I have hard coded it to be 0x10008000
# The address of the keyboard. Don't forget to connect it!
ADDR_KBRD:
    .word 0xffff0000 

#Colours
BRICK_COLOURS: #These brick colours will also represent the HP of the brick. Hitting a yellow brick will turn it green, etc.
#These bricks will be 10x5 pixels
	.word 0x00ff00 #Green
	.word 0xffff00 #Yellow
	.word 0xff0000 #Red
	.word 0x00ffff #Cyan
	.word 0x0000ff #Blue
	.word 0xff00ff #Purple

GAME_COLOURS:
	.word 0x000000 #Black, Represents empty space
	.word 0x3d3d3d #Dark Gray, Just a filler colour for drawing bricks
	.word 0xa1a1a1 #Gray, Represents the walls
	.word 0xd1d1d1 #Light Gray, Another drawing filler colour
	.word 0xffffff #White, Represents your paddle and ball

# I will reserve the $s7 Register for the current colour
# I will also reserve $t9 for return values, if i will only call 1 other function

LEVEL_1:	#Replace with LEVEL_LOADED to load in 
.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.word 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7
.word 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6
.word 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
.word 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
.word 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3
.word 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
.word 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

LEVEL_2:
.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.word 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
.word 2, 3, 3, 3, 3, 5, 5, 3, 3, 3, 3, 2
.word 2, 3, 5, 5, 5, 0, 0, 5, 5, 5, 3, 2
.word 2, 1, 5, 0, 0, 0, 0, 0, 0, 5, 2, 2
.word 2, 6, 0, 0, 0, 0, 0, 0, 0, 0, 6, 2
.word 2, 6, 0, 0, 0, 0, 0, 0, 0, 0, 6, 2
.word 2, 6, 0, 0, 0, 0, 0, 0, 0, 0, 6, 2
.word 2, 6, 0, 0, 0, 0, 0, 0, 0, 0, 6, 2
.word 2, 6, 6, 0, 0, 0, 0, 0, 0, 6, 6, 2
.word 2, 1, 6, 6, 0, 0, 0, 0, 6, 6, 1, 2
.word 2, 1, 1, 1, 6, 0, 0, 6, 1, 1, 1, 2
.word 7, 7, 7, 7, 1, 1, 1, 1, 7, 7, 7, 7
.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

LEVEL_LOADED:
.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.word 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.word 0, 6, 0, 6, 0, 6, 6, 0, 6, 0, 6, 0
.word 0, 5, 0, 5, 0, 5, 5, 0, 5, 0, 5, 0
.word 0, 6, 0, 6, 0, 6, 6, 0, 6, 0, 6, 0
.word 0, 4, 0, 4, 0, 4, 4, 0, 4, 0, 4, 0
.word 0, 6, 0, 6, 0, 6, 6, 0, 6, 0, 6, 0
.word 0, 4, 0, 4, 0, 4, 4, 0, 4, 0, 4, 0
.word 0, 6, 0, 6, 0, 6, 6, 0, 6, 0, 6, 0
.word 0, 5, 0, 5, 0, 5, 5, 0, 5, 0, 5, 0
.word 0, 6, 0, 6, 0, 6, 6, 0, 6, 0, 6, 0
.word 0, 4, 0, 4, 0, 4, 4, 0, 4, 0, 4, 0
.word 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0




##############################################################################
# Mutable Data
##############################################################################
LEVEL_MAP:
	.space 720 #12 x 15, 192 bricks, 768 bytes grid, each 4 bytes, storing the current level

LIVES: #Number of Lives
	.word 3
SCORE: #Current Score
	.word 0
GAME_STATE:
	.word 0 #0 for running, 1 for paused, 2 for game over, a waiting state is just running with a stationary ball

#Ball Positions, Ball is a 4x4 pixel square in terms of hitbox
BALL_POS: #x and y coords for the ball, starts centered, 10 pixels above the bar
	.word 62
	.word 103
BALL_VEL: #x speed and y speed for the ball
	.word 1
	.word -1
PADDLE_POS:#Paddle Position, Paddle is a 21x3 bar, hovering a constant 8 pixels above the bottom of the screen., top corner is at 74 11
	.word 54
	.word 117
PADDLE_VEL:		#speed for paddle
	.word 0
##############################################################################
# Code
##############################################################################
	.text
	.globl main

	# Run the Brick Breaker game.
main:
    # Initialize the game
	

    jal Initialize
    jal Clear
    jal Draw_Walls
    jal Draw_Stage
    jal Write_Labels
    jal Write_Score
    jal Write_Lives
    
state_checker:
    lw $t0, GAME_STATE
beq $t0, 0, game_loop #0 if game is currently running

beq $t0, 1, pause_loop #1 if paused game

beq $t0, 2, game_over_loop #2 if game over

pause_loop:
addi $v0, $zero, 32 #sleep call
addi $a0, $zero, 30 #10 miliseconds
syscall

jal Take_Input
j state_checker

game_over_loop:
lw $t0, 0x10008000

beq $t0, 0 game_over_loop_2
jal Clear
game_over_loop_2:

jal Draw_Game_Over

addi $v0, $zero, 32 #sleep call
addi $a0, $zero, 60 #10 miliseconds
syscall

jal Take_Input
j state_checker
game_loop:



main_check_state:

main_take_input:
# 1a. Check if key has been pressed
    # 1b. Check which key has been pressed
jal Take_Input

main_update:
# 2a. Check for collisions
	# 2b. Update locations (paddle, ball)
	
#First erase current ball and paddle
jal Erase_Ball
jal Erase_Paddle

jal Update_Paddle_Pos #Get new paddle location
jal Draw_Paddle
jal Update_Ball_Pos
jal Draw_Ball
jal Write_Score
jal Write_Lives

main_collision:

main_render:
# 3. Draw the screen
main_sleep:
# 4. Sleep

addi $v0, $zero, 32 #sleep call
addi $a0, $zero, 10 #10 miliseconds
syscall

    #5. Go back to 1
    #b game_loop
	
	
	
  	b state_checker

##############################################################################
# Functions
##############################################################################

Initialize:
addi $t0, $zero, 3
sw $t0, LIVES

addi $t0, $zero, 0
sw $t0, SCORE

addi $t0, $zero, 0
sw $t0, GAME_STATE

addi $t0, $zero, 62
sw $t0, BALL_POS

addi $t0, $zero, 103
sw $t0, BALL_POS+4

addi $t0, $zero, 0
sw $t0, BALL_VEL
sw $t0, BALL_VEL+4

addi $t0, $zero, 54
sw $t0, PADDLE_POS

addi $t0, $zero, 117
sw $t0, PADDLE_POS+4

addi $t0, $zero, 0
sw $t0, BALL_VEL

jr $ra


Take_Input:
addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
lw $s5, ADDR_KBRD 		#Check for key presses
lw $t0, 0($s5)  
beq $t0, 1, Get_Key_Press 	#This means there is a key pressed, we will branch to handle input
j Key_Return


Get_Bitmap_Coords: #Takes an XY coord and converts to bitmap coord
	add $t0, $a0, $zero #x coord
	add $t1, $a1, $zero #y coord
	mul $t1, $t1, 128 #Multiply by size of the screen
	sll $t1, $t1, 2 #Multiply by 4, to work in bytes
	sll $t0, $t0, 2
	li $t3, 0x10008000 #load start of bitmap address
	add $v0, $t3, $t1 #add y * 128
	add $v0, $v0, $t0 #add and get x + y * 128
	jr $ra
	
Get_Brick_Coords: #Takes an XY coord and converts it to a brick coord
	add $t0, $a0, $zero #x coord
	add $t1, $a1, $zero #y coord
	
	addi $t0, $t0, -4 #Remove the offset created by the walls
	addi $t1, $t1, -16
	
	div $t0, $t0, 10	#Bricks are 10x5
	div $t1, $t1, 5
	
	mul $t1, $t1 12 #each row is 12 bricks long, get the y coord of the array
	add $v0, $zero, $t1 #y * 12
	add $v0, $t1, $t0 #x + y * 12
	
	jr $ra #return
	
	
##############################################################################
# Collisions
##############################################################################
Check_Any_Collisions: #Takes in the new xy position of the ball, and checks the 4 corners for coloured pixels. If any are coloured, something is hit
	addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	
	add $s0, $zero, $zero  #I will work with S registers, Left weight
	add $s1, $zero, $zero  #Right Weight
	add $s2, $zero, $zero  #Up Weight
	add $s3, $zero, $zero  #Down Weight
	
	add $a2, $a0, $zero #x value
	add $a3, $a1, $zero #y value

CACTL:		
	jal Get_Bitmap_Coords #We currently have xy in a0 and a1, get the bitmap coords of this location, top left corner
	lw $t4, ($v0) #v0 holds the bitmap address, read the colour from this address
	beq $t4, 0x000000, CACTR #If the colour is black, no collision, go next
	jal Get_Bounce_Weights

CACTR:		
	addi $a0, $a2, 3 #x + 4, this is now top right corner
	addi $a1, $a3, 0
	jal Get_Bitmap_Coords #We currently have xy in a0 and a1, get the bitmap coords of this location
	lw $t4, ($v0) #v0 holds the bitmap address, read the colour from this address
	beq $t4, 0x000000, CACBL #If the colour is black, no collision, go next
	jal Get_Bounce_Weights

CACBL:		
	addi $a0, $a2, 0 #x, this is now bottom left
	addi $a1, $a3, 3
	jal Get_Bitmap_Coords #We currently have xy in a0 and a1, get the bitmap coords of this location
	lw $t4, ($v0) #v0 holds the bitmap address, read the colour from this address
	beq $t4, 0x000000, CACBR #If the colour is black, no collision, go next
	jal Get_Bounce_Weights

CACBR:		
	addi $a0, $a2, 3 #x, this is now bottom right
	addi $a1, $a3, 3
	jal Get_Bitmap_Coords #We currently have xy in a0 and a1, get the bitmap coords of this location
	lw $t4, ($v0) #v0 holds the bitmap address, read the colour from this address
	beq $t4, 0x000000, CACdone #If the colour is black, no collision, go next
	jal Get_Bounce_Weights
CACdone:
	
	#Now that we know where the ball is going to bounce, I will break and redraw the bricks it contacts with
	jal Collision_Brick_Break
	
	
	#now we have bounce weights
	jal Get_New_Ball_Vel
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4
	jr $ra
	
Collision_Brick_Break: #Only happens right after updating the ball, a2 and a3 are the new coords, use to find bricks.
	addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	#check collision in 4 corners again
	addi $s4, $a2, 0 #protect x value
	addi $s5, $a3, 0 #protect y value
	addi $t7, $zero, 0 #count how many bricks we need to redraw
	
CBBTL:
	addi $a0, $s4, 0 #Load x and y values
	addi $a1, $s5, 0
	ble $a0, 3, CBBTR #If x collides with left wall
	bge $a0, 124, CBBTR #if x collides with right wall
	ble $a1, 15, CBBTR #if y collides with top wall
	bge $a1, 91 CBBTR #if y is under the pixel array, mustve collide with a wall or the paddle
	
	jal Get_Bitmap_Coords #We currently have xy in a0 and a1, get the bitmap coords of this location, top left corner
	lw $t4, ($v0) #v0 holds the bitmap address, read the colour from this address
	beq $t4, 0x000000, CBBTR #If the colour is black, no collision, go next
	
	#If we are here, we collided with a brick
	jal Get_Brick_Coords
	la $t5, LEVEL_MAP #Start of level map
	sll $v0, $v0, 2
	add $t5, $t5, $v0 #Level map + brick coords, or the offset
	lw $t6, ($t5) #load in the value at the brick coord.
	
	beq $t6, 7 CBBTR #If unbreakable, skip
	srl $v0, $v0, 2 #get brick coords
	div $a1, $v0 12 #Get y coord
	mfhi $a0 #get x coord
	
	mul $a0, $a0, 10
	mul $a1, $a1, 5
	addi $a0, $a0, 4
	addi $a1, $a1, 16
	
	jal Erase_Brick #erase the brick we collided with
	addi $t6, $t6, -1 #subtract 1 from the brick hp we collided with
	sw $t6, ($t5) #load the new brick hp back in
	
	addi $sp, $sp, -4   	# Store x
	sw $a0, 0($sp)
	addi $sp, $sp, -4   	# Store Y
	sw $a1, 0($sp)
	addi $sp, $sp, -4   	# Store hp
	sw $t6, 0($sp)
	addi $t7, $t7, 1
CBBTR:
	addi $a0, $s4, 3 #Load x and y values
	addi $a1, $s5, 0
	ble $a0, 3, CBBBL #If x collides with left wall
	bge $a0, 124, CBBBL #if x collides with right wall
	ble $a1, 15, CBBBL #if y collides with top wall
	bge $a1, 91 CBBBL #if y is under the pixel array, mustve collide with a wall or the paddle
	
	jal Get_Bitmap_Coords #We currently have xy in a0 and a1, get the bitmap coords of this location, top left corner
	lw $t4, ($v0) #v0 holds the bitmap address, read the colour from this address
	beq $t4, 0x000000, CBBBL #If the colour is black, no collision, go next
	
	#If we are here, we collided with a brick
	jal Get_Brick_Coords
	la $t5, LEVEL_MAP #Start of level map
	sll $v0, $v0, 2
	add $t5, $t5, $v0 #Level map + brick coords, or the offset
	lw $t6, ($t5) #load in the value at the brick coord.
	
	beq $t6, 7 CBBBL #If unbreakable, skip
	srl $v0, $v0, 2 #get brick coords
	div $a1, $v0 12 #Get y coord
	mfhi $a0 #get x coord
	mul $a0, $a0, 10
	mul $a1, $a1, 5
	addi $a0, $a0, 4
	addi $a1, $a1, 16
	
	jal Erase_Brick #erase the brick we collided with
	addi $t6, $t6, -1 #subtract 1 from the brick hp we collided with
	sw $t6, ($t5) #load the new brick hp back in
	
	addi $sp, $sp, -4   	# Store x
	sw $a0, 0($sp)
	addi $sp, $sp, -4   	# Store Y
	sw $a1, 0($sp)
	addi $sp, $sp, -4   	# Store hp
	sw $t6, 0($sp)
	addi $t7, $t7, 1
CBBBL:
	addi $a0, $s4, 0 #Load x and y values
	addi $a1, $s5, 3
	ble $a0, 3, CBBBR #If x collides with left wall
	bge $a0, 124, CBBBR #if x collides with right wall
	ble $a1, 15, CBBBR #if y collides with top wall
	bge $a1, 91 CBBBR #if y is under the pixel array, mustve collide with a wall or the paddle
	
	jal Get_Bitmap_Coords #We currently have xy in a0 and a1, get the bitmap coords of this location, top left corner
	lw $t4, ($v0) #v0 holds the bitmap address, read the colour from this address
	beq $t4, 0x000000, CBBBR #If the colour is black, no collision, go next
	
	#If we are here, we collided with a brick
	jal Get_Brick_Coords
	la $t5, LEVEL_MAP #Start of level map
	sll $v0, $v0, 2
	add $t5, $t5, $v0 #Level map + brick coords, or the offset
	lw $t6, ($t5) #load in the value at the brick coord.
	
	beq $t6, 7 CBBBR #If unbreakable, skip
	srl $v0, $v0, 2 #get brick coords
	div $a1, $v0 12 #Get y coord
	mfhi $a0 #get x coord
	mul $a0, $a0, 10
	mul $a1, $a1, 5
	addi $a0, $a0, 4
	addi $a1, $a1, 16
	
	jal Erase_Brick #erase the brick we collided with
	addi $t6, $t6, -1 #subtract 1 from the brick hp we collided with
	sw $t6, ($t5) #load the new brick hp back in
	
	addi $sp, $sp, -4   	# Store x
	sw $a0, 0($sp)
	addi $sp, $sp, -4   	# Store Y
	sw $a1, 0($sp)
	addi $sp, $sp, -4   	# Store hp
	sw $t6, 0($sp)
	addi $t7, $t7, 1
CBBBR:
	addi $a0, $s4, 3 #Load x and y values
	addi $a1, $s5, 3
	ble $a0, 3, CBBDone #If x collides with left wall
	bge $a0, 124, CBBDone #if x collides with right wall
	ble $a1, 15, CBBDone #if y collides with top wall
	bge $a1, 91 CBBDone #if y is under the pixel array, mustve collide with a wall or the paddle
	
	jal Get_Bitmap_Coords #We currently have xy in a0 and a1, get the bitmap coords of this location, top left corner
	lw $t4, ($v0) #v0 holds the bitmap address, read the colour from this address
	beq $t4, 0x000000, CBBDone #If the colour is black, no collision, go next
	
	#If we are here, we collided with a brick
	jal Get_Brick_Coords
	la $t5, LEVEL_MAP #Start of level map
	sll $v0, $v0, 2
	add $t5, $t5, $v0 #Level map + brick coords, or the offset
	lw $t6, ($t5) #load in the value at the brick coord.
	
	beq $t6, 7 CBBDone #If unbreakable, skip
	srl $v0, $v0, 2 #get brick coords
	div $a1, $v0 12 #Get y coord
	mfhi $a0 #get x coord
	mul $a0, $a0, 10
	mul $a1, $a1, 5
	addi $a0, $a0, 4
	addi $a1, $a1, 16
	
	jal Erase_Brick #erase the brick we collided with
	addi $t6, $t6, -1 #subtract 1 from the brick hp we collided with
	sw $t6, ($t5) #load the new brick hp back in
	
	addi $sp, $sp, -4   	# Store x
	sw $a0, 0($sp)
	addi $sp, $sp, -4   	# Store Y
	sw $a1, 0($sp)
	addi $sp, $sp, -4   	# Store hp
	sw $t6, 0($sp)
	addi $t7, $t7, 1
CBBDone:


Redraw_Loop_Start:
	beq $t7, 0, Redraw_Loop_End
	lw $t6, 0($sp)     	#Retrieve hp from stack
	addi $sp, $sp, 4
	lw $a1, 0($sp)     	#Retrieve y from stack
	addi $sp, $sp, 4
	lw $a0, 0($sp)     	#Retrieve x from stack
	addi $sp, $sp, 4
	jal Collision_Brick_Redraw
	addi $t7, $t7, -1
	j Redraw_Loop_Start
Redraw_Loop_End:

	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4
	jr $ra


Award_Score: #Add 1 to score
addi $sp, $sp, -4   	# Store ra on stack
sw $ra, 0($sp)
lw $t0, SCORE	#get the score
addi $t0, $t0, 1
sw $t0, SCORE	#save the score
lw $ra, 0($sp)     	#Retrieve ra from stack
addi $sp, $sp, 4   
jr $ra


Collision_Brick_Redraw: #x and y are stored in a0, a1, the hp value is stored in t6
addi $sp, $sp, -4   	# Store ra on stack
sw $ra, 0($sp)

beq $t6, 0, Brick_Destroyed
addi $a2, $t6, 0
jal Draw_Brick
j Collision_Brick_Redraw_Return

Brick_Destroyed:
jal Award_Score

Collision_Brick_Redraw_Return:

lw $ra, 0($sp)     	#Retrieve ra from stack
addi $sp, $sp, 4   
jr $ra



Get_New_Ball_Vel: #Returns the new BALL_VEL in v0 and v1, assuming s0 s1 s2 s3 are the weights
	lw $v0, BALL_VEL	#Ball vel x
	lw $v1, BALL_VEL+4	#Ball vel y
	
gnbv_Left:
bne $s0, 2, gnbv_Right #Left is equal to 2, Bounce left
addi $v0, $zero, -1 #x to negative 1, move left, y unchanged
j gnbv_Done

gnbv_Right:
bne $s1, 2, gnbv_Up #Right is equal to 2, Bounce right
addi $v0, $zero, 1
j gnbv_Done

gnbv_Up:
bne $s2, 2, gnbv_Down #Up is equal to 2, Bounce up
addi $v1, $zero, -1
j gnbv_Done

gnbv_Down:
bne $s3, 2, gnbv_dl #Down is equal to 2, Bounce down
addi $v1, $zero, 1
j gnbv_Done

gnbv_dl:
bne $s0, 1, gnbv_dr 
bne $s3, 1, gnbv_dr 
addi $v0, $zero, -1
addi $v1, $zero, 1
j gnbv_Done

gnbv_dr:
bne $s1, 1, gnbv_ul 
bne $s3, 1, gnbv_ul 
addi $v0, $zero, 1
addi $v1, $zero, 1
j gnbv_Done

gnbv_ul:
bne $s0, 1, gnbv_ur 
bne $s2, 1, gnbv_ur 
addi $v0, $zero, -1
addi $v1, $zero, -1
j gnbv_Done
gnbv_ur:
bne $s1, 1, gnbv_l 
bne $s2, 1, gnbv_l 
addi $v0, $zero, 1
addi $v1, $zero, -1
j gnbv_Done
gnbv_l:
bne $s0, 1, gnbv_r 
addi $v0, $zero, -1 
j gnbv_Done
gnbv_r:
bne $s1, 1, gnbv_u 
addi $v0, $zero, 1 
j gnbv_Done
gnbv_u:
bne $s2, 1, gnbv_d
addi $v1, $zero, -1 
j gnbv_Done
gnbv_d:
bne $s3, 1, gnbv_Done 
addi $v1, $zero, 1 
j gnbv_Done

gnbv_Done:
jr $ra

Get_Bounce_Weights: #Takes in x, y as parameters, knowing it is a collision pixel. 
#xy is a collision, we want to find empty spaces in the surrounding 4
addi $sp, $sp, -4   	# Store ra on stack
sw $ra, 0($sp)


gbl:
	addi $a0, $a0, -1 #x - 1, y, left pixel
	addi $a1, $a1, 0
	jal Get_Bitmap_Coords
	lw $t4, ($v0) #v0 holds the bitmap address, read the colour from this address
	bne $t4, 0x000000, gbr #If the colour is not black, Go next
	addi $s0, $s0, 1 #1 weight to bounce left
gbr:
	addi $a0, $a0, 2 #x + 1, y, right pixel
	addi $a1, $a1, 0
	jal Get_Bitmap_Coords
	lw $t4, ($v0) #v0 holds the bitmap address, read the colour from this address
	bne $t4, 0x000000, gbu #If the colour is not black, Go next
	addi $s1, $s1, 1 #1 weight to bounce right
gbu:
	addi $a0, $a0, -1 #x, y - 1, up pixel
	addi $a1, $a1, -1
	jal Get_Bitmap_Coords
	lw $t4, ($v0) #v0 holds the bitmap address, read the colour from this address
	bne $t4, 0x000000, gbd #If the colour is not black, Go next
	addi $s2, $s2, 1 #1 weight to bounce up
gbd:
	addi $a0, $a0, 0 #x, y + 1, down pixel
	addi $a1, $a1, 2
	jal Get_Bitmap_Coords
	lw $t4, ($v0) #v0 holds the bitmap address, read the colour from this address
	bne $t4, 0x000000, gbdone #If the colour is not black, Go next
	addi $s3, $s3, 1 #1 weight to bounce down
	
gbdone:

lw $ra, 0($sp)     	#Retrieve ra from stack
addi $sp, $sp, 4
jr $ra

##############################################################################
# Ball 
##############################################################################
Update_Ball_Pos: #Ball is currently erased, load coordinates and try to move it
addi $sp, $sp, -4   	# Store ra on stack
sw $ra, 0($sp)
lw $t0, BALL_POS	#Ball X
lw $t1, BALL_POS+4	#Ball Y
lw $t2, BALL_VEL	#Ball vel x
lw $t3, BALL_VEL+4	#Ball vel y

add $a0, $t0, $t2	#New x value
add $a1, $t1, $t3	#New y value

jal Check_Any_Collisions #REDO THIS 

lw $t0, BALL_POS	#Ball X
lw $t1, BALL_POS+4	#Ball Y
add $t2, $t0, $v0 	#New x value
add $t3, $t1, $v1	#New y value

sw $v0, BALL_VEL
sw $v1, BALL_VEL+4
sw $t2, BALL_POS
sw $t3, BALL_POS+4	#Store the new x and y, which should now be valid

bgt $t3, 128, Fall_Off	#If we are under the screen, fall off instead of bouncing

lw $ra, 0($sp)     	#Retrieve ra from stack
addi $sp, $sp, 4
jr $ra			#return


Fall_Off:
lw $t0, LIVES		#Load lives
beq $t0, 0 fall_off_game_over		#if we have no more lives, game over


addi $t0, $t0, -1	#Subtract 1 from lives
sw $t0 LIVES

addi $t0, $zero, 62	#Reset Ball Pos
sw $t0, BALL_POS
addi $t0, $zero, 103
sw $t0, BALL_POS+4
addi $t0, $zero, 0	#Reset Ball Vel
sw $t0, BALL_VEL
sw $t0, BALL_VEL+4

lw $ra, 0($sp)     	#Retrieve ra from stack
addi $sp, $sp, 4
jr $ra

fall_off_game_over:
addi $t0, $zero, 2
sw $t0, GAME_STATE
lw $ra, 0($sp)     	#Retrieve ra from stack
addi $sp, $sp, 4
jr $ra	#Enter game over screen after returning


##############################################################################
# Paddle
##############################################################################
Update_Paddle_Pos: #Paddle is currently erased. Load coordinates and try to move it
lw $t0, PADDLE_POS #X coordinate of the paddle. Y does not matter as we never move it vertically
lw $t1, PADDLE_VEL #X movement of the paddle

add $t2, $t0, $t1 #the new coordinate we try to move it to, quick collision check with walls
bgt $t2, 102, update_paddle_pos_do_nothing #Paddle is 21 long, we must stop as the wall is at 123. If the paddlex is greater than 102, it is in the wall.
blt $t2, 4, update_paddle_pos_do_nothing  #If the paddle is less than 4, it touches the left wall. Either case, do nothing

sw $t2, PADDLE_POS #If we are still here, store the new position, as it is valid
update_paddle_pos_do_nothing:
jr $ra #return

##############################################################################
# Key Inputs
##############################################################################
Get_Key_Press:
	lw $t0, 4($s5) #we know s5 is 1, meaning a key has been pressed, the next spot should be the key that was pressed
	beq $t0, 0x61 Key_A
	beq $t0, 0x64 Key_D
	#If we reached here, the game is moving neither left nor right. If the game were paused or over, we wouldnt be here
	sw $zero, PADDLE_VEL #Paddle does not move
	beq $t0, 0x73 Key_S
	beq $t0, 0x70 Key_P
	beq $t0, 0x71 Key_Q
	beq $t0, 0x72 Key_R

	#If none of these keys are pressed, we treat it as no input, and go back with key return

Key_Return: #return to after input
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra

Key_A: #A and D should only do something if the program is running
	lw $t0, GAME_STATE #Load game state into t0
	bne $t0, 0, main_sleep #If the game state is not 0, or not running, do nothing, just sleep the game and check again
				#Otherwise game is running, try to move paddle left by 1
	addi $t0, $zero, -1 #we load the value -1, or moving 1 to the left
	sw $t0, PADDLE_VEL #Paddle_vel now moves 1 to the left
	j Key_Return

Key_D:
	lw $t0, GAME_STATE #Load game state into t0
	bne $t0, 0, main_sleep #If the game state is not 0, or not running, do nothing, just sleep the game and check again
			#Otherwise game is running, try to move paddle left by 1
	addi $t0, $zero, 1 #we load the value 1, or moving 1 to the right
	sw $t0, PADDLE_VEL #Paddle_vel now moves 1 to the right
	j Key_Return

Key_S: #S only should do something if the ball is stationary, and the game is not paused

	lw $t0, GAME_STATE #Load game state into t0
	bne $t0, 0, main_sleep #If the game state is not 0, or not running, do nothing, just sleep the game and check again
				#Otherwise check ball velocity
	
	lw $t0, BALL_VEL	#Ball x velocity
	lw $t1, BALL_VEL+4 	#Ball y velocity
	
	bne $t0, $t1, Key_Return #If the values are not equal, they cannot both be zero, go to key return and check collisions
	bne $t0, 0, Key_Return 		#now velx and vely are the same, if they arent both zero, go check collisions
					#Now the ball should move down and towards the paddle
					
	addi $t0, $zero, 1 #1
	sw $t0, BALL_VEL+4 	#Ball y is now 1, it moves downwards
	
	lw $t1, PADDLE_POS 	#Load the x position of the paddle
	bge $t1, 55, key_s_right #if paddlex is more than 55, the halfway value, then it must be closer to the right side
key_s_left:
	addi $t0, $zero, -1 
	sw $t0, BALL_VEL	#Ball x is -1, moves left
	j Key_Return
key_s_right:
	sw $t0, BALL_VEL	#Ball x is now 1, moves right
	j Key_Return


Key_P: #Pause and unpause the game, depending on the current gamestate
lw $t0, GAME_STATE
beq $t0, 1, unpause
beq $t0, 0, pause
j Key_Return #Other wise the game is over, return doing nothing
pause:
jal Write_Paused
addi $t0, $zero, 1
sw $t0, GAME_STATE #Game is now paused, gamestate = 1
j Key_Return

unpause:
jal Erase_Paused
addi $t0, $zero, 0
sw $t0, GAME_STATE #Game is now unpaused, gamestate = 0
j Key_Return
Key_Q: #Quit the game, depending on the current gamestate
lw $t0, GAME_STATE
beq $t0, 2, END #If we are in the gameover state, we will end the game
addi $t0, $zero, 2
sw $t0, GAME_STATE #Otherwise we will now end the game
j Key_Return
Key_R: #If the game is over, restart
lw $t0, GAME_STATE
beq $t0, 2, main #If we are in the gameover state, Restart

#Otherwise do nothing
j Key_Return




##############################################################################
# Drawing
##############################################################################
Write_Labels:
	addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	
 	addi $a0, $zero, 5
 	addi $a1, $zero, 3
 	jal Write_L
 	
 	addi $a0, $zero, 10
 	addi $a1, $zero, 3
 	jal Write_I
 	
 	addi $a0, $zero, 14
 	addi $a1, $zero, 3
 	jal Write_V
 	
 	addi $a0, $zero, 19
 	addi $a1, $zero, 3
 	jal Write_E
 	
 	addi $a0, $zero, 24
 	addi $a1, $zero, 3
 	jal Write_S
 	
 	addi $a0, $zero, 33
 	addi $a1, $zero, 3
 	jal Write_Heart
 	
 	
 	addi $a0, $zero, 81
 	addi $a1, $zero, 3
 	jal Write_S
 	
 	addi $a0, $zero, 86
 	addi $a1, $zero, 3
 	jal Write_C
 	
 	addi $a0, $zero, 91
 	addi $a1, $zero, 3
 	jal Write_O
 	
 	addi $a0, $zero, 96
 	addi $a1, $zero, 3
 	jal Write_R
 	
 	addi $a0, $zero, 101
 	addi $a1, $zero, 3
 	jal Write_E
 
 	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4   
	jr $ra

Write_Paused:
addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	
	addi $a0, $zero, 49
 	addi $a1, $zero, 3
 	jal Write_P
 	addi $a0, $zero, 54
 	addi $a1, $zero, 3
 	jal Write_A
 	addi $a0, $zero, 59
 	addi $a1, $zero, 3
 	jal Write_U
 	addi $a0, $zero, 64
 	addi $a1, $zero, 3
 	jal Write_S
	addi $a0, $zero, 69
 	addi $a1, $zero, 3
 	jal Write_E
 	addi $a0, $zero, 74
 	addi $a1, $zero, 3
 	jal Write_D
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4   
	jr $ra

Erase_Paused:
addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	jal Set_Black
	addi $a0, $zero, 48
 	addi $a1, $zero, 3
 	addi $a2, $zero, 30
 	addi $a3, $zero, 6
 	jal Draw_Rect

lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4   
	jr $ra
	
Write_Score: 
addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
jal Set_Yellow #set colour to yellow
lw $t8, SCORE

li $t7, 100
div $t8, $t7 #Get the hundred's digit
mflo $a2
mfhi $t8

	addi $a0, $zero, 109
 	addi $a1, $zero, 3
jal Write_Num

li $t7, 10
div $t8, $t7 #Get the ten's digit
mflo $a2
mfhi $t8
addi $a0, $zero, 114
 	addi $a1, $zero, 3
jal Write_Num
addi $a2, $t8, 0
addi $a0, $zero, 119
 	addi $a1, $zero, 3
jal Write_Num

lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4   
	jr $ra

Write_Lives: #Takes in x, y, colour
addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	jal Set_Red #set colour to Red
	
	lw $a2, LIVES
	addi $a0, $zero, 41
 	addi $a1, $zero, 3
jal Write_Num
	
lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4   
	jr $ra



Clear: #No args, clears the screen with black
	addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)      
	jal Set_Black		#Set colour to black  
	
	addi $a0, $zero, 0 	#x,y = 0, width height = 128. Full screen
	addi $a1, $zero, 0
	addi $a2, $zero, 128
	addi $a3, $zero, 128     
	jal Draw_Rect		#Draw rectangle the size of the screeen
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4   
	jr $ra


Draw_Rect: #Takes 4 args, x, y, width, height, draws with current colour 
	addi $sp, $sp, -4   # Store ra on stack
	sw $ra, 0($sp)      
	jal Get_Bitmap_Coords #Convert 	x and y into bitmap coords, they should be in a0 and a1 already
	lw $ra, 0($sp)     #Retrieve ra from stack
	addi $sp, $sp, 4    
	add $t0, $v0, $zero #t0 holds the position to start drawing
	add $t1, $a2, $zero #width
	add $t2, $a3, $zero #height
draw_rect_y_loop:
	beq $t2, $zero, end_draw_rect_y_loop #Height 0, we are done
draw_rect_x_loop:
	beq $t1, $zero, end_draw_rect_x_loop #width 0, we are done this loop
	sw $s7, 0($t0)			# Set current pixel to current colour
	addi $t0, $t0, 4		# move the current drawing location to the right.
	addi $t1, $t1, -1		# decrement the width variable
	j draw_rect_x_loop			# repeat the inner loop
end_draw_rect_x_loop:
	addi $t2, $t2, -1		# decrement the height variable
	add $t1, $zero, $a2		# reset the width variable to $a1
	addi $t0, $t0, 512		# move $t0 to the next line
	sll $t4, $t1, 2			# convert pixels to bytes
	sub $t0, $t0, $t4		# move $t0 to the first pixel to draw in this line.
	j draw_rect_y_loop			# Go back to top
end_draw_rect_y_loop:
	jr $ra

Draw_Stage: #Read in a stage, display it
addi $sp, $sp, -4   	# Store ra on stack
sw $ra, 0($sp)

la $s0, LEVEL_LOADED #Load in level, place it in s0
la $s2, LEVEL_MAP #load in our level map to s2, we will match it with our level
addi $s1, $zero, 180 #use s1 as increment, there are 180 bricks on a level
stage_loop:
beq $s1, 0, stage_loop_end
addi $s1, $s1, -1
sll $t1, $s1, 2		#get number of byte offshift
add $t0, $s0, $t1	#address of level + increment
add $s3, $s2, $t1	#address of levelmap + increment

lw $a2, 0($t0)		#load in value, or hp
sw $a2, 0($s3)
beq $a2, 0 stage_loop #if the value is 0, just skip, nothing to do
addi $t3, $zero, 12
div $s1, $t3		#increment divided by 15
mfhi $a0		#remainder is the x
mflo $a1 		#quotient is y

mul $a0, $a0, 10	#bricks are 10x5
mul $a1, $a1, 5

addi $a0, $a0, 4
addi $a1, $a1, 16	#pixel offsets from walls
#now a0, a1, a2 contain x, y, hp
beq $a2, 7, stage_loop_unbreakabrick #if $a2, the hp, is 7, brick is unbreakable
	jal Draw_Brick
	j stage_loop
stage_loop_unbreakabrick:
	jal Draw_Unbreakabrick
	j stage_loop

stage_loop_end:
lw $ra, 0($sp)     	#Retrieve ra from stack
addi $sp, $sp, 4   
jr $ra

Draw_Unbreakabrick: #Takes x y values
	addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	jal Set_Light_Gray
	
	addi $a2, $zero, 10 #bricks are 10 wide, 5 tall
	addi $a3, $zero, 5
	jal Draw_Rect       #Draw a light gray brick, 10 wide, 5 tall at x, y
	
	jal Set_Dark_Gray
	addi $a0, $a0, 1	#Now we draw a coloured 8x3 brick inside of the larger gray brick
	addi $a1, $a1, 1
	addi $a2, $zero, 8
	addi $a3, $zero, 3
	jal Draw_Rect
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra	

Draw_Brick: #Takes in x y values, and brick hp as parameters
	add $t5, $zero, $a2 #store the brick hp in t5, a0 and a1 hold the x and y coords of the brick
	addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	jal Set_Dark_Gray
	
	addi $a2, $zero, 10 #bricks are 10 wide, 5 tall
	addi $a3, $zero, 5
	jal Draw_Rect       #Draw a dark gray brick, 10 wide, 5 tall at x, y
	
	add $t4, $a0, $zero        #temporarily place x coord into t4
	add $a0, $t5, $zero		#place hp into a0
	jal Set_Colour		#Pick a colour based off of the a0 value,
	
	addi $a0, $t4, 1	#Now we draw a coloured 8x3 brick inside of the larger gray brick
	addi $a1, $a1, 1
	addi $a2, $zero, 8
	addi $a3, $zero, 3
	jal Draw_Rect
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra	
	
Erase_Brick: #takes in x y values
	addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	jal Set_Black
	
	addi $a2, $zero, 10 #bricks are 10 wide, 5 tall
	addi $a3, $zero, 5
	jal Draw_Rect
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra	

Draw_Walls: #Draws the 3 walls at the top and sides. Only needs to be called once as we never break the walls
	addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)      
	jal Set_Gray		#Set colour to Gray, wall colour
	
	addi $a0, $zero, 0 	#x,y = (0, 8), width height = (128, 4). Top Wall
	addi $a1, $zero, 12
	addi $a2, $zero, 128
	addi $a3, $zero, 4
	jal Draw_Rect
	
	addi $a0, $zero, 0 	#x,y = (0, 8), width height = (128, 4). BOTTOM WALL, USE FOR TESTING
	addi $a1, $zero, 125
	addi $a2, $zero, 128
	addi $a3, $zero, 4
	#jal Draw_Rect		#I have it commented out here

	
	addi $a0, $zero, 124 	#x,y = (123, 0), width height = (4, 128). Left Wall
	addi $a1, $zero, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 128
	jal Draw_Rect
	
	addi $a0, $zero, 0 	#x,y = (0, 0), width height = (4, 128). Right Wall
	addi $a1, $zero, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 128
	jal Draw_Rect
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra			#return


Draw_Ball: #takes the current ball position from memory, draws ball
	lw $t5, BALL_POS #x value
	lw $t6, BALL_POS+4 #y value

	addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)      
	jal Set_White		#Set colour to white, ball colour
	#The ball is a 4x4, but drawn to look kinda circular, I will do this in 2 steps
	
	addi $a0, $t5, 1 	#x,y = x+1, y, width height = (2,4)  Ball 1
	addi $a1, $t6, 0
	addi $a2, $zero, 2
	addi $a3, $zero, 4
	jal Draw_Rect
	
	addi $a0, $t5, 0 	#x,y = x, y+1, width height = (4,2)  Ball 2
	addi $a1, $t6, 1
	addi $a2, $zero, 4
	addi $a3, $zero, 2
	jal Draw_Rect
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra			#return



Erase_Ball: #Takes the prev ball pos as a parameter, same as draw ball, but erases
	lw $t5, BALL_POS #x value
	lw $t6, BALL_POS+4 #y value

	addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)      
	jal Set_Black		#Set colour to Black
	#The ball is a 4x4 in terms of hitbox
	
	addi $a0, $t5, 1 	#x,y = x+1, y, width height = (2,4)  Ball 1
	addi $a1, $t6, 0
	addi $a2, $zero, 2
	addi $a3, $zero, 4
	jal Draw_Rect
	
	addi $a0, $t5, 0 	#x,y = x, y+1, width height = (4,2)  Ball 2
	addi $a1, $t6, 1
	addi $a2, $zero, 4
	addi $a3, $zero, 2
	jal Draw_Rect
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra			#return

Draw_Paddle:
	lw $t5, PADDLE_POS #x value
	lw $t6, PADDLE_POS+4 #y value

	addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)      
	jal Set_White		#Set colour to white, paddle colour
	
	addi $a0, $t5, 0 	#x,y = x, y, width height = (21, 4)
	addi $a1, $t6, 0
	addi $a2, $zero, 21
	addi $a3, $zero, 4
	jal Draw_Rect
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra			#return

Erase_Paddle: #Same as erase ball. Draws a black rectangle over where the paddle used to be
	lw $t5, PADDLE_POS #x value
	lw $t6, PADDLE_POS+4 #y value

	addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)      
	jal Set_Black		#Set colour to Black
	
	addi $a0, $t5, 0 	#x,y = x, y, width height = (21, 4)
	addi $a1, $t6, 0
	addi $a2, $zero, 21
	addi $a3, $zero, 4
	jal Draw_Rect
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra			#return

Draw_Game_Over:
addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)   
	addi $a0, $zero, 44
 	addi $a1, $zero, 37
 	jal Write_G
 	addi $a0, $zero, 49
 	addi $a1, $zero, 37
 	jal Write_A
 	addi $a0, $zero, 54
 	addi $a1, $zero, 37
 	jal Write_M
 	addi $a0, $zero, 59
 	addi $a1, $zero, 37
 	jal Write_E
 	
 	addi $a0, $zero, 67
 	addi $a1, $zero, 37
 	jal Write_O
 	addi $a0, $zero, 72
 	addi $a1, $zero, 37
 	jal Write_V
 	addi $a0, $zero, 77
 	addi $a1, $zero, 37
 	jal Write_E
 	addi $a0, $zero, 82
 	addi $a1, $zero, 37
 	jal Write_R
 	
 	addi $a0, $zero, 58
 	addi $a1, $zero, 52
 	jal Write_Skull
 	
 	addi $a0, $zero, 21
 	addi $a1, $zero, 83
 	jal Write_P
 	addi $a0, $zero, 26
 	addi $a1, $zero, 83
 	jal Write_R
 	addi $a0, $zero, 31
 	addi $a1, $zero, 83
 	jal Write_E
 	addi $a0, $zero, 36
 	addi $a1, $zero, 83
 	jal Write_S
 	addi $a0, $zero, 41
 	addi $a1, $zero, 83
 	jal Write_S
 	
 	addi $a0, $zero, 49
 	addi $a1, $zero, 83
 	jal Write_R
 	
 	addi $a0, $zero, 57
 	addi $a1, $zero, 83
 	jal Write_T
 	addi $a0, $zero, 61
 	addi $a1, $zero, 83
 	jal Write_O
 	
 	addi $a0, $zero, 69
 	addi $a1, $zero, 83
 	jal Write_T
 	addi $a0, $zero, 73
 	addi $a1, $zero, 83
 	jal Write_R
 	addi $a0, $zero, 78
 	addi $a1, $zero, 83
 	jal Write_Y
 	
 	addi $a0, $zero, 85
 	addi $a1, $zero, 83
 	jal Write_A
 	addi $a0, $zero, 90
 	addi $a1, $zero, 83
 	jal Write_G
 	addi $a0, $zero, 95
 	addi $a1, $zero, 83
 	jal Write_A
 	addi $a0, $zero, 100
 	addi $a1, $zero, 83
 	jal Write_I
 	addi $a0, $zero, 104
 	addi $a1, $zero, 83
 	jal Write_N
	
lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra	
##############################################################################
# Graphical
##############################################################################
Set_Colour: #takes 1 parameter, a number from 1 to 7
	addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)

	beq $a0, 0, set_colour_end
	beq $a0, 1, Pick_Green   #The extra parameter represents the hp of the brick. I will colour it differently depending on hp
	beq $a0, 2, Pick_Yellow
	beq $a0, 3, Pick_Red
	beq $a0, 4, Pick_Cyan
	beq $a0, 5, Pick_Blue
	beq $a0, 6, Pick_Purple
	beq $a0, 7, Pick_Black
	
set_colour_end: 
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra			#return

Pick_Green: #Green was not the impostor
jal Set_Green
j set_colour_end

Pick_Yellow: #Yellow was not the impostor
jal Set_Yellow
j set_colour_end

Pick_Red: #Red was not the impostor
jal Set_Red
j set_colour_end

Pick_Cyan: #Cyan was not the impostor
jal Set_Cyan
j set_colour_end

Pick_Blue: #Blue was not the impostor
jal Set_Blue
j set_colour_end

Pick_Purple: #Purple was not the impostor
jal Set_Purple
j set_colour_end

Pick_Black: #Black was not the impostor
jal Set_Black
j set_colour_end

Set_Green:
la $s6, BRICK_COLOURS #Set colour to green
lw $s7, ($s6)
jr $ra
Set_Yellow:
la $s6, BRICK_COLOURS+4 #Set colour to yellow
lw $s7, ($s6)
jr $ra
Set_Red:
la $s6, BRICK_COLOURS+8 #Set colour to red
lw $s7, ($s6)
jr $ra
Set_Cyan:
la $s6, BRICK_COLOURS+12 #Set colour to cyan
lw $s7, ($s6)
jr $ra
Set_Blue:
la $s6, BRICK_COLOURS+16 #Set colour to blue
lw $s7, ($s6)
jr $ra
Set_Purple:
la $s6, BRICK_COLOURS+20 #Set colour to purple
lw $s7, ($s6)
jr $ra
Set_Black:
la $s6, GAME_COLOURS #Set colour to black
lw $s7, ($s6)
jr $ra
Set_Dark_Gray:
la $s6, GAME_COLOURS+4 #Set colour to darkt gray
lw $s7, ($s6)
jr $ra
Set_Gray: 
la $s6, GAME_COLOURS+8 #Set colour to gray
lw $s7, ($s6)
jr $ra
Set_Light_Gray:
la $s6, GAME_COLOURS+12 #Set colour to light gray
lw $s7, ($s6)
jr $ra
Set_White: #Set colour to light gray
la $s6, GAME_COLOURS+16
lw $s7, ($s6)
jr $ra

#ALL OF THESE WILL TAKE IN X AND Y, AND DRAW THE LETTER FROM THE TOP LEFT COORD
Write_A:
	addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	jal Set_White
	
	addi $a0, $t6, 1
	addi $a1, $t7, 0
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect 
	
	addi $a0, $t6, 1
	addi $a1, $t7, 3
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect 
	
	addi $a0, $t6, 0
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 5
	jal Draw_Rect 
	
	addi $a0, $t6, 3
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 5
	jal Draw_Rect 
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra

Write_C:
addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	jal Set_White
	
	addi $a0, $t6, 1
	addi $a1, $t7, 0
	addi $a2, $zero, 3
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 4
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 5
	addi $a2, $zero, 3
	addi $a3, $zero, 1
	jal Draw_Rect 
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra
Write_D:
addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	jal Set_White
	
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 1
	addi $a3, $zero, 6
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 3
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 5
	addi $a2, $zero, 3
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 3
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 4
	jal Draw_Rect 
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra
Write_E:
addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	jal Set_White
	
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 1
	addi $a3, $zero, 6
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 2
	addi $a2, $zero, 3
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 5
	addi $a2, $zero, 4
	addi $a3, $zero, 1
	jal Draw_Rect 
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra
Write_G:
addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	jal Set_White
	
	addi $a0, $t6, 0
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 4
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 0
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 3
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 5
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 2
	addi $a1, $t7, 3
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 3
	addi $a1, $t7, 3
	addi $a2, $zero, 1
	addi $a3, $zero, 2
	jal Draw_Rect 
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra
Write_I:
addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 3
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	jal Set_White
	
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 3
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 5
	addi $a2, $zero, 3
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 0
	addi $a2, $zero, 1
	addi $a3, $zero, 6
	jal Draw_Rect 
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra
Write_L:
addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	jal Set_White
	
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 1
	addi $a3, $zero, 6
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 5
	addi $a2, $zero, 4
	addi $a3, $zero, 1
	jal Draw_Rect 
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra
Write_M:
addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	jal Set_White
	
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 1
	addi $a3, $zero, 6
	jal Draw_Rect 
	addi $a0, $t6, 3
	addi $a1, $t7, 0
	addi $a2, $zero, 1
	addi $a3, $zero, 6
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 1
	addi $a2, $zero, 2
	addi $a3, $zero, 2
	jal Draw_Rect 
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra
	
Write_N:
addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	jal Set_White
	
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 1
	addi $a3, $zero, 6
	jal Draw_Rect 
	addi $a0, $t6, 3
	addi $a1, $t7, 0
	addi $a2, $zero, 1
	addi $a3, $zero, 6
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 2
	jal Draw_Rect 
	addi $a0, $t6, 2
	addi $a1, $t7, 2
	addi $a2, $zero, 1
	addi $a3, $zero, 2
	jal Draw_Rect 
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra
	
Write_O:
addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	jal Set_White
	
	addi $a0, $t6, 1
	addi $a1, $t7, 0
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 4
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 5
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 3
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 4
	jal Draw_Rect 
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra
Write_P:
addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	jal Set_White
	
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 1
	addi $a3, $zero, 6
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 3
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 3
	addi $a2, $zero, 3
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 3
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 2
	jal Draw_Rect 
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra
Write_R:
addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	jal Set_White
	
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 1
	addi $a3, $zero, 6
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 3
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 3
	addi $a2, $zero, 3
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 3
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 2
	jal Draw_Rect 
	addi $a0, $t6, 2
	addi $a1, $t7, 3
	addi $a2, $zero, 1
	addi $a3, $zero, 2
	jal Draw_Rect 
	addi $a0, $t6, 3
	addi $a1, $t7, 5
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect 
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra
Write_S:
addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	jal Set_White
	
	addi $a0, $t6, 1
	addi $a1, $t7, 0
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 3
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 2
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 2
	addi $a1, $t7, 3
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 4
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 3
	addi $a1, $t7, 4
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 5
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect 
	
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra
Write_T:
addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 3
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	jal Set_White
	
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 3
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 0
	addi $a2, $zero, 1
	addi $a3, $zero, 6
	jal Draw_Rect 
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra
Write_U:
addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	jal Set_White
	
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 1
	addi $a3, $zero, 5
	jal Draw_Rect 
	addi $a0, $t6, 3
	addi $a1, $t7, 0
	addi $a2, $zero, 1
	addi $a3, $zero, 5
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 5
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect 
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra
Write_V:
addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	jal Set_White
	
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 1
	addi $a3, $zero, 4
	jal Draw_Rect 
	addi $a0, $t6, 3
	addi $a1, $t7, 0
	addi $a2, $zero, 1
	addi $a3, $zero, 4
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 4
	addi $a2, $zero, 2
	addi $a3, $zero, 2
	jal Draw_Rect 
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra
	
Write_Y:
addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 3
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	jal Set_White
	
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 1
	addi $a3, $zero, 2
	jal Draw_Rect 
	addi $a0, $t6, 2
	addi $a1, $t7, 0
	addi $a2, $zero, 1
	addi $a3, $zero, 2
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 2
	addi $a2, $zero, 1
	addi $a3, $zero, 4
	jal Draw_Rect 
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra
	
	
Write_Num: #a0 a1 x y, a2 num, 
addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	
	beq $a2, 0, Write_0
	beq $a2, 1, Write_1
	beq $a2, 2, Write_2
	beq $a2, 3, Write_3
	beq $a2, 4, Write_4
	beq $a2, 5, Write_5
	beq $a2, 6, Write_6
	beq $a2, 7, Write_7
	beq $a2, 8, Write_8
	beq $a2, 9, Write_9
	
Write_Num_End:
lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra

Write_0:
	addi $sp, $sp, -4   	# Store colour on stack
	sw $s7, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	lw $s7, 0($sp)     	#Retrieve colour from stack
	addi $sp, $sp, 4 
	
	addi $a0, $t6, 1
	addi $a1, $t7, 3
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 2
	addi $a1, $t7, 2
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 0
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 4
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 5
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 3
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 4
	jal Draw_Rect 
	
	j Write_Num_End
Write_1:
addi $sp, $sp, -4   	# Store colour on stack
	sw $s7, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	lw $s7, 0($sp)     	#Retrieve colour from stack
	addi $sp, $sp, 4 
	
	addi $a0, $t6, 0
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 0
	addi $a2, $zero, 1
	addi $a3, $zero, 6
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 5
	addi $a2, $zero, 3
	addi $a3, $zero, 1
	jal Draw_Rect 
	
	j Write_Num_End
Write_2:
addi $sp, $sp, -4   	# Store colour on stack
	sw $s7, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	lw $s7, 0($sp)     	#Retrieve colour from stack
	addi $sp, $sp, 4 
	
	addi $a0, $t6, 0
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 0
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 3
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 2
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 3
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 4
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 5
	addi $a2, $zero, 4
	addi $a3, $zero, 1
	jal Draw_Rect 
	
	j Write_Num_End
Write_3:
addi $sp, $sp, -4   	# Store colour on stack
	sw $s7, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	lw $s7, 0($sp)     	#Retrieve colour from stack
	addi $sp, $sp, 4 
	
	addi $a0, $t6, 0
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 0
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 3
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 2
	addi $a1, $t7, 2
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 3
	addi $a1, $t7, 3
	addi $a2, $zero, 1
	addi $a3, $zero, 2
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 4
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 5
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect 
	
	j Write_Num_End
Write_4:
addi $sp, $sp, -4   	# Store colour on stack
	sw $s7, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	lw $s7, 0($sp)     	#Retrieve colour from stack
	addi $sp, $sp, 4 
	
	addi $a0, $t6, 0
	addi $a1, $t7, 2
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 2
	addi $a1, $t7, 0
	addi $a2, $zero, 1
	addi $a3, $zero, 6
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 3
	addi $a2, $zero, 4
	addi $a3, $zero, 1
	jal Draw_Rect 
	
	j Write_Num_End
Write_5:
addi $sp, $sp, -4   	# Store colour on stack
	sw $s7, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	lw $s7, 0($sp)     	#Retrieve colour from stack
	addi $sp, $sp, 4 
	
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 1
	addi $a3, $zero, 3
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 2
	addi $a2, $zero, 3
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 3
	addi $a1, $t7, 3
	addi $a2, $zero, 1
	addi $a3, $zero, 2
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 4
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 5
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect 
	
	j Write_Num_End
Write_6:
addi $sp, $sp, -4   	# Store colour on stack
	sw $s7, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	lw $s7, 0($sp)     	#Retrieve colour from stack
	addi $sp, $sp, 4 
	
	addi $a0, $t6, 1
	addi $a1, $t7, 0
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 4
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 2
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 5
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 3
	addi $a1, $t7, 3
	addi $a2, $zero, 1
	addi $a3, $zero, 2
	jal Draw_Rect 
	
	j Write_Num_End
Write_7:
addi $sp, $sp, -4   	# Store colour on stack
	sw $s7, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	lw $s7, 0($sp)     	#Retrieve colour from stack
	addi $sp, $sp, 4 
	
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 3
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 2
	addi $a1, $t7, 2
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 3
	addi $a2, $zero, 1
	addi $a3, $zero, 3
	jal Draw_Rect 
	
	j Write_Num_End
Write_8:
addi $sp, $sp, -4   	# Store colour on stack
	sw $s7, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	lw $s7, 0($sp)     	#Retrieve colour from stack
	addi $sp, $sp, 4 
	
	addi $a0, $t6, 1
	addi $a1, $t7, 0
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 3
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 2
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 3
	addi $a2, $zero, 1
	addi $a3, $zero, 2
	jal Draw_Rect 
	addi $a0, $t6, 3
	addi $a1, $t7, 3
	addi $a2, $zero, 1
	addi $a3, $zero, 2
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 5
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect 
	
	j Write_Num_End
Write_9:
addi $sp, $sp, -4   	# Store colour on stack
	sw $s7, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 4
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	lw $s7, 0($sp)     	#Retrieve colour from stack
	addi $sp, $sp, 4 
	
	addi $a0, $t6, 1
	addi $a1, $t7, 0
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 2
	jal Draw_Rect 
	addi $a0, $t6, 3
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 4
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 3
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect 
	addi $a0, $t6, 1
	addi $a1, $t7, 5
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect 
	
	j Write_Num_End
	
Write_Heart:

addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	jal Set_Black
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 7
	addi $a3, $zero, 6
	jal Draw_Rect #clear space for the character
	jal Set_Red
	
	addi $a0, $t6, 1
	addi $a1, $t7, 0
	addi $a2, $zero, 5
	addi $a3, $zero, 4
	jal Draw_Rect 
	addi $a0, $t6, 0
	addi $a1, $t7, 1
	addi $a2, $zero, 7
	addi $a3, $zero, 2
	jal Draw_Rect 
	addi $a0, $t6, 2
	addi $a1, $t7, 1
	addi $a2, $zero, 3
	addi $a3, $zero, 4
	jal Draw_Rect 
	addi $a0, $t6, 3
	addi $a1, $t7, 5
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect 
	jal Set_Black
	addi $a0, $t6, 3
	addi $a1, $t7, 0
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect 
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra
Write_Skull: #takes an xy, draws a skull
addi $sp, $sp, -4   	# Store ra on stack
	sw $ra, 0($sp)
	jal Set_Dark_Gray
	addi $t6, $a0, 0
	addi $t7, $a1, 0 #saving x and y
	addi $a0, $t6, 0
	addi $a1, $t7, 0
	addi $a2, $zero, 13
	addi $a3, $zero, 13
	jal Draw_Rect
	
	jal Set_White
	addi $a0, $t6, 2
	addi $a1, $t7, 2
	addi $a2, $zero, 9
	addi $a3, $zero, 9
	jal Draw_Rect
	
	jal Set_Black
	addi $a0, $t6, 1
	addi $a1, $t7, 3
	addi $a2, $zero, 1
	addi $a3, $zero, 7
	jal Draw_Rect
	addi $a0, $t6, 2
	addi $a1, $t7, 2
	addi $a2, $zero, 1
	addi $a3, $zero, 2
	jal Draw_Rect
	addi $a0, $t6, 2
	addi $a1, $t7, 9
	addi $a2, $zero, 1
	addi $a3, $zero, 3
	jal Draw_Rect
	addi $a0, $t6, 2
	addi $a1, $t7, 6
	addi $a2, $zero, 2
	addi $a3, $zero, 2
	jal Draw_Rect
	addi $a0, $t6, 3
	addi $a1, $t7, 1
	addi $a2, $zero, 1
	addi $a3, $zero, 2
	jal Draw_Rect
	addi $a0, $t6, 3
	addi $a1, $t7, 1
	addi $a2, $zero, 7
	addi $a3, $zero, 1
	jal Draw_Rect
	addi $a0, $t6, 9
	addi $a1, $t7, 2
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect
	addi $a0, $t6, 10
	addi $a1, $t7, 3
	addi $a2, $zero, 2
	addi $a3, $zero, 1
	jal Draw_Rect
	addi $a0, $t6, 5
	addi $a1, $t7, 7
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect
	addi $a0, $t6, 7
	addi $a1, $t7, 6
	addi $a2, $zero, 2
	addi $a3, $zero, 2
	jal Draw_Rect
	addi $a0, $t6, 2
	addi $a1, $t7, 11
	addi $a2, $zero, 8
	addi $a3, $zero, 1
	jal Draw_Rect
	addi $a0, $t6, 6
	addi $a1, $t7, 10
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect
	addi $a0, $t6, 4
	addi $a1, $t7, 10
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect
	addi $a0, $t6, 8
	addi $a1, $t7, 9
	addi $a2, $zero, 3
	addi $a3, $zero, 2
	jal Draw_Rect
	addi $a0, $t6, 10
	addi $a1, $t7, 8
	addi $a2, $zero, 1
	addi $a3, $zero, 1
	jal Draw_Rect
	addi $a0, $t6, 11
	addi $a1, $t7, 4
	addi $a2, $zero, 1
	addi $a3, $zero, 6
	jal Draw_Rect
	
	lw $ra, 0($sp)     	#Retrieve ra from stack
	addi $sp, $sp, 4  
	jr $ra



END:
jal Clear
addi $v0, $zero, 10
syscall








