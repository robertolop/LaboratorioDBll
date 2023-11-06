-- Guia4

use Hotel;

-- Declarar un cursor
DECLARE MyCursor CURSOR FOR
SELECT U.ID_Usuario, U.Usuario, R.NombreRol
FROM Usuarios U
INNER JOIN Roles R ON U.ID_Rol = R.ID_Rol;

-- Declarar variables para almacenar los datos de cada fila
DECLARE @ID_Usuario int, @Usuario varchar(60), @NombreRol varchar(60);

-- Abrir el cursor
OPEN MyCursor;

-- Iniciar el ciclo de recorrido
FETCH NEXT FROM MyCursor INTO @ID_Usuario, @Usuario, @NombreRol;

-- Recorrer las filas y realizar operaciones según el rol
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Realizar operaciones según el rol (por ejemplo, imprimir el nombre de usuario y su rol)
    PRINT 'Usuario: ' + @Usuario + ', Rol: ' + @NombreRol;

    -- Obtener la siguiente fila
    FETCH NEXT FROM MyCursor INTO @ID_Usuario, @Usuario, @NombreRol;
END;

-- Cerrar el cursor
CLOSE MyCursor;
DEALLOCATE MyCursor;
