#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

FORMAT_STRING() {
  echo "$(echo $1 | sed -E 's/^ *| *$//g')"
}

# Selector de elemento
if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
else
  # Checkeamos qué tipo es el input
  if [[ "$1" =~ ^[0-9]+$ ]]; then
    # Atomic_number
    FILTER="atomic_number = $1"
  else
    if [[ $(echo "$1" | wc -c) -gt 3 ]]; then
        # Name
        FILTER="name = '$1'"
    else
        # Symbol
        FILTER="symbol = '$1'"
    fi
  fi
  # Cogemos el elemento de la tabla
  CHECK_ELEMENT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE $FILTER")
  # Checkeamos si no está vacio
  if [[ -z $CHECK_ELEMENT ]]; then
    echo "I could not find that element in the database."
  else
    IFS='|' read -r ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT <<< $CHECK_ELEMENT
    AVER= echo "The element with atomic number $(FORMAT_STRING $ATOMIC_NUMBER) is $(FORMAT_STRING $NAME) ($(FORMAT_STRING $SYMBOL)). It's a $(FORMAT_STRING $TYPE), with a mass of $(FORMAT_STRING $ATOMIC_MASS) amu. $(FORMAT_STRING $NAME) has a melting point of $(FORMAT_STRING $MELTING_POINT) celsius and a boiling point of $(FORMAT_STRING $BOILING_POINT) celsius."
  fi
fi


