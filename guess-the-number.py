# De la librería Random importaremos la función Randint, que es
# la que nos ayudará con la aleatoriedad de los números generados
from random import randint

# Creamos Aleatorio, que almacenará un número al azar del 0 al 100
aleatorio = randint(0, 100)
print("-------------------------------------------")

# La variable Intento servirá para consultar al jugador su número
# Creamos un contador con valor 1 para ir sumando los intentos en él
intento = int(input("-> Ingresa un número entre el 0 al 100: "))
contador = 1

# Creamos un bucle While que se ejecutará de manera indefinida hasta que
# el número ingresado por el jugador coincida con el generado por Randint
while intento != aleatorio:
    # Si Intento es menor que 0 o mayor que 100, no será válido
    if intento < 0 or intento > 100:
        print("*** Número No Válido ***")
        exit()
    # Si Intento es mayor que Aleatorio, se informará al jugador de ello
    if intento > aleatorio:
        print("*** NO, es un número menor al que has dado ***")
    # Si Intento es menor que Aleatorio, se informará al jugador de ello
    if intento < aleatorio:
        print("*** NO, es un número mayor al que has dado ***")
    # Volvemos a preguntar al jugador por otro número como siguiente intento
    # Aumentamos el contador en 1 intento antes de volver a empezar el bucle
    intento = int(input("-> Ingresa un número entre el 0 al 100: "))
    contador += 1

# Si salimos del bucle, significará que el jugador ha acertado  el número,
# por tanto lo informamos, además de mostrar el número que intentos que tuvo
print("-------------------------------------------")
print("-> ACERTASTE!, el número correcto es:", aleatorio)
print("-> El total de intentos realizados fue:", contador)
print("-------------------------------------------")