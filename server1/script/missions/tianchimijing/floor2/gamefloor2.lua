Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")

GameFloor2 = Game:new()
GameFloor2.szMapType = "Thi�n Tr� M�t C�nh t�ng th� 2" --�ı��ͼ��ʾ
GameFloor2.tbForbitItemType = --���� Υ������
{
	"TRANSFER", "PK","MATE"
}
GameFloor2.Player = {
	szPath = "\\script\\missions\\tianchimijing\\floor2\\playerfloor2.lua",
	szClassName = "PlayerFloor2"
}

GameFloor2.tbNpcTypeList = --npc������
{
	["R��ng ch�a ��"] = 
	{
		nNpcId = 625,
		szName = "R��ng ch�a ��",
		nLevel = 95,		
		szPosPath = "\\settings\\maps\\tianchimijing\\floor2\\pannier.txt",
		szScriptPath = "\\script\\missions\\tianchimijing\\floor2\\chuwuxiang.lua"
	},
	["Ch� d��c �i�m"] = 
	{
		nNpcId = 389,
		szName = "Ch� d��c �i�m",
		nLevel = 95,
		szPosPath = "\\settings\\maps\\tianchimijing\\floor2\\drugstore.txt",
		szScriptPath = "\\script\\missions\\tianchimijing\\floor2\\yaodian.lua"
	},	
	["Th� r�n"] = 
	{
		nNpcId = 197,
		szName = "Th� r�n",
		nLevel = 95,
		szPosPath = "\\settings\\maps\\tianchimijing\\floor2\\smithy.txt",
		szScriptPath = "\\script\\missions\\tianchimijing\\floor2\\tiejiang.lua"
	},
	["Ng��i ti�p d�n M�t C�nh t�ng 3"] = 
	{
		nNpcId = 108,
		szName = "Ng��i ti�p d�n M�t C�nh t�ng 3",
		nLevel = 95,
		szPosPath = "\\settings\\maps\\tianchimijing\\floor2\\tofloor3npc.txt",
		szScriptPath = "\\script\\missions\\tianchimijing\\floor2\\tofloor3npc.lua",
	} 
}
GameFloor2.tbTrapList = 
{

}

function GameFloor2:AddAllNpc()
	for key, value in self.tbNpcTypeList do
		self:AddANpc(key, value.szPosPath)
	end
end

function GameFloor2:Start()
	self:RegAll()
	self:AddAllTrap()
	self:AddAllNpc()
end

GameFloor2:AssociateMap(936)
GameFloor2:SetForbitItem()
