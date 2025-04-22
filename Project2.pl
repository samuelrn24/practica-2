% Catalogo de Vehiculos
% (Estructura) -> vehicle(Brand, Reference, Type, Price, Year).

vehicle(toyota, corolla, sedan, 20000, 2020).
vehicle(toyota, rav4, suv, 30000, 2021).
vehicle(ford, mustang, coupe, 55000, 2022).
vehicle(ford, explorer, suv, 40000, 2020).
vehicle(bmw, x5, suv, 60000, 2021).
vehicle(bmw, series3, sedan, 45000, 2022).
vehicle(honda, civic, sedan, 22000, 2021).
vehicle(honda, crv, suv, 32000, 2020).
vehicle(chevrolet, camaro, coupe, 50000, 2022).
vehicle(chevrolet, tahoe, suv, 55000, 2021).

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
