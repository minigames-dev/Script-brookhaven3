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
-- LOGIN
--------------------------------------------------------------------

local loginGui = Instance.new("ScreenGui", Player.PlayerGui)
loginGui.Name = "loginDavizin"

local loginFrame = Instance.new("Frame", loginGui)
loginFrame.Size = UDim2.new(0,300,0,200)
loginFrame.Position = UDim2.new(0.5,-150,0.4,-100)
loginFrame.Active = true
loginFrame.Draggable = true
loginFrame.BorderSizePixel = 0
loginFrame.AnchorPoint = Vector2.new(0.5,0.5)
loginFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)

local loginTitulo = Instance.new("TextLabel", loginFrame)
loginTitulo.Size = UDim2.new(1,0,0,40)
loginTitulo.BackgroundColor3 = Color3.fromRGB(40,40,40)
loginTitulo.Text = "davizinscripts - Login"
loginTitulo.Font = Enum.Font.GothamBold
loginTitulo.TextScaled = true
loginTitulo.TextColor3 = Color3.new(1,1,1)

local senhaBox = Instance.new("TextBox", loginFrame)
senhaBox.Size = UDim2.new(1,-20,0,40)
senhaBox.Position = UDim2.new(0,10,0,70)
senhaBox.PlaceholderText = "Digite a senha"
senhaBox.Text = ""
senhaBox.Font = Enum.Font.GothamBold
senhaBox.TextScaled = true
senhaBox.TextColor3 = Color3.new(1,1,1)
senhaBox.BackgroundColor3 = Color3.fromRGB(55,55,55)

local botaoLogin = Instance.new("TextButton", loginFrame)
botaoLogin.Size = UDim2.new(1,-20,0,40)
botaoLogin.Position = UDim2.new(0,10,0,130)
botaoLogin.BackgroundColor3 = Color3.fromRGB(70,70,70)
botaoLogin.Text = "ENTRAR"
botaoLogin.TextColor3 = Color3.new(1,1,1)
botaoLogin.Font = Enum.Font.GothamBold
botaoLogin.TextScaled = true
addClickSound(botaoLogin)

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
local abaEquip   = criarAba("AUTO EQUIP",4,totalAbas)
local abaPlayers = criarAba("PLAYERS",5,totalAbas)
local abaTP      = criarAba("TELEPORT",6,totalAbas)

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
-- AUTO EQUIP
--------------------------------------------------------------------

local bEquip = Instance.new("TextButton", pagEquip)
bEquip.Size = UDim2.new(0,200,0,50)
bEquip.Position = UDim2.new(0,20,0,20)
bEquip.BackgroundColor3 = Color3.fromRGB(50,200,50)
bEquip.Text = "LIGAR / DESLIGAR AUTO EQUIP"
bEquip.TextColor3 = Color3.new(1,1,1)
bEquip.Font = Enum.Font.GothamBold
bEquip.TextScaled = true
addClickSound(bEquip)

local ativoEquip = false
bEquip.MouseButton1Click:Connect(function()
	ativoEquip = not ativoEquip
	bEquip.Text = ativoEquip and "AUTO EQUIP ATIVADO" or "LIGAR / DESLIGAR AUTO EQUIP"
end)

task.spawn(function()
	while true do
		if ativoEquip then
			for _,item in ipairs(itensParaPegar) do
				local t = Player.Backpack:FindFirstChild(item)
				if t then Player.Character.Humanoid:EquipTool(t) end
			end
		end
		task.wait(0.3)
	end
end)

--------------------------------------------------------------------
-- PLAYERS
--------------------------------------------------------------------

local listaPlayers = Instance.new("Frame", pagPlayers)
listaPlayers.Size = UDim2.new(0,main.Size.X.Offset-40,0,main.Size.Y.Offset-100)
listaPlayers.Position = UDim2.new(0,20,0,20)
listaPlayers.BackgroundColor3 = Color3.fromRGB(50,50,50)
listaPlayers.Active = true
listaPlayers.Draggable = true
listaPlayers.ClipsDescendants = true

