#!/bin/bash
# This is required at the beginning of the script. Indicates in which language it will be written
# # -> Sharp
# ! -> Bang
# #! -> Shebang

# This scrip displays various information to the screen

# Display 'Hello'
echo 'Hello'

# Assign a value to a variables
WORD='script'
# WORD1 is a valid variable name
# _WORD is a valid vaiable name
# 1WORD is NOT a valid vaiable name
# A-WORD is NOT a valid variable name

# Display the value from the key pairs WORD='script'. (Display the variable WORD)
# It is obligatory for the variable to be enclosed in double quotes and to be preceded by a dollar sign
echo "$WORD"

# Demonstrate thet single quotes couse variables to NOT get expanded
echo '$WORD'

# Combine the variable with hard-coded text
echo "This is a shell $WORD"

# Display the content of the variable using an alternative syntax
echo "This is a shell ${WORD} - using curly brackets"

# Append text to the variable
echo "${WORD}ing is fun - append with curly brackets"

# Show how NOT to append text to a variable
echo "$WORDing is fun - append without curly brackets"

# Create a new variable
ENDING='ed'

# Combine the two variables
echo "This is ${WORD}${ENDING}"

# Change the value stored in the ENDING variable (Reassignment)
ENDING='ing'

# Combine again the two variables
echo "This is ${WORD}${ENDING}"

# Reassign value to ENDING again
ENDING='s'

# Combine and display agai
echo "You are going to write many ${WORD}${ENDING}"
