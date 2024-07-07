#!/bin/bash

# Creamos una variable que almacene las distintas opciones del juego
opciones="piedra papel tijeras"

# Esta función validará si la entrada que el usuario escribe forma parte
# de las opciones disponibles. En caso de no ser válida, devolverá 1 = False
validacion(){
	local entrada=$1

	for opcion in $opciones
	do
		if [ "$entrada" = "$opcion" ]; then
			echo 0
			return
		fi
	done
	echo 1
}

# Esta función comprobará las respuestas dadas por el usuario y la máquina.
# Para este caso, 0 se entiende como ganar, 1 como empatar y 2 como perder
comprobacion(){
	if [[ "$1" = "piedra" && "$2" = "tijeras" ]]; then
		echo 0
	elif [[ "$1" = "papel" && "$2" = "piedra" ]]; then
                echo 0
	elif [[ "$1" = "tijeras" && "$2" = "papel" ]]; then
                echo 0
	elif [[ "$1" = "$2" ]]; then
                echo 1
	else
		echo 2
	fi
}

# Creamos un pequeño menú para el juego con las indicaciones pertinentes
echo "		.: Piedra Papel o Tijeras :."
echo "Ingrese su opción: "
echo -n "> "

read input

echo "Su opción fue:" $input

# Con esta variable guardaremos la llamada a la función para VALIDAR datos
respuesta=`validacion $input`

# En este If indicaremos que si la respuesta de la función devuelve 1, es
# porque el usuario ha introducido una entrada no válida y tiene que seguir
# probando hasta escribir una opción correcta (es decir, devuelva 0)
if [ $respuesta -eq 1 ]; then
	valido=1

	while [ $valido -eq 1 ]; do
		echo "(ERROR, escoja entre piedra, papel o tijeras)"
		echo -n "> "

		read input
		respuestaBucle=`validacion $input`

		if [ $respuestaBucle -eq 0 ]; then
			valido=0
		fi
	done
fi

# Creamos otra variable con las opciones del juego pero esta vez como lista
opcionesPC=(piedra papel tijeras)

# Aquí asignamos a una variable un conjunto aleatorio de tres índices máximo
indice=$[$RANDOM % 3]

# Con esta variable asignamos que la lista de opciones posibles para el juego
# arroje un valor aleatorio de entre los tres disponibles
respuestaPC=${opcionesPC[indice]}

echo "La computadora eligió:" $respuestaPC

# Con esta variable guardaremos la llamada a la función para COMPROBAR datos
resultado=`comprobacion $input $respuestaPC`

# Con este Case realizamos la condición final en la que dependiendo del valor
# que haya devuelto la función anterior, informará por pantalla si el usuario
# ha ganado, ha empatado o ha perdido el juego
case $resultado in
	0)
		echo "-> GANASTE!";;
	1)
		echo "-> EMPATE!";;
	2)
		echo "-> PERDISTE!"
esac