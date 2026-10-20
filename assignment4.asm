.data
    prompt1:    .asciiz     "Player 1: Enter a number between 1 and 10: "
    prompt2:    .asciiz     "Next Player"
    prompt3:    .asciiz     "Please enter your guess between 1 and 10: "
    gaPrompt:   .asciiz     "Please guess again!"
    winPrompt:  .asciiz     "YOU WIN!"

.text
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall
    move $v0, $t0

    li $v0, 11
    li $a0, '\n'
    syscall

    li $v0, 4
    la $a0, prompt2
    syscall

guessLoop:
    beq $t0, $t1, correctGuess
    li $v0, 11
    li $a0, '\n'
    syscall

    li $v0, 4
    la $a0, prompt3
    syscall

    li $v0, 5
    syscall
    move $v0, $t1

incorrectGuess:
    li $v0, 5
    la $a0, gaPrompt
    syscall

    j guessLoop

correctGuess:
    li $v0, 5
    la $a0, winPrompt
    syscall

    li $v0, 10
    syscall
