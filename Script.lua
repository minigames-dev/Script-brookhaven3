--------------------------------------------------------------------
--  DAVIZINSCRIPTS PRO MAX V6
--------------------------------------------------------------------

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Rep = game:GetService("ReplicatedStorage")

local remoteGive = Rep:WaitForChild("RE"):WaitForChild("1Playe1rTrigge1rEven1t")
local remotePick = Rep:WaitForChild("RE"):WaitForChild("1Too1l")

local itensParaDar = { "MiniUZI","Shotgun","Sniper","AK47","Sword","Pistol" }
local itensParaPegar = { "MiniUZI","Shotgun","Sniper","AK47","Sword","Pistol" }

local function temItem(n)
	if Player.Backpack:FindFirstChild(n) then return true end
	if Player.Character and Player.Character:FindFirstChild(n) then return false end
	return false
end

--------------------------------------------------------------------
--  SOM DE CLIQUE
--------------------------------------------------------------------

local clickSoundId = "rbxassetid://452267918"

local function addClickSound(btn)
	local s = Instance.new("Sound")
	s.SoundId = clickSoundId
	s.Volume = 1
	s.Parent = btn
	btn.MouseButton1Click:Connect(function()
		s:Play()
	end)
end

--------------------------------------------------------------------
-- LOGIN PREMIUM
--------------------------------------------------------------------

local TweenService = game:GetService("TweenService")

local loginGui = Instance.new("ScreenGui")
loginGui.Name = "loginDavizin"
loginGui.Parent = Player.PlayerGui
loginGui.ResetOnSpawn = false

-- FUNDO ESCURO
local blurFrame = Instance.new("Frame", loginGui)
blurFrame.Size = UDim2.new(1,0,1,0)
blurFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
blurFrame.BackgroundTransparency = 0.4

-- FRAME PRINCIPAL
local loginFrame = Instance.new("Frame", loginGui)
loginFrame.Size = UDim2.new(0,0,0,0)
loginFrame.Position = UDim2.new(0.5,0,0.5,0)
loginFrame.AnchorPoint = Vector2.new(0.5,0.5)
loginFrame.BackgroundColor3 = Color3.fromRGB(20,20,25)
loginFrame.BorderSizePixel = 0
loginFrame.Active = true
loginFrame.Draggable = true

local corner = Instance.new("UICorner", loginFrame)
corner.CornerRadius = UDim.new(0,20)

local stroke = Instance.new("UIStroke", loginFrame)
stroke.Color = Color3.fromRGB(0,170,255)
stroke.Thickness = 2

local gradient = Instance.new("UIGradient", loginFrame)
gradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(25,25,40)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(15,15,25))
}

-- ANIMAÇÃO DE ABERTURA
TweenService:Create(loginFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
	Size = UDim2.new(0,340,0,220)
}):Play()

--------------------------------------------------------------------
-- TITULO
--------------------------------------------------------------------

local loginTitulo = Instance.new("TextLabel", loginFrame)
loginTitulo.Size = UDim2.new(1,0,0,50)
loginTitulo.BackgroundTransparency = 1
loginTitulo.Text = "🔐 DAVIZINSCRIPTS"
loginTitulo.Font = Enum.Font.GothamBlack
loginTitulo.TextScaled = true
loginTitulo.TextColor3 = Color3.fromRGB(0,170,255)

--------------------------------------------------------------------
-- CAIXA SENHA
--------------------------------------------------------------------

local senhaBox = Instance.new("TextBox", loginFrame)
senhaBox.Size = UDim2.new(0.85,0,0,45)
senhaBox.Position = UDim2.new(0.075,0,0,70)
senhaBox.PlaceholderText = "Digite sua key..."
senhaBox.Text = ""
senhaBox.Font = Enum.Font.GothamBold
senhaBox.TextScaled = true
senhaBox.TextColor3 = Color3.new(1,1,1)
senhaBox.BackgroundColor3 = Color3.fromRGB(35,35,45)
senhaBox.BorderSizePixel = 0
senhaBox.ClearTextOnFocus = false

local boxCorner = Instance.new("UICorner", senhaBox)
boxCorner.CornerRadius = UDim.new(0,12)

local boxStroke = Instance.new("UIStroke", senhaBox)
boxStroke.Color = Color3.fromRGB(0,170,255)
boxStroke.Thickness = 1.5

--------------------------------------------------------------------
-- BOTÃO LOGIN
--------------------------------------------------------------------

local botaoLogin = Instance.new("TextButton", loginFrame)
botaoLogin.Size = UDim2.new(0.85,0,0,45)
botaoLogin.Position = UDim2.new(0.075,0,0,135)
botaoLogin.Text = "ENTRAR"
botaoLogin.Font = Enum.Font.GothamBlack
botaoLogin.TextScaled = true
botaoLogin.TextColor3 = Color3.new(1,1,1)
botaoLogin.BackgroundColor3 = Color3.fromRGB(0,170,255)
botaoLogin.BorderSizePixel = 0

local btnCorner = Instance.new("UICorner", botaoLogin)
btnCorner.CornerRadius = UDim.new(0,12)

-- EFEITO HOVER
botaoLogin.MouseEnter:Connect(function()
	TweenService:Create(botaoLogin, TweenInfo.new(0.2), {
		BackgroundColor3 = Color3.fromRGB(0,200,255)
	}):Play()
end)

botaoLogin.MouseLeave:Connect(function()
	TweenService:Create(botaoLogin, TweenInfo.new(0.2), {
		BackgroundColor3 = Color3.fromRGB(0,170,255)
	}):Play()
end)

--------------------------------------------------------------------
-- BOTÃO PEQUENO GET KEY
--------------------------------------------------------------------

local getKeyButton = Instance.new("TextButton", loginFrame)
getKeyButton.Size = UDim2.new(0,90,0,30)
getKeyButton.Position = UDim2.new(1,-100,0,10)
getKeyButton.Text = "GET KEY"
getKeyButton.Font = Enum.Font.GothamBold
getKeyButton.TextScaled = true
getKeyButton.TextColor3 = Color3.new(1,1,1)
getKeyButton.BackgroundColor3 = Color3.fromRGB(170,0,255)
getKeyButton.BorderSizePixel = 0

