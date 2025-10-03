-- Hidden Hub GUI by Marlon
-- Compatible con Delta (Mobile Executor

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
