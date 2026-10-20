# Not really sure if this needs much comment documentation but as always, no AI was used in making this.
# Like you mentioned, this code was really no trouble at all, but it was still fun to do because it really
# showed me just how much I've learned. None of this was at all difficult, but it was pretty satisfying to
# be able to knock this out in just a few minutes compared to the beginning of the semester when it all felt
# like magic.
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
    move $t0, $v0

    li $v0, 11
    li $a0, '\n'
    syscall

    li $v0, 4
    la $a0, prompt2
    syscall

# Branches if the guess is correct, otherwise loops back to guessLoop for another pass.
guessLoop:
    li $v0, 11
    li $a0, '\n'
    syscall

    li $v0, 4
    la $a0, prompt3
    syscall

    li $v0, 5
    syscall
    move $t1, $v0
    
    beq $t0, $t1, correctGuess

# Wound up not using this label but probably good practice to keep it in just for readability.
incorrectGuess:
    li $v0, 4
    la $a0, gaPrompt
    syscall

    j guessLoop

correctGuess:
    li $v0, 4
    la $a0, winPrompt
    syscall

    li $v0, 10
    syscall