local corner2 = Instance.new("UICorner", getKeyButton)
corner2.CornerRadius = UDim.new(0,8)

local keyLink = "https://link-hub.net/2596256/Wth3aFzRTgwh"

getKeyButton.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard(keyLink)
	end
	
	getKeyButton.Text = "COPIADO!"
	task.wait(1.5)
	getKeyButton.Text = "GET KEY"
end)

--------------------------------------------------------------------
-- GUI PRINCIPAL
--------------------------------------------------------------------

local gui = Instance.new("ScreenGui", Player.PlayerGui)
gui.Name = "davizinscripts"
gui.Enabled = false

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,700,0,450)
main.Position = UDim2.new(0.5,0,0.5,0)
main.AnchorPoint = Vector2.new(0.5,0.5)
main.BackgroundColor3 = Color3.fromRGB(30,30,30)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.ClipsDescendants = true
-- SISTEMA MINIMIZAR (BOLA)
--------------------------------------------------------------------

local TweenService = game:GetService("TweenService")

local minimizado = false
local tamanhoNormal = main.Size
local posNormal = main.Position

-- BOTÃO X
local btnMin = Instance.new("TextButton", main)
btnMin.Size = UDim2.new(0,30,0,30)
btnMin.Position = UDim2.new(1,-35,0,5)
btnMin.BackgroundColor3 = Color3.fromRGB(0, 102, 255) -- azul
btnMin.Text = "" -- vamos usar a imagem, então não precisa de texto
btnMin.BorderSizePixel = 0

local cornerMin = Instance.new("UICorner", btnMin)
cornerMin.CornerRadius = UDim.new(1,0)

-- Imagem dentro do botão
local img = Instance.new("ImageLabel", btnMin)
img.Size = UDim2.new(1,0,1,0)
img.Position = UDim2.new(0,0,0,0)
img.BackgroundTransparency = 1
img.Image = "rbxassetid://8508980536" -- sua imagem
img.ScaleType = Enum.ScaleType.Fit

addClickSound(btnMin)

-- BOLINHA
local bola = Instance.new("TextButton", gui)
bola.Size = UDim2.new(0,60,0,60)
bola.Position = UDim2.new(0.5,-30,0.5,-30)
bola.BackgroundColor3 = Color3.fromRGB(0,170,255)
bola.Text = "DAV"
bola.TextColor3 = Color3.new(1,1,1)
bola.Font = Enum.Font.GothamBold
bola.TextScaled = true
bola.Visible = false
bola.BorderSizePixel = 0
bola.Active = true
bola.Draggable = true

local cornerBola = Instance.new("UICorner", bola)
cornerBola.CornerRadius = UDim.new(1,0)

addClickSound(bola)

-- FUNÇÃO MINIMIZAR
btnMin.MouseButton1Click:Connect(function()
	if minimizado then return end
	minimizado = true

	TweenService:Create(main, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
		Size = UDim2.new(0,60,0,60),
		Position = UDim2.new(0.5,-30,0.5,-30)
	}):Play()

	task.wait(0.35)

	main.Visible = false
	bola.Visible = true
end)

-- FUNÇÃO RESTAURAR
bola.MouseButton1Click:Connect(function()
	bola.Visible = false
	main.Visible = true

	main.Size = UDim2.new(0,60,0,60)
	main.Position = UDim2.new(0.5,-30,0.5,-30)

	TweenService:Create(main, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
		Size = tamanhoNormal,
		Position = posNormal
	}):Play()

	minimizado = false
end)
local titulo = Instance.new("TextLabel", main)
titulo.Size = UDim2.new(1,0,0,40)
titulo.Position = UDim2.new(0,0,0,0)
titulo.BackgroundColor3 = Color3.fromRGB(50,50,50)
titulo.Text = "davizinscripts PRO MAX"
titulo.Font = Enum.Font.GothamBold
titulo.TextColor3 = Color3.new(1,1,1)
titulo.TextScaled = true

--------------------------------------------------------------------
-- ABAS NO TOPO
--------------------------------------------------------------------

local abas = Instance.new("Frame", main)
abas.Size = UDim2.new(1,0,0,40)
abas.Position = UDim2.new(0,0,0,40)
abas.BackgroundTransparency = 1

local conteudo = Instance.new("Frame", main)
conteudo.Size = UDim2.new(1,0,1,-80)
conteudo.Position = UDim2.new(0,0,0,80)
conteudo.BackgroundColor3 = Color3.fromRGB(35,35,35)

local function criarAba(nome, ordem, totalAbas)
	local b = Instance.new("TextButton", abas)
	local largura = main.Size.X.Offset / totalAbas - 10
	b.Size = UDim2.new(0, largura, 1, 0)
	b.Position = UDim2.new(0, (ordem-1)*(largura+5), 0, 0)
	b.BackgroundColor3 = Color3.fromRGB(70,70,70)
	b.Text = nome
	b.Font = Enum.Font.GothamBold
	b.TextColor3 = Color3.new(1,1,1)
	b.TextScaled = true
	b.BorderSizePixel = 0
	addClickSound(b)
	return b
end

local totalAbas = 6
local abaDar     = criarAba("INICIO",1,totalAbas)
local abaPegar   = criarAba("RGB NAME",2,totalAbas)
local abaAceitar = criarAba("Troll",3,totalAbas)
local abaEquip   = criarAba("Premium",4,totalAbas)
local abaPlayers = criarAba("House",5,totalAbas)
local abaTP      = criarAba("Credits",6,totalAbas)

--------------------------------------------------------------------
-- SISTEMA DE PÁGINAS
--------------------------------------------------------------------

local paginas = {}

