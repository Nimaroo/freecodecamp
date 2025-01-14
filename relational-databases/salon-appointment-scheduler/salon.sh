#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n--------------------"
echo -e "~~~~~ BANDTUMBATS ~~~~~"
echo -e "--------------------"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # Bienvenida y servicios
  echo -e "\n¡Bienvenido a Bandtumbats! ¿Qué te gustaría contratar?"
  ALL_SERVICES=$($PSQL "SELECT * FROM services")
  echo "$ALL_SERVICES" | while read SERVICE_ID _ SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  # Seleccion de servicios
  read SERVICE_ID_SELECTED
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_NAME ]]
  then
    MAIN_MENU "Disculpa, ese servicio no lo tenemos disponible."
  else   
    # Datos del usuario
    echo -e "\n¡Perfecto! ¿Cuál es tu número de teléfono?"
    read CUSTOMER_PHONE
    CHECK_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    if [[ -z $CHECK_NAME ]]
    then
      # Pedimos el nombre y lo incluimos si no existía
      echo -e "\nVemos que es la primera vez que nos contratas. Cómo te llamas?"
      read CUSTOMER_NAME
      INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi

    # Pedimos la hora de contratación
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name = '$CUSTOMER_NAME' AND phone = '$CUSTOMER_PHONE'")
    echo -e "\n¡Gracias! ¿A qué hora te gustaría contratar el servicio?"
    read SERVICE_TIME

    # Confirmación
    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

MAIN_MENU
