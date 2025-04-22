# Practica 2
Sistema de inventario de vehículos en Prolog

Estudiante: *Samuel Ramirez Noreña* 

Fecha de entrega: *21/04/2025*

Universidad EAFIT

## Manual de uso

### Lista de comandos con ejemplos

#### vehicle/5

Registra los vehiculos disponibles
  
	Uso: vehicle(Marca, Referencia, Tipo, Precio, Año)
  
	Ej: vehicle(ford, mustang, coupe, 55000, 2022)

#### meet_budget/2

Se puede usar para verificar si hay una referencia de automovil que esta dentro de un presumuesto o buscar vehiculos dentro de un presupuesto

	Uso: meet_budget(Referencia, Presupuesto-maximo)

 	Ej1:
	?- meet_budget(rav4, 35000).
	true.

 	Ej2: 
	?- meet_budget(X, 25000).
	X = corolla ;
	X = civic ;
	false.

#### meet_type/2

Se puede usar para verificar si una referencioa de vehiculo pertenece a un tipo, o para buscar los vehiculos que pertenecen a una categoria

	Uso: meet_type(Referencia, Tipo)

 	Ej1: 
	?- meet_type(civic, sedan).
	true.

 	Ej2: 
	?- meet_type(X, coupe).
	X = mustang ;
	X = camaro ;
	false.
 
#### meet_brand/2

Se usa para buscar una lista de referencias que pertenezcan a una marca específica

	Uso: meet_brand(Marca, Lista)

 	Ej:
	?- meet_brand(toyota, L).
 	L = [corolla, rav4].

#### total_value/2

Suma los precios de los vehiculos ingresados. 
No esta diseñada para usarse sola, es un metodo que se utiliza en otro comando, sin embargo se explicara como usarlo.

	Uso: total_value(ListaVehiculos, Total)

 	Ej:
	?- total_value([vehicle(_, _, _, 20000, _), vehicle(_, _, _, 30000, _)], T).
	T = 50000.

#### generate_report/4

Genera un reporte con los vehiculos de cierta marca y tipo, cuyo precio no supere un presupuesto indivudual. Tambien muestra si la suma del precio de todos los vehiculos de la lista, muestra este valor e indica si esta suma supera el limite de $1,000,000 (Para este comando es que fue diseñado el metodo total_value/2)

	Uso: generate_report(Marca, Tipo, Presupuesto-unidad, Resultado)

 	Ej:
		?- generate_report(honda, suv, 35000, R).
	El valor total del reporte es: $94000
	El total no supera el presupuesto de $1,000,000
	R = [vehicle(honda, crv, suv, 32000, 2020),
     	vehicle(honda, hrv, suv, 28000, 2022),
     	vehicle(honda, pilot, suv, 34000, 2021)].