local function criarPagina()
	local f = Instance.new("Frame", conteudo)
	f.Size = UDim2.new(1,0,1,0)
	f.BackgroundTransparency = 1
	f.Visible = false
	return f
end

local pagDar     = criarPagina()
local pagPegar   = criarPagina()
local pagAceitar = criarPagina()
local pagEquip   = criarPagina()
local pagPlayers = criarPagina()
local pagTP      = criarPagina()

paginas = {
	[abaDar] = pagDar,
	[abaPegar] = pagPegar,
	[abaAceitar] = pagAceitar,
	[abaEquip] = pagEquip,
	[abaPlayers] = pagPlayers,
	[abaTP] = pagTP
}

local function abrir(pag)
	for _,p in pairs(paginas) do
		p.Visible = false
	end
	pag.Visible = true
end

abrir(pagDar)

--------------------------------------------------------------------
-- CONTEÚDO DAS ABAS
--------------------------------------------------------------------

-- DAR ITENS
local bDar = Instance.new("TextButton", pagDar)
bDar.Size = UDim2.new(0,200,0,50)
bDar.Position = UDim2.new(0,20,0,20)
bDar.BackgroundColor3 = Color3.fromRGB(100,50,200)
bDar.Text = "LIGAR / DESLIGAR AUTO DAR"
bDar.TextColor3 = Color3.new(1,1,1)
bDar.Font = Enum.Font.GothamBold
bDar.TextScaled = true
addClickSound(bDar)

local ativoGive = false
bDar.MouseButton1Click:Connect(function()
	ativoGive = not ativoGive
	bDar.Text = ativoGive and "AUTO DAR ATIVADO" or "LIGAR / DESLIGAR AUTO DAR"
end)

task.spawn(function()
	while true do
		if ativoGive then
			for _,p in pairs(Players:GetPlayers()) do
				for _,item in ipairs(itensParaDar) do
					remoteGive:FireServer("ToolGiveToServer", p, item)
				end
			end
		end
		task.wait(1)
	end
end)
--------------------------------------------------------------------
-- NOVA OPÇÃO NA PRIMEIRA ABA (DAR ITENS) - BOAT TP
--------------------------------------------------------------------

local runningBoat = false
local targetNameBoat = ""
local spinAngleBoat = 0

local char, hrp, humanoid
local function setCharacterBoat(c)
	char = c
	hrp = char:WaitForChild("HumanoidRootPart")
	humanoid = char:WaitForChild("Humanoid")
end
setCharacterBoat(Player.Character or Player.CharacterAdded:Wait())
Player.CharacterAdded:Connect(setCharacterBoat)

-- Caixa de nome do player
local targetBoxBoat = Instance.new("TextBox", pagDar)
targetBoxBoat.Size = UDim2.new(0, 260, 0, 35)
targetBoxBoat.Position = UDim2.new(0, 20, 0, 90)
targetBoxBoat.PlaceholderText = "Nome do player (vazio = todos)"
targetBoxBoat.Text = ""
targetBoxBoat.Font = Enum.Font.GothamBold
targetBoxBoat.TextScaled = true
targetBoxBoat.TextColor3 = Color3.new(1,1,1)
targetBoxBoat.BackgroundColor3 = Color3.fromRGB(55,55,55)
targetBoxBoat.BorderSizePixel = 0

targetBoxBoat.FocusLost:Connect(function()
	targetNameBoat = targetBoxBoat.Text
end)

-- Botão Boat TP
local bBoatTP = Instance.new("TextButton", pagDar)
bBoatTP.Size = UDim2.new(0, 260, 0, 45)
bBoatTP.Position = UDim2.new(0, 20, 0, 135)
bBoatTP.BackgroundColor3 = Color3.fromRGB(40,120,40)
bBoatTP.Text = "ATIVAR BOAT TP"
bBoatTP.TextColor3 = Color3.new(1,1,1)
bBoatTP.Font = Enum.Font.GothamBold
bBoatTP.TextScaled = true
bBoatTP.BorderSizePixel = 0
addClickSound(bBoatTP)

local function startBoatTP()
	hrp.CFrame = CFrame.new(1590.3, -3.9, -45.2)
	task.wait(0.5)

	local args = {"PickingBoat","PoliceBoatChangeable","Boat"}
	Rep:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
	task.wait(1)

	local vehicle = workspace:WaitForChild("Vehicles"):WaitForChild(Player.Name.."Car")
	local body = vehicle:WaitForChild("Body")
	local seat = body:WaitForChild("VehicleSeat")

	hrp.CFrame = seat.CFrame * CFrame.new(0,2,0)
	task.wait(0.2)
	seat:Sit(humanoid)
	repeat task.wait() until seat.Occupant and seat.Occupant.Parent == char

	vehicle.PrimaryPart = seat

	local seats = {}
	for _, d in ipairs(vehicle:GetDescendants()) do
		if d:IsA("Seat") or d:IsA("VehicleSeat") then
			table.insert(seats, d)
		end
	end

	task.spawn(function()
		while runningBoat do
			spinAngleBoat += math.rad(45)

			for _, plr in ipairs(Players:GetPlayers()) do
				if not runningBoat then break end
				if plr ~= Player
				and plr.Character
				and plr.Character:FindFirstChild("HumanoidRootPart")
				and (targetNameBoat == "" or plr.Name:lower():find(targetNameBoat:lower())) then

					local phrp = plr.Character.HumanoidRootPart

					if targetNameBoat ~= "" then
						for _, s in ipairs(seats) do
							if s.Occupant and s.Occupant.Parent == plr.Character then
								vehicle:SetPrimaryPartCFrame(CFrame.new(0, -1e6, 0))
								runningBoat = false
								bBoatTP.Text = "ATIVAR BOAT TP"
								bBoatTP.BackgroundColor3 = Color3.fromRGB(40,120,40)
								return
							end
						end
					end

					vehicle:SetPrimaryPartCFrame(
						phrp.CFrame
						* CFrame.new(0, 0, -3)
						* CFrame.Angles(0, spinAngleBoat, 0)
					)

					task.wait(0.03)
				end
			end
		end
	end)
