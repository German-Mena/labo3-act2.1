Use BluePrint2
--  1) Listado de todos los clientes.
--select * from Clientes

--  2) Listado de todos los proyectos.
--select * from Proyectos

--  3) Listado con nombre, descripción, costo, fecha de inicio y de fin de todos los proyectos.
--select Nombre, Descripcion, Costo, FechaInicio, FechaFin from Proyectos

--  4) Listado con nombre, descripción, costo y fecha de inicio de todos los proyectos con costo mayor a cien mil pesos.
--select Nombre, Descripcion, Costo, FechaInicio from Proyectos where Costo > 100000

--  5) Listado con nombre, descripción, costo y fecha de inicio de todos los proyectos con costo menor a cincuenta mil pesos .
--select Nombre, Descripcion, Costo, FechaInicio from Proyectos where Costo < 50000

--  6) Listado con todos los datos de todos los proyectos que comiencen en el año 2020.
--select * from Proyectos where Year(FechaInicio) = 2020

--  7) Listado con nombre, descripción y costo de los proyectos que comiencen en el año 2020 y cuesten más de cien mil pesos.
--select Nombre, Descripcion, Costo from Proyectos where YEAR(FechaInicio) = 2020 AND Costo > 100000

--  8) Listado con nombre del proyecto, costo y año de inicio del proyecto.
--select Nombre, Costo, YEAR(FechaInicio) as AnioInicio from Proyectos

--  9) Listado con nombre del proyecto, costo, fecha de inicio, fecha de fin y días de duración de los proyectos.
--select Nombre, Costo, FechaInicio, FechaFin, DATEDIFF(DAY,FechaInicio,FechaFin) AS duracion from Proyectos

-- 10) Listado con razón social, cuit y teléfono de todos los clientes cuyo IDTipo sea 1, 3, 5 o 6
--select RazonSocial, Cuit, TelefonoFijo, TelefonoMovil from Clientes where IDTipoCliente = 1 OR IDTipoCliente = 3 OR IDTipoCliente = 5 OR IDTipoCliente = 6 

-- 11) Listado con nombre del proyecto, costo, fecha de inicio y fin de todos los proyectos que no pertenezcan a los clientes 1, 5 ni 10.
--select Nombre, Costo, FechaInicio, FechaFin from Proyectos where IDCliente NOT IN (1,5,10)

-- 12) Listado con nombre del proyecto, costo y descripción de aquellos proyectos que hayan comenzado entre el 1/1/2018 y el 24/6/2018.
-- RECORDAR QUE SE TRABAJA CON EL FORMATO DE FECHA YYYY/MM/DD
--select Nombre, Costo, Descripcion from Proyectos where FechaInicio BETWEEN '2018/01/01' AND '2018/06/24'

-- 13) Listado con nombre del proyecto, costo y descripción de aquellos proyectos que hayan finalizado entre el 1/1/2019 y el 12/12/2019.
--select Nombre, Costo, Descripcion from Proyectos where FechaFin between '2019/1/1' AND '2019/12/12'

-- 14) Listado con nombre de proyecto y descripción de aquellos proyectos que aún no hayan finalizado.
--select Nombre, Descripcion from Proyectos where GETDATE() < FechaFin OR FechaFin IS NULL 

-- 15) Listado con nombre de proyecto y descripción de aquellos proyectos que aún no hayan comenzado.
--select Nombre, Descripcion from Proyectos where GETDATE() < FechaInicio

-- 16) Listado de clientes cuya razón social comience con letra vocal.
--select * from Clientes where RazonSocial LIKE '[AEIOU]%'

-- 17) Listado de clientes cuya razón social finalice con vocal.
--select * from Clientes where RazonSocial LIKE '%[AEIOU]'

-- 18) Listado de clientes cuya razón social finalice con la palabra 'Inc'
--select * from Clientes where RazonSocial LIKE '%Inc'

-- 19) Listado de clientes cuya razón social no finalice con vocal.
--select * from Clientes where RazonSocial NOT LIKE '%[AEIOU]'

-- 20) Listado de clientes cuya razón social no contenga espacios.
--select * from Clientes where RazonSocial NOT LIKE '% %'

-- 21) Listado de clientes cuya razón social contenga más de un espacio.
--select * from Clientes where RazonSocial LIKE '% % %'

-- 22) Listado de razón social, cuit, email y celular de aquellos clientes que tengan mail pero no teléfono.
--select RazonSocial, Cuit, Email, TelefonoMovil from Clientes where Email IS NOT NULL AND TelefonoFijo IS NULL

-- 23) Listado de razón social, cuit, email y celular de aquellos clientes que no tengan mail pero sí teléfono.
--select RazonSocial, Cuit, Email, TelefonoMovil from Clientes where Email IS NULL AND TelefonoFijo IS NOT NULL

-- 24) Listado de razón social, cuit, email, teléfono o celular de aquellos clientes que tengan mail o teléfono o celular.
--select RazonSocial, Cuit, Email, TelefonoFijo, TelefonoMovil from Clientes where Email IS NOT NULL OR TelefonoFijo IS NOT NULL OR TelefonoMovil IS NOT NULL

-- 25) Listado de razón social, cuit y mail. Si no dispone de mail debe aparecer el texto "Sin mail".
--select RazonSocial, Cuit, case when Email IS NULL then 'Sin Mail' ELSE Email end as 'Email' from Clientes

-- 26) Listado de razón social, cuit y una columna llamada Contacto con el mail, si no posee mail, con el número de celular y si no posee número de celular con un texto que diga "Incontactable".
--select RazonSocial, Cuit, case when Email is null AND TelefonoMovil IS NULL then 'Incontactable' else Email end as 'Contacto' case when Email is not null then TelefonoMovil from Clientes

select RazonSocial, Cuit,
case
	when Email is null AND TelefonoMovil IS NULL then 'Incontactable'
	when Email is not null then Email
	when TelefonoMovil is not null then TelefonoMovil
end as 'Contacto'
from Clientes