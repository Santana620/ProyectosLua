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
