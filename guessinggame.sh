# File: guessinggame.sh

actual=$(ls -l | grep ^- | wc -l)

function isNumeric() {
    if [[ ! $@ =~ ^[0-9]+$ ]]
    then
        echo "'$@' is not a number. Try again..."
        false
    fi    
}

function isCorrect() {
    if [[ $1 -eq $actual ]]
    then
        echo "'$1' is correct! Congratulations!!!"
    else
        false
    fi
}

function giveHint() {
    if [[ $1 -lt $actual ]]
    then
        echo $"'$1' is too low! Try again..."
    else
        echo $"'$1' is too high! Try again..."
    fi    
}

while true
do
    echo ""
    echo "How many files are in the current directory?"
    read guess

    ! isNumeric $guess && continue
    isCorrect $guess && break
    giveHint $guess
done