local jogadorSelecionado = nil

local function atualizarLista()
	for _,c in pairs(listaPlayers:GetChildren()) do
		if c:IsA("TextButton") then c:Destroy() end
	end
	for i,p in ipairs(Players:GetPlayers()) do
		local b = Instance.new("TextButton", listaPlayers)
		b.Size = UDim2.new(1,-10,0,35)
		b.Position = UDim2.new(0,5,0,(i-1)*40+5)
		b.BackgroundColor3 = Color3.fromRGB(70,70,70)
		b.Text = p.Name
		b.TextColor3 = Color3.new(1,1,1)
		b.Font = Enum.Font.GothamBold
		b.TextScaled = true
		addClickSound(b)
		b.MouseButton1Click:Connect(function()
			jogadorSelecionado = p
			b.BackgroundColor3 = Color3.fromRGB(0,120,255)
		end)
	end
end

atualizarLista()
Players.PlayerAdded:Connect(atualizarLista)
Players.PlayerRemoving:Connect(atualizarLista)

--------------------------------------------------------------------
-- TELEPORT
--------------------------------------------------------------------

local bTP = Instance.new("TextButton", pagTP)
bTP.Size = UDim2.new(0,200,0,50)
bTP.Position = UDim2.new(0,20,0,20)
bTP.BackgroundColor3 = Color3.fromRGB(150,150,50)
bTP.Text = "TELEPORTAR ATÉ O PLAYER"
bTP.TextColor3 = Color3.new(1,1,1)
bTP.Font = Enum.Font.GothamBold
bTP.TextScaled = true
addClickSound(bTP)

bTP.MouseButton1Click:Connect(function()
	if jogadorSelecionado and jogadorSelecionado.Character
		and jogadorSelecionado.Character:FindFirstChild("HumanoidRootPart") then
		Player.Character:MoveTo(jogadorSelecionado.Character.HumanoidRootPart.Position)
	end
end)

--------------------------------------------------------------------
-- AUTO BAN CASA
--------------------------------------------------------------------

local botaoAutoBan = Instance.new("TextButton", pagTP)
botaoAutoBan.Size = UDim2.new(0,300,0,45)
botaoAutoBan.Position = UDim2.new(0,20,0,90)
botaoAutoBan.BackgroundColor3 = Color3.fromRGB(180,40,40)
botaoAutoBan.Text = "LIGAR AUTO BAN NA MINHA CASA"
botaoAutoBan.TextColor3 = Color3.new(1,1,1)
botaoAutoBan.Font = Enum.Font.GothamBold
botaoAutoBan.TextScaled = true
addClickSound(botaoAutoBan)

local autoBanAtivo = false
botaoAutoBan.MouseButton1Click:Connect(function()
	autoBanAtivo = not autoBanAtivo
	botaoAutoBan.Text = autoBanAtivo and "AUTO BAN ATIVO" or "LIGAR AUTO BAN NA MINHA CASA"
end)

task.spawn(function()
	while true do
		if autoBanAtivo then
			for _, plr in ipairs(Players:GetPlayers()) do
				if plr ~= Player then
					local char = plr.Character
					if char and char:FindFirstChild("HumanoidRootPart") then
						local pos = char.HumanoidRootPart.Position
						local casa = workspace:WaitForChild("001_Lots"):WaitForChild("Itachi_uchihaaq7House")
						local distancia = (pos - casa.HousePickedByPlayer.HouseModel.PrimaryPart.Position).Magnitude
						if distancia < 50 then
							local args = { plr }
							casa.HousePickedByPlayer.HouseModel["Permissions:Disallow"]:FireServer(unpack(args))
						end
					end
				end
			end
		end
		task.wait(1)
	end
end)

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
	if senhaBox.Text == "admin2025" then
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