end

bBoatTP.MouseButton1Click:Connect(function()
	runningBoat = not runningBoat
	if runningBoat then
		bBoatTP.Text = "DESATIVAR BOAT TP"
		bBoatTP.BackgroundColor3 = Color3.fromRGB(140,40,40)
		startBoatTP()
	else
		bBoatTP.Text = "ATIVAR BOAT TP"
		bBoatTP.BackgroundColor3 = Color3.fromRGB(40,120,40)
	end
end)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local WearRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Wear")

--------------------------------------------------------------------
-- GUI (MENOR E MAIS BONITA)
--------------------------------------------------------------------

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,300,0,150)
frame.Position = UDim2.new(0.5,-150,0.5,-75)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.Active = true
frame.Draggable = true
frame.BorderSizePixel = 0
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,18)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(0,170,255)
stroke.Thickness = 2

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,30)
title.BackgroundTransparency = 1
title.Text = "COPIAR SKIN"
title.TextColor3 = Color3.fromRGB(0,170,255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(0.85,0,0,35)
box.Position = UDim2.new(0.075,0,0.35,0)
box.PlaceholderText = "Digite 3 letras do nome"
box.TextScaled = true
box.Font = Enum.Font.Gotham
box.BackgroundColor3 = Color3.fromRGB(35,35,35)
box.TextColor3 = Color3.new(1,1,1)
box.BorderSizePixel = 0
Instance.new("UICorner", box).CornerRadius = UDim.new(0,12)

local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(0.85,0,0,35)
button.Position = UDim2.new(0.075,0,0.7,0)
button.Text = "COPIAR"
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.BackgroundColor3 = Color3.fromRGB(0,170,255)
button.TextColor3 = Color3.new(1,1,1)
button.BorderSizePixel = 0
Instance.new("UICorner", button).CornerRadius = UDim.new(0,12)

--------------------------------------------------------------------
-- PEGAR IDS COMPLETOS
--------------------------------------------------------------------

local function pegarIDs(target)

    if not target.Character then return {} end
    local humanoid = target.Character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return {} end

    local desc = humanoid:GetAppliedDescription()
    local ids = {}

    local propriedadesNumero = {
        "Shirt","Pants","GraphicTShirt","Face","Head","Torso",
        "LeftArm","RightArm","LeftLeg","RightLeg",
        "ClimbAnimation","FallAnimation","IdleAnimation",
        "JumpAnimation","RunAnimation","SwimAnimation","WalkAnimation"
    }

    for _, prop in ipairs(propriedadesNumero) do
        local value = desc[prop]
        if typeof(value) == "number" and value > 0 then
            table.insert(ids, value)
        end
    end

    local acessorios = {
        desc.BackAccessory, desc.FaceAccessory, desc.FrontAccessory,
        desc.HairAccessory, desc.HatAccessory, desc.NeckAccessory,
        desc.ShouldersAccessory, desc.WaistAccessory
    }

    for _, acc in ipairs(acessorios) do
        if acc and acc ~= "" then
            for id in string.gmatch(acc, "%d+") do
                table.insert(ids, tonumber(id))
            end
        end
    end
--------------------------------------------------------------------
-- COPIAR SKIN (ABA INICIO - EMBAIXO DO BOAT TP)
--------------------------------------------------------------------

local WearRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Wear")

local function pegarIDs(target)
	if not target.Character then return {} end
	local humanoid = target.Character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return {} end

	local desc = humanoid:GetAppliedDescription()
	local ids = {}

	local propriedadesNumero = {
		"Shirt","Pants","GraphicTShirt","Face","Head","Torso",
		"LeftArm","RightArm","LeftLeg","RightLeg",
		"ClimbAnimation","FallAnimation","IdleAnimation",
		"JumpAnimation","RunAnimation","SwimAnimation","WalkAnimation"
	}

	for _, prop in ipairs(propriedadesNumero) do
		local value = desc[prop]
		if typeof(value) == "number" and value > 0 then
			table.insert(ids, value)
		end
	end

	local acessorios = {
		desc.BackAccessory, desc.FaceAccessory, desc.FrontAccessory,
		desc.HairAccessory, desc.HatAccessory, desc.NeckAccessory,
		desc.ShouldersAccessory, desc.WaistAccessory
	}

	for _, acc in ipairs(acessorios) do
		if acc and acc ~= "" then
			for id in string.gmatch(acc, "%d+") do
				table.insert(ids, tonumber(id))
			end
		end
	 end

	return ids
end

local function encontrarJogadorPorParte(nomeParcial)
	nomeParcial = string.lower(nomeParcial)

	for _, plr in ipairs(Players:GetPlayers()) do
		if string.find(string.lower(plr.Name), nomeParcial, 1, true) then
			return plr
		end
	end

	return nil
end

-- FRAME
local frameSkin = Instance.new("Frame", pagDar)
frameSkin.Size = UDim2.new(0,260,0,120)
frameSkin.Position = UDim2.new(0,20,0,200)
frameSkin.BackgroundColor3 = Color3.fromRGB(20,20,20)
frameSkin.BorderSizePixel = 0

Instance.new("UICorner", frameSkin).CornerRadius = UDim.new(0,15)

local strokeSkin = Instance.new("UIStroke", frameSkin)
strokeSkin.Color = Color3.fromRGB(0,170,255)
strokeSkin.Thickness = 1.5

local titleSkin = Instance.new("TextLabel", frameSkin)
titleSkin.Size = UDim2.new(1,0,0,30)
titleSkin.BackgroundTransparency = 1
titleSkin.Text = "COPIAR SKIN"
titleSkin.TextColor3 = Color3.fromRGB(0,170,255)
titleSkin.TextScaled = true
titleSkin.Font = Enum.Font.GothamBold

local box = Instance.new("TextBox", frameSkin)
box.Size = UDim2.new(0.85,0,0,35)
box.Position = UDim2.new(0.075,0,0,40)
box.PlaceholderText = "Digite 3 letras do nome"
box.TextScaled = true
box.Font = Enum.Font.Gotham
box.BackgroundColor3 = Color3.fromRGB(35,35,35)
box.TextColor3 = Color3.new(1,1,1)
box.BorderSizePixel = 0
Instance.new("UICorner", box).CornerRadius = UDim.new(0,12)

local buttonSkin = Instance.new("TextButton", frameSkin)
buttonSkin.Size = UDim2.new(0.85,0,0,35)
buttonSkin.Position = UDim2.new(0.075,0,0,80)
buttonSkin.Text = "COPIAR"
buttonSkin.TextScaled = true
buttonSkin.Font = Enum.Font.GothamBold
buttonSkin.BackgroundColor3 = Color3.fromRGB(0,170,255)
buttonSkin.TextColor3 = Color3.new(1,1,1)
buttonSkin.BorderSizePixel = 0
Instance.new("UICorner", buttonSkin).CornerRadius = UDim.new(0,12)

addClickSound(buttonSkin)

-- BOTÃO FUNCIONANDO
buttonSkin.MouseButton1Click:Connect(function()

	local nome = box.Text

	if #nome < 3 then
		warn("Digite pelo menos 3 letras.")
		return
	end

	local target = encontrarJogadorPorParte(nome)

	if not target then
		warn("Jogador não encontrado.")
		return
	end

	local ids = pegarIDs(target)

	for _, id in ipairs(ids) do
		WearRemote:InvokeServer(id)
	end

	print("Todos os IDs enviados para Wear.")
end)
--------------------------------------------------------------------
-- PEGAR ITENS
--------------------------------------------------------------------

local bPegar = Instance.new("TextButton", pagPegar)
bPegar.Size = UDim2.new(0,200,0,50)
bPegar.Position = UDim2.new(0,20,0,20)
bPegar.BackgroundColor3 = Color3.fromRGB(50,150,200)
bPegar.Text = "LIGAR / DESLIGAR AUTO PEGAR"
bPegar.TextColor3 = Color3.new(1,1,1)
bPegar.Font = Enum.Font.GothamBold
bPegar.TextScaled = true
addClickSound(bPegar)

local ativoPegar = false
bPegar.MouseButton1Click:Connect(function()
	ativoPegar = not ativoPegar
	bPegar.Text = ativoPegar and "AUTO PEGAR ATIVADO" or "LIGAR / DESLIGAR AUTO PEGAR"
end)

task.spawn(function()
	while true do
		if ativoPegar then
			for _, item in ipairs(itensParaPegar) do
				if not temItem(item) then
					remotePick:InvokeServer("PickingTools", item)
				end
			end
		end
		task.wait(0.5)
	end
end)
--------------------------------------------------------------------
-- RP NAME COLOR (ABA PEGAR ITENS)
--------------------------------------------------------------------

local remoteColor = Rep:WaitForChild("RE"):WaitForChild("1RPNam1eColo1r")

local frameColor = Instance.new("Frame", pagPegar)
frameColor.Size = UDim2.new(0, 220, 0, 110)
frameColor.Position = UDim2.new(0, 260, 0, 20)
frameColor.BackgroundColor3 = Color3.fromRGB(25,25,25)
frameColor.BorderSizePixel = 0

local cCorner = Instance.new("UICorner", frameColor)
cCorner.CornerRadius = UDim.new(0,12)

local titleColor = Instance.new("TextLabel", frameColor)
titleColor.Size = UDim2.new(1,0,0,30)
titleColor.BackgroundTransparency = 1
titleColor.Text = "RP NAME RGB"
titleColor.TextColor3 = Color3.new(1,1,1)
titleColor.Font = Enum.Font.GothamBold
titleColor.TextScaled = true

local btnColor = Instance.new("TextButton", frameColor)
btnColor.Size = UDim2.new(0,160,0,40)
btnColor.Position = UDim2.new(0.5,-80,0,55)
btnColor.Text = "ATIVAR"
btnColor.BackgroundColor3 = Color3.fromRGB(40,40,40)
btnColor.TextColor3 = Color3.new(1,1,1)
btnColor.Font = Enum.Font.GothamBold
btnColor.TextScaled = true
btnColor.BorderSizePixel = 0
addClickSound(btnColor)

local ativoRGB = false

local function enviarCor(cor)
	remoteColor:FireServer("PickingRPNameColor", cor)
	remoteColor:FireServer("PickingRPBioColor", cor)
end

local function rainbow(t)
	return Color3.new(
		math.sin(t*2)*0.5+0.5,
		math.sin(t*2+2)*0.5+0.5,
		math.sin(t*2+4)*0.5+0.5
	)
end

task.spawn(function()
	while true do
		if ativoRGB then
			enviarCor(rainbow(tick()))
		end
		task.wait(0.05)
	end
end)

btnColor.MouseButton1Click:Connect(function()
	ativoRGB = not ativoRGB
	btnColor.Text = ativoRGB and "DESATIVAR" or "ATIVAR"
	btnColor.BackgroundColor3 = ativoRGB and Color3.fromRGB(0,170,0) or Color3.fromRGB(40,40,40)

	if not ativoRGB then
		enviarCor(Color3.new(1,1,1))
	end
end)
--------------------------------------------------------------------
-- AUTO PEGAR AVATAR (NOVO)
--------------------------------------------------------------------

local bAvatar = Instance.new("TextButton", pagPegar)
bAvatar.Size = UDim2.new(0,200,0,50)
bAvatar.Position = UDim2.new(0,20,0,90)
bAvatar.BackgroundColor3 = Color3.fromRGB(150,50,200)
bAvatar.Text = "LIGAR / DESLIGAR AUTO PEGAR AVATAR"
bAvatar.TextColor3 = Color3.new(1,1,1)
bAvatar.Font = Enum.Font.GothamBold
bAvatar.TextScaled = true
addClickSound(bAvatar)

local ativoAvatar = false
bAvatar.MouseButton1Click:Connect(function()
	ativoAvatar = not ativoAvatar
	bAvatar.Text = ativoAvatar and "AUTO AVATAR ATIVADO" or "LIGAR / DESLIGAR AUTO PEGAR AVATAR"
end)

task.spawn(function()
	while true do
		if ativoAvatar then

			local R = Rep.Remotes

			R.WearShirt:InvokeServer(1453093923)
			R.WearPants:InvokeServer(45472753)

			R.ChangeCharacterBody:InvokeServer({
				27112025,
				27112039,
				27112052,
				27112068,
				27112056,
				0
			})

			R.Wear:InvokeServer(14892162637)
			R.Wear:InvokeServer(122233335523805)

			R.Wear:InvokeServer(892269341)
			R.Wear:InvokeServer(892265784)
			R.Wear:InvokeServer(892267099)
			R.Wear:InvokeServer(892268340)
			R.Wear:InvokeServer(892267917)
			R.Wear:InvokeServer(892268710)
			R.Wear:InvokeServer(892267521)

		end
		task.wait(2)
	end
end)

--------------------------------------------------------------------
-- AUTO ACEITAR
--------------------------------------------------------------------
-- AUTO BOMB INFINITO | davizifi3

local Players = game:GetService("Players")
local Rep = game:GetService("ReplicatedStorage")
local lp = Players.LocalPlayer
local PlayerGui = lp:WaitForChild("PlayerGui")

-- módulo do jogo
local module = require(PlayerGui:WaitForChild("Player8Handler"):WaitForChild("Game8Settings"))
local BlowBombsServer = module.BlowBombsServer

local ToolRemote = Rep:WaitForChild("RE"):WaitForChild("1Too1l")

-- ===== BOTÃO (DENTRO DA ABA TROLL) =====
-- pagAceitar = ABA TROLL (já existente no seu script)

local btn = Instance.new("TextButton", pagAceitar)
btn.Size = UDim2.new(0,180,0,45)
btn.Position = UDim2.new(0,20,0,20)
btn.TextScaled = true
btn.TextColor3 = Color3.new(1,1,1)
btn.BackgroundColor3 = Color3.fromRGB(200,50,50)
btn.Text = "AUTO BOMB: OFF"
btn.BorderSizePixel = 0

-- ===== VARS =====
local ON = false
local SPEED = 0.05

-- ===== FUNÇÕES =====
local function hasBomb()
	return lp.Backpack:FindFirstChild("Bomb")
		or (lp.Character and lp.Character:FindFirstChild("Bomb"))
end

local function pickBomb()
	ToolRemote:InvokeServer("PickingTools", "Bomb")
end

btn.MouseButton1Click:Connect(function()
	ON = not ON
	btn.Text = ON and "AUTO BOMB: ON" or "AUTO BOMB: OFF"
	btn.BackgroundColor3 = ON
		and Color3.fromRGB(50,200,50)
		or Color3.fromRGB(200,50,50)
end)

-- ===== LOOP PRINCIPAL =====
task.spawn(function()
	while true do
		if ON then
			pcall(function()

				if not hasBomb() then
					pickBomb()
					task.wait(0.2)
					return
				end

				local bomb = lp.Backpack:FindFirstChild("Bomb")
					or lp.Character:FindFirstChild("Bomb")
				if not bomb then return end

				bomb.Parent = lp.Character
				task.wait(SPEED)

				bomb:Activate()
				task.wait(SPEED)

				BlowBombsServer:FireServer("Bomb"..lp.Name)
			end)
		end
		task.wait(SPEED)
	end
end)

--------------------------------------------------------------------
-- AUTO FAMILY | ABA TROLL
--------------------------------------------------------------------

local Players = game:GetService("Players")
local Rep = game:GetService("ReplicatedStorage")
local lp = Players.LocalPlayer

local CreateFamily = Rep:WaitForChild("Remotes"):WaitForChild("CreateFamily")
local InviteFamily = Rep:WaitForChild("Remotes"):WaitForChild("InvitePlayerToFamily")

local familyON = false
local familyCreated = false

-- BOTÃO AUTO FAMILY (ABA TROLL)
local btnFamily = Instance.new("TextButton", pagAceitar)
btnFamily.Size = UDim2.new(0,180,0,45)
btnFamily.Position = UDim2.new(0,20,0,75) -- 👈 abaixo do Auto Bomb
btnFamily.Text = "AUTO FAMILY: OFF"
btnFamily.TextScaled = true
btnFamily.Font = Enum.Font.GothamBold
btnFamily.TextColor3 = Color3.new(1,1,1)
btnFamily.BackgroundColor3 = Color3.fromRGB(60,60,160)
btnFamily.BorderSizePixel = 0
addClickSound(btnFamily)

btnFamily.MouseButton1Click:Connect(function()
	familyON = not familyON
	btnFamily.Text = familyON and "AUTO FAMILY: ON" or "AUTO FAMILY: OFF"
	btnFamily.BackgroundColor3 = familyON
		and Color3.fromRGB(50,200,50)
		or Color3.fromRGB(60,60,160)
end)

-- LOOP AUTO FAMILY
task.spawn(function()
	while true do
		if familyON then
			pcall(function()
				if not familyCreated then
					CreateFamily:FireServer()
					familyCreated = true
					task.wait(1)
				end

				for _,plr in ipairs(Players:GetPlayers()) do
					if plr ~= lp then
						InviteFamily:FireServer(plr.UserId, "FamilyInviteMenu")
					end
				end
			end)
		end
		task.wait(2)
	end
end)
--------------------------------------------------------------------
-- Premium
--------------------------------------------------------------------
--------------------------------------------------------------------
-- RAINBOW MOTOR (ABA PREMIUM)
--------------------------------------------------------------------

local RunService = game:GetService("RunService")
local remoteMotor = Rep:WaitForChild("RE"):WaitForChild("1Player1sCa1r")

-- Frame
local frameMotor = Instance.new("Frame", pagEquip)
frameMotor.Size = UDim2.new(0, 260, 0, 120)
frameMotor.Position = UDim2.new(0, 20, 0, 20)
frameMotor.BackgroundColor3 = Color3.fromRGB(25,25,25)
frameMotor.BorderSizePixel = 0

local cornerMotor = Instance.new("UICorner", frameMotor)
cornerMotor.CornerRadius = UDim.new(0,15)

local strokeMotor = Instance.new("UIStroke", frameMotor)
strokeMotor.Color = Color3.fromRGB(0,170,255)
strokeMotor.Thickness = 1.5

-- Título
local titleMotor = Instance.new("TextLabel", frameMotor)
titleMotor.Size = UDim2.new(1,0,0,35)
titleMotor.BackgroundTransparency = 1
titleMotor.Text = "RAINBOW MOTOR"
titleMotor.Font = Enum.Font.GothamBold
titleMotor.TextScaled = true
titleMotor.TextColor3 = Color3.new(1,1,1)

-- Botão
local btnMotor = Instance.new("TextButton", frameMotor)
btnMotor.Size = UDim2.new(0,180,0,45)
btnMotor.Position = UDim2.new(0.5,-90,0,55)
btnMotor.Text = "ATIVAR"
btnMotor.BackgroundColor3 = Color3.fromRGB(40,40,40)
btnMotor.TextColor3 = Color3.new(1,1,1)
btnMotor.Font = Enum.Font.GothamBold
btnMotor.TextScaled = true
btnMotor.BorderSizePixel = 0
addClickSound(btnMotor)

local cornerBtnMotor = Instance.new("UICorner", btnMotor)
cornerBtnMotor.CornerRadius = UDim.new(0,12)

-- Sistema Rainbow Suave
local motorON = false
local hue = 0
local speed = 0.2
local motorConnection

local function startMotor()
	motorConnection = RunService.RenderStepped:Connect(function(delta)
		hue = (hue + delta * speed) % 1
		local color = Color3.fromHSV(hue,1,1)
		remoteMotor:FireServer("NoMotorColor", color)
	end)
end

local function stopMotor()
	if motorConnection then
		motorConnection:Disconnect()
		motorConnection = nil
	end
	remoteMotor:FireServer("NoMotorColor", Color3.new(0,0,0))
end

btnMotor.MouseButton1Click:Connect(function()
	motorON = not motorON
	
	if motorON then
		btnMotor.Text = "DESATIVAR"
		btnMotor.BackgroundColor3 = Color3.fromRGB(170,40,40)
		startMotor()
	else
		btnMotor.Text = "ATIVAR"
		btnMotor.BackgroundColor3 = Color3.fromRGB(40,40,40)
		stopMotor()
	end
end)


--------------------------------------------------------------------
-- House
--------------------------------------------------------------------

--------------------------------------------------------------------
-- AUTO CAMPANHA + AUTO KNOCK (ABA HOUSE)
--------------------------------------------------------------------

local autoHouseON = false

local frameHouse = Instance.new("Frame", pagPlayers)
frameHouse.Size = UDim2.new(0, 260, 0, 120)
frameHouse.Position = UDim2.new(0, 20, 0, 20)
frameHouse.BackgroundColor3 = Color3.fromRGB(25,25,25)
frameHouse.BorderSizePixel = 0

local cornerHouse = Instance.new("UICorner", frameHouse)
cornerHouse.CornerRadius = UDim.new(0,15)

local strokeHouse = Instance.new("UIStroke", frameHouse)
strokeHouse.Color = Color3.fromRGB(0,170,255)
strokeHouse.Thickness = 1.5

local titleHouse = Instance.new("TextLabel", frameHouse)
titleHouse.Size = UDim2.new(1,0,0,35)
titleHouse.BackgroundTransparency = 1
titleHouse.Text = "AUTO DOORBELL"
titleHouse.Font = Enum.Font.GothamBold
titleHouse.TextScaled = true
titleHouse.TextColor3 = Color3.new(1,1,1)

local btnHouse = Instance.new("TextButton", frameHouse)
btnHouse.Size = UDim2.new(0,180,0,45)
btnHouse.Position = UDim2.new(0.5,-90,0,55)
btnHouse.Text = "ATIVAR"
btnHouse.BackgroundColor3 = Color3.fromRGB(40,40,40)
btnHouse.TextColor3 = Color3.new(1,1,1)
btnHouse.Font = Enum.Font.GothamBold
btnHouse.TextScaled = true
btnHouse.BorderSizePixel = 0
addClickSound(btnHouse)

local cornerBtnHouse = Instance.new("UICorner", btnHouse)
cornerBtnHouse.CornerRadius = UDim.new(0,12)

-- FUNÇÃO QUE FUNCIONA EM QUALQUER CASA
local function clicarCampainha()
	for _, obj in pairs(workspace:GetDescendants()) do
		if obj:IsA("ClickDetector") then
			if obj.Parent and obj.Parent.Name == "TouchBell" then
				fireclickdetector(obj)
			end
		end
	end
end

-- LOOP
task.spawn(function()
	while true do
		if autoHouseON then
			pcall(function()
				clicarCampainha()
			end)
		end
		task.wait(0.5)
	end
end)

-- BOTÃO
btnHouse.MouseButton1Click:Connect(function()
	autoHouseON = not autoHouseON
	
	if autoHouseON then
		btnHouse.Text = "DESATIVAR"
		btnHouse.BackgroundColor3 = Color3.fromRGB(170,40,40)
	else
		btnHouse.Text = "ATIVAR"
		btnHouse.BackgroundColor3 = Color3.fromRGB(40,40,40)
	end
end)
--------------------------------------------------------------------
-- RAINBOW HOUSE (ABA HOUSE)
--------------------------------------------------------------------

local remoteHouseColor = Rep:WaitForChild("RE"):WaitForChild("1Player1sHous1e")

local frameRainbowHouse = Instance.new("Frame", pagPlayers)
frameRainbowHouse.Size = UDim2.new(0, 260, 0, 120)
frameRainbowHouse.Position = UDim2.new(0, 20, 0, 160) -- 👈 EMBAIXO DO AUTO DOORBELL
frameRainbowHouse.BackgroundColor3 = Color3.fromRGB(25,25,25)
frameRainbowHouse.BorderSizePixel = 0

local cornerRainbowHouse = Instance.new("UICorner", frameRainbowHouse)
cornerRainbowHouse.CornerRadius = UDim.new(0,15)

local strokeRainbowHouse = Instance.new("UIStroke", frameRainbowHouse)
strokeRainbowHouse.Color = Color3.fromRGB(170,0,255)
strokeRainbowHouse.Thickness = 1.5

local titleRainbowHouse = Instance.new("TextLabel", frameRainbowHouse)
titleRainbowHouse.Size = UDim2.new(1,0,0,35)
titleRainbowHouse.BackgroundTransparency = 1
titleRainbowHouse.Text = "RAINBOW HOUSE"
titleRainbowHouse.Font = Enum.Font.GothamBold
titleRainbowHouse.TextScaled = true
titleRainbowHouse.TextColor3 = Color3.new(1,1,1)

local btnRainbowHouse = Instance.new("TextButton", frameRainbowHouse)
btnRainbowHouse.Size = UDim2.new(0,180,0,45)
btnRainbowHouse.Position = UDim2.new(0.5,-90,0,55)
btnRainbowHouse.Text = "ATIVAR"
btnRainbowHouse.BackgroundColor3 = Color3.fromRGB(40,40,40)
btnRainbowHouse.TextColor3 = Color3.new(1,1,1)
btnRainbowHouse.Font = Enum.Font.GothamBold
btnRainbowHouse.TextScaled = true
btnRainbowHouse.BorderSizePixel = 0
addClickSound(btnRainbowHouse)

local cornerBtnRainbow = Instance.new("UICorner", btnRainbowHouse)
cornerBtnRainbow.CornerRadius = UDim.new(0,12)

-- SISTEMA RAINBOW SUAVE
local rainbowHouseON = false
local hueHouse = 0
local speedHouse = 0.15
local houseConnection

local RunService = game:GetService("RunService")

local function startRainbowHouse()
	houseConnection = RunService.RenderStepped:Connect(function(delta)
		hueHouse = (hueHouse + delta * speedHouse) % 1
		local color = Color3.fromHSV(hueHouse,1,1)
		remoteHouseColor:FireServer("ColorPickHouse", color)
		btnRainbowHouse.BackgroundColor3 = color
	end)
end

local function stopRainbowHouse()
	if houseConnection then
		houseConnection:Disconnect()
		houseConnection = nil
	end
	
	btnRainbowHouse.BackgroundColor3 = Color3.fromRGB(40,40,40)
	remoteHouseColor:FireServer("ColorPickHouse", Color3.new(1,1,1))
end

btnRainbowHouse.MouseButton1Click:Connect(function()
	rainbowHouseON = not rainbowHouseON
	
	if rainbowHouseON then
		btnRainbowHouse.Text = "DESATIVAR"
		startRainbowHouse()
	else
		btnRainbowHouse.Text = "ATIVAR"
		stopRainbowHouse()
	end
end)
--------------------------------------------------------------------
-- Credits
--------------------------------------------------------------------
local creditsFrame = Instance.new("Frame", pagTP)
creditsFrame.Size = UDim2.new(1,0,1,0)
creditsFrame.BackgroundTransparency = 1

local creditsTitle = Instance.new("TextLabel", creditsFrame)
creditsTitle.Size = UDim2.new(1,0,0,60)
creditsTitle.Position = UDim2.new(0,0,0,30)
creditsTitle.BackgroundTransparency = 1
creditsTitle.Text = "DAVIZINSCRIPTS PRO MAX V6"
creditsTitle.Font = Enum.Font.GothamBold
creditsTitle.TextScaled = true
creditsTitle.TextColor3 = Color3.fromRGB(0,170,255)

local creditsText = Instance.new("TextLabel", creditsFrame)
creditsText.Size = UDim2.new(1,-40,0,200)
creditsText.Position = UDim2.new(0,20,0,120)
creditsText.BackgroundTransparency = 1
creditsText.TextWrapped = true
creditsText.TextScaled = true
creditsText.Font = Enum.Font.Gotham
creditsText.TextColor3 = Color3.new(1,1,1)
creditsText.Text = "Criado por: DAVIZINSCRIPTS\n\nTikTok: @davizinscriptsofc\n\nEsse script foi feito 100% sozinho por mim.\nSem ajuda de ninguém."

--------------------------------------------------------------------
-- EVENTOS DAS ABAS
--------------------------------------------------------------------

abaDar.MouseButton1Click:Connect(function() abrir(pagDar) end)
abaPegar.MouseButton1Click:Connect(function() abrir(pagPegar) end)
abaAceitar.MouseButton1Click:Connect(function() abrir(pagAceitar) end)
abaEquip.MouseButton1Click:Connect(function() abrir(pagEquip) end)
abaPlayers.MouseButton1Click:Connect(function() abrir(pagPlayers) end)
abaTP.MouseButton1Click:Connect(function() abrir(pagTP) end)

--------------------------------------------------------------------
-- LOGIN FINAL
--------------------------------------------------------------------

botaoLogin.MouseButton1Click:Connect(function()
	if senhaBox.Text == "FREE_1020304FKKWKEF24H" then
		loginGui:Destroy()
		gui.Enabled = true

		local args1 = { "RolePlayName", "davizinscriptsofc" }
		Rep.RE["1RPNam1eTex1t"]:FireServer(unpack(args1))
		local args2 = { "RolePlayBio", "@davizinscriptsofc" }
		Rep.RE["1RPNam1eTex1t"]:FireServer(unpack(args2))
	else
		senhaBox.Text = ""
		senhaBox.PlaceholderText = "Senha incorreta"
	end
end)
