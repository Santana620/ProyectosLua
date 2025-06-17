-- Vamos a tener muchas tareas
local ListaDeTarea = { --Guardaremos todas las listas

     {   titulo = "pasear al perro",
        descripcion = "El tiene que pasear",
        estado = "pendiente"
    },
    {
        titulo = "Estudiar programacion",
        descripcion = "El tiene que estudiar frente al ordenador",
        estado = "pendiente"
    }
}
--Codigo necesario para que pueda ser interactivo con json-------------------


while true do
    print("\n--- MENÚ ---")
    print("1. Agregar tarea")
    print("2. Completar tarea")
    print("3. Mostrar tareas")
    print("4. Guardar en JSON")
    print("5. Salir")

    io.write("Selecciona una opción: ")
    local opcion = io.read()

    if opcion == "1" then
        io.write("Título: ")
        local titulo = io.read()
        io.write("Descripción: ")
        local descripcion = io.read()
        agregarTarea(titulo, descripcion)
    elseif opcion == "2" then
        io.write("Título de tarea a completar: ")
        local titulo = io.read()
        CompletarTareas(titulo)
    elseif opcion == "3" then
        imprimirTareas()
    elseif opcion == "4" then
        guardarEnJSON("tareas.json")
    elseif opcion == "5" then
        print("Saliendo...")
        break
    else
        print("Opción no válida")
    end
end



----------------------------------------------------------------------------
-- FUNCIÓN PARA PERMITIR LA INTERACCIÓN ------------------------------------
function guardarEnJSON(nombre_archivo)
    local archivo = io.open(nombre_archivo, "w")
    if archivo then
        local contenido = json.encode(ListaDeTarea, { indent = true })
        archivo:write(contenido)
        archivo:close()
        print("Tareas guardadas en " .. nombre_archivo)
    else
        print("No se pudo abrir el archivo.")
    end
end
-----------------------------------------------------------------------------



function agregarTarea(titulo, descripcion)
    for i, tarea in ipairs(ListaDeTarea) do
            if tarea.titulo == titulo then
                print("Esta tarea ya existe")
                return
            end
        end
    local tarea = {
        titulo = titulo,
        descripcion = descripcion,
        estado = "pendiente"
        }
        

    table.insert(ListaDeTarea, tarea)
    print("Tarea Agregada: "..titulo)
end

function eliminarTarea(titulo)
 for i, tarea in ipairs(ListaDeTarea) do
    if tarea.titulo == titulo then
        table.remove(ListaDeTarea, i)
        print("Tarea eliminada: " .. titulo)
        return
    end
end
    print("Titulo encontrado")
    end
 end
end 
function imprimirTareaPorTitulo(titulo)
    for i, tarea in ipairs(ListaDeTarea) do
        if tarea.titulo == titulo then
            print(tarea.titulo .. " - " .. tarea.descripcion .. " [" .. tarea.estado .. "]")
            return
        end
    end
    print("Tarea no encontrada.")
end

function imprimirTareas()
    for i, tarea in ipairs(ListaDeTarea) do
        print(i.." "..tarea.titulo.." - "..tarea.descripcion.." ["..tarea.estado.."]")
    end
end

local ListaDeTareasCompletadas = {}

function CompletarTareas(titulo)
    local tarea_encontrada = false 
    for i, tarea in ipairs(ListaDeTarea) do
        if tarea.titulo == titulo then
        local tarea_completada = { 
        titulo = tarea.titulo,
        descripcion = tarea.descripcion,
        estado = "Completado",
        }
        table.insert(ListaDeTareasCompletadas, tarea_completada)
        print("Hay una tarea completada, revisala")
        tarea_encontrada = true 
        break
    end
end
        if not tarea_encontrada then
            print("Esta tarea no existe")
            end
        end

function MostarTareasCompletadas()
    for i, tarea in ipairs(ListaDeTareasCompletadas) do
    print("COMPLETADA:" ..tarea.titulo)
    end
end
function DeshacerTareaCompletada(titulo)
    local tarea_deshecha = false
    for i, tarea_completada in ipairs(ListaDeTareasCompletadas) do
        if tarea_completada.titulo == titulo then
            table.remove(ListaDeTareasCompletadas, i)
            print("Tarea " ..tarea_completada.titulo .. " deshecha")
            tarea_deshecha = true
            break
        end
    end
    if not tarea_deshecha then
        print("Esta tarea no estaba completada")
    end
end