% Catalogo de Vehiculos
% (Estructura) -> vehicle(Brand, Reference, Type, Price, Year).

vehicle(toyota, corolla, sedan, 20000, 2020).
vehicle(toyota, rav4, suv, 30000, 2021).
vehicle(toyota, yaris, sedan, 18000, 2019).
vehicle(toyota, c_hr, suv, 27000, 2022).
vehicle(toyota, prius, sedan, 24000, 2021).

vehicle(ford, mustang, coupe, 55000, 2022).
vehicle(ford, explorer, suv, 40000, 2020).
vehicle(ford, ecosport, suv, 28000, 2021).
vehicle(ford, fusion, sedan, 23000, 2020).
vehicle(ford, fiesta, sedan, 17000, 2018).

vehicle(bmw, x5, suv, 60000, 2021).
vehicle(bmw, series3, sedan, 45000, 2022).
vehicle(bmw, x3, suv, 48000, 2021).
vehicle(bmw, i3, hatchback, 42000, 2020).
vehicle(bmw, z4, sport, 65000, 2022).

vehicle(honda, civic, sedan, 22000, 2021).
vehicle(honda, crv, suv, 32000, 2020).
vehicle(honda, hrv, suv, 28000, 2022).
vehicle(honda, pilot, suv, 34000, 2021).
vehicle(honda, accord, sedan, 26000, 2020).

vehicle(chevrolet, camaro, coupe, 50000, 2022).
vehicle(chevrolet, tahoe, suv, 55000, 2021).
vehicle(chevrolet, trax, suv, 23000, 2020).
vehicle(chevrolet, aveo, sedan, 16000, 2018).
vehicle(chevrolet, equinox, suv, 29000, 2022).

vehicle(kia, sportage, suv, 31000, 2022).
vehicle(kia, rio, sedan, 19000, 2020).
vehicle(kia, sorento, suv, 35000, 2021).
vehicle(kia, forte, sedan, 21000, 2021).
vehicle(kia, soul, hatchback, 20000, 2022).

%Filtro por presupuesto
meet_budget(Reference, BudgetMax) :-
    vehicle(_, Reference, _, Price, _),
    Price =< BudgetMax. 

%Filtro por tipo
meet_type(Reference, Type) :-
    vehicle(_, Reference, Type, _, _).

% Lista de vehículos por marca
meet_brand(Brand, Refs) :-
    findall(Reference, vehicle(Brand, Reference, _, _, _), Refs).

%Lista de vehiculos en presupuesto (sumados<1,000,000)
generate_report(Brand, Type, Budget, Result):-
    findall
        (vehicle(Brand, Reference, Type, Price, Year),
        (
            vehicle(Brand, Reference, Type, Price, Year),
            Price =< Budget,
            Price < 1000000
        ),Result
    ),
    total_value(Result, Total),
    write('El valor total del reporte es: $'), write(Total), nl,
    (Total > 1000000 ->
        write('El total supera el presupuesto de $1,000,000');
        write('El total no supera el presupuesto de $1,000,000')
    ).

% Sumar precios de vehiculos
total_value([], 0).
total_value([vehicle(_, _, _, Price, _)|Rest], Total) :-
    total_value(Rest, RestTotal),
    Total is Price + RestTotal.
