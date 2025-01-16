#!/bin/bash
# Number random generator
PSQL="psql --username=freecodecamp --dbname=gamers -t --no-align -c"
SECRET_NUMBER=$((RANDOM % 1000 + 1))
# SECRET_NUMBER=500
TRIES=0

FORMAT_STRING() {
  echo "$(echo $1 | sed -E 's/^ *| *$//g')"
}

RANDOM_NUMBER() {
  if [[ ! -z $1 ]]; then
    echo -e "\n$1"
  fi 
  while true; do
    read INPUT_NUMBER
    TRIES=$((TRIES + 1))

    # Validar que el input sea un número entero
    if [[ $INPUT_NUMBER =~ ^[0-9]+$ ]]; then
      if [[ $INPUT_NUMBER -gt $SECRET_NUMBER ]]; then
        echo -e "\nIt's lower than that, guess again:"
      elif [[ $INPUT_NUMBER -lt $SECRET_NUMBER ]]; then
        echo -e "\nIt's higher than that, guess again:"
      else
        echo -e "\nYou guessed it in $TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"
        break
      fi
    else
      echo -e "\nThat is not an integer, guess again:"
    fi
  done
}

# Preguntamos el usuario
echo -e "\nEnter your username: "
read USERNAME

# Vemos si existe
USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")
if [[ -z $USER_ID ]]; then
  # Si es la primera vez aquí, la introducimos en la base de datos
  echo -e "\nWelcome, $(FORMAT_STRING $USERNAME)! It looks like this is your first time here."
else
  # Si no, mostramos la info de juegos y mejor intento
  GAME_INFO=$($PSQL "SELECT name, games_played, best_game FROM games INNER JOIN users USING(user_id) WHERE user_id = $USER_ID")
  IFS='|' read -r USERNAME GAMES_PLAYED BEST_GAME <<< "$GAME_INFO"
  echo -e "\nWelcome back, $(FORMAT_STRING $USERNAME)! You have played $(FORMAT_STRING $GAMES_PLAYED) games, and your best game took $(FORMAT_STRING $BEST_GAME) guesses."
fi

# Ahora empieza el juego
RANDOM_NUMBER "Guess the secret number between 1 and 1000:"

# Actualizar la base de datos. Si no existía el usuario, crearlo después del primer juego
if [[ -z $USER_ID ]]; then
  INSERT_USER=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")
  INSERT_GAME=$($PSQL "INSERT INTO games(user_id, games_played, best_game) VALUES($USER_ID, 1, $TRIES)")
else
  # Actualizamos los juegos
  GAMES_PLAYED=$((GAMES_PLAYED + 1))
  UPDATE_GAME=$($PSQL "UPDATE games SET games_played = $GAMES_PLAYED WHERE user_id = $USER_ID")
  # Actualizar el mejor intento si corresponde
  if [[ $TRIES -lt $BEST_GAME ]]; then
    UPDATE_BEST=$($PSQL "UPDATE games SET best_game = $TRIES WHERE user_id = $USER_ID")
  fi
fi

