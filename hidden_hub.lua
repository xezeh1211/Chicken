-- Hidden Hub by Marlon
-- Script ejemplo con 8 opciones
-- Para probar en tu executor móvil

local HiddenHub = {}

function HiddenHub.menu()
    print("=== Hidden Hub ===")
    print("1. Buscar vendaje")
    print("2. Buscar comida")
    print("3. Abrir cofre")
    print("4. ESP (ver amigos color azul)")
    print("5. Buscar madera")
    print("6. Buscar linterna")
    print("7. Noclip (atravesar paredes)")
    print("8. Kill (matar enemigos)")
    print("==================")
end

function HiddenHub.buscarVendaje() print("Buscando vendaje...") end
function HiddenHub.buscarComida() print("Buscando comida...") end
function HiddenHub.abrirCofre() print("Cofre abierto!") end
function HiddenHub.esp() print("ESP activado: amigos en azul") end
function HiddenHub.buscarMadera() print("Recolectando madera...") end
function HiddenHub.buscarLinterna() print("Buscando linterna...") end
function HiddenHub.noclip() print("Noclip activado: atraviesas paredes") end
function HiddenHub.kill() print("Eliminando enemigos...") end

HiddenHub.menu()
return HiddenHub
