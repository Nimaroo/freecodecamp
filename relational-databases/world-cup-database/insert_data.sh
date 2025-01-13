#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do
  # IGNORE THE FIRST ROW
  if [[ $YEAR == "year" ]]
  then
    continue
  fi

  # ADD THE TEAMS FROM THE WINNERS AND/OR OPPONENTS 
  CHECK_WINNER=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER' ")
  if [[ -z $CHECK_WINNER ]]
  then
    INSERT_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    if [[ $INSERT_WINNER == "INSERT 0 1" ]]
    then
      echo "Inserted team: $WINNER (from winners)"
    fi
  fi
  CHECK_OPPONENT=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT' ")
  if [[ -z $CHECK_OPPONENT ]]
  then
    INSERT_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
    if [[ $INSERT_OPPONENT == "INSERT 0 1" ]]
    then
      echo "Inserted team: $WINNER (from opponent)"
    fi
  fi

  # NOW ADD THE GAMES
  # FIRST LETS GET THE IDs FROM THE TEAMS
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")

  # NOW LETS PUT THE DATA INSIDE THE TABLE ID
  CHECK_INSERT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $W_GOALS, $O_GOALS)")
  if [[ $CHECK_INSERT == "INSERT 0 1" ]]
  then
    echo "Inserted data from $ROUND-$YEAR"
  fi
done