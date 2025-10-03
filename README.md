-- Hidden Hub GUI by Marlon
-- Compatible con Delta (Mobile Executor)

-- Creamos ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HiddenHub"
ScreenGui.Parent = game.CoreGui

-- Frame principal
local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(10, 15, 30)
Frame.Size = UDim2.new(0, 300, 0, 350)
Frame.Position = UDim2.new(0.5, -150, 0.5, -175)
Frame.Active = true
Frame.Draggable = true

-- Título
local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Text = "Hidden Hub - 8 Opciones"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(20, 25, 50)
Title.TextColor3 = Color3.fromRGB(200, 220, 255)
Title.TextScaled = true

-- Función para crear botones rápido
local function addButton(text, y, callback)
    local Button = Instance.new("TextButton")
    Button.Parent = Frame
    Button.Text = text
    Button.Size = UDim2.new(1, -20, 0, 30)
    Button.Position = UDim2.new(0, 10, 0, y)
    Button.BackgroundColor3 = Color3.fromRGB(40, 50, 80)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextScaled = true
    Button.MouseButton1Click:Connect(callback)
end

-- Botones del menú
addButton("1. Buscar vendaje", 40, function() print("Buscando vendaje...") end)
addButton("2. Buscar comida", 75, function() print("Buscando comida...") end)
addButton("3. Abrir cofre", 110, function() print("Cofre abierto!") end)
addButton("4. ESP amigos", 145, function() print("ESP activado: amigos en azul") end)
addButton("5. Buscar madera", 180, function() print("Recolectando madera...") end)
addButton("6. Buscar linterna", 215, function() print("Buscando linterna...") end)
addButton("7. Noclip", 250, function() print("Noclip activado!") end)
addButton("8. Kill enemigos", 285, function() print("Enemigos eliminados (simulado)") end)
