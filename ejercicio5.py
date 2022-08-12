# creamos la tupla historial  y mostramos por pantalla
historial = (2350, 5960, 23000, 1000, 8900)
print("listado de gastos de 'Puppy'")
print(historial,"\n")

#variable para sumar el total
gastoTotal=0

#ciclo que recorre la tupla y suma sus valores
for elementos in historial:
    gastoTotal +=elementos


if (gastoTotal < 3000):

    print("El gasto total de 'Puppy es : $'",gastoTotal)
else:
    print("Gasto total de Puppy por encima de lo presupuestado")
