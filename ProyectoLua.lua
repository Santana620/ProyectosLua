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