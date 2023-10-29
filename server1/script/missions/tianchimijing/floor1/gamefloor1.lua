Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")

GameFloor1 = Game:new()
GameFloor1.szMapType = "T�ng 1 Thi�n Tr� M�t C�nh" --�ı��ͼ��ʾ
GameFloor1.tbForbitItemType = --���� Υ������
{
	"TRANSFER","MATE"
}
GameFloor1.Player = {
	szPath = "\\script\\missions\\tianchimijing\\floor1\\playerfloor1.lua",
	szClassName = "PlayerFloor1"
}

GameFloor1.PlayerEnterTrapTime = {
}

GameFloor1.tbNpcTypeList = --npc������
{
	["Lo�n Qu�i"] = 
	{
		nNpcId = 1606,
		szName = "S� Tr��ng",
		nLevel = 95,
		bNoRevive = 0, --����
		nIsboss = 0, --�Ի�npc���Բ���Ҫ���
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\monster1.txt"
	},
	["V�ng Huy�n Qu�i"] =
	{--����һ������
		nNpcId = 1608,
		szName = "Ng� Tr��ng",
		nLevel = 95,
		bNoRevive = 0, --����
		nIsboss = 0, --�Ի�npc���Բ���Ҫ���
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\monster2.txt"
	},	
	["H�u Ng��ng Qu�i"] = 
	{--����һ������
		nNpcId = 1607,
		szName = "A L� H�",
		nLevel = 95,
		bNoRevive = 0, --����
		nIsboss = 0, --�Ի�npc���Բ���Ҫ���
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\monster3.txt"
	},	
	["Tr� Ho�n Qu�i"] = 
	{--����һ������
		nNpcId = 1609,
		szName = "S� T�t",
		nLevel = 95,
		bNoRevive = 0, --����
		nIsboss = 0, --�Ի�npc���Բ���Ҫ���
   	szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\monster4.txt"
	},
	["C� quan"] = 
	{
		nNpcId = 1605,
		szName = "C� quan",
		nLevel = 95,
		bNoRevive = 0,
		nIsboss = 1,
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\skillwood.txt"
	},
	["R��ng Binh Kh�"] = 
	{
		nNpcId = 844,
		szName = "R��ng Binh Kh�",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\propsbox.txt",
		szScriptPath = "\\script\\missions\\tianchimijing\\floor1\\box.lua"
	},
	["C�m b�y"] =
	{
		nNpcId = 1611,
		szName = "C�m b�y",
		nLevel = 95,
		nSeries = random(0, 4),
		bNoRevive = 0,
		nIsboss = 1,
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\trapArea.txt"
	},
	["�n Th� Cao Nh�n"] =
	{
		nNpcId = 108,
		szName = "�n Th� Cao Nh�n",
		nLevel = 95,
		bNoRevive = 1,
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\master_hand.txt",
		szScriptPath = "\\script\\missions\\tianchimijing\\floor1\\floor1_masterhand.lua"
	}
}
GameFloor1.tbTrapList = 
{
	["A1"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\A1.txt",--Trap��������ļ�
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\a1trap.lua",--Trap�ű���·��
	},
	["A1front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\A1front.txt",--Trap��������ļ�
		szTrapFile = ""
	},
	["A2"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\A2.txt",--Trap��������ļ�
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\a2trap.lua",--Trap�ű���·��
	},
	["A2front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\A2front.txt",--Trap��������ļ�
		szTrapFile = ""
	},
	["B1"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\B1.txt",--Trap��������ļ�
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\b1trap.lua",--Trap�ű���·��
	},
	["B1front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\B1front.txt",--Trap��������ļ�
		szTrapFile = ""
	},
	["B2"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\B2.txt",--Trap��������ļ�
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\b2trap.lua",--Trap�ű���·��
	},
	["B2front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\B2front.txt",--Trap��������ļ�
		szTrapFile = ""
	},
	["D1"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\D1.txt",--Trap��������ļ�
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\d1trap.lua",--Trap�ű���·��
	},
	["D1front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\D1front.txt",--Trap��������ļ�
		szTrapFile = ""
	},
	["D2"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\D2.txt",--Trap��������ļ�
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\d2trap.lua",--Trap�ű���·��
	},
	["D2front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\D2front.txt",--Trap��������ļ�
		szTrapFile = ""
	},
	["E1"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\E1.txt",--Trap��������ļ�
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\e1trap.lua",--Trap�ű���·��
	},
	["E1front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\E1front.txt",--Trap��������ļ�
		szTrapFile = ""
	},
	["E2"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\E2.txt",--Trap��������ļ�
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\e2trap.lua",--Trap�ű���·��
	},
	["E2front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\E2front.txt",--Trap��������ļ�
		szTrapFile = ""
	},
	["F1"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\F1.txt",--Trap��������ļ�
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\f1trap.lua",--Trap�ű���·��
	},
	["F1front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\F1front.txt",--Trap��������ļ�
		szTrapFile = ""
	},
	["F2"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\F2.txt",--Trap��������ļ�
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\f2trap.lua",--Trap�ű���·��
	},
	["F2front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\F2front.txt",--Trap��������ļ�
		szTrapFile = ""
	},
	["G1"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\G1.txt",--Trap��������ļ�
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\g1trap.lua",--Trap�ű���·��
	}, 
	["G1front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\G1front.txt",--Trap��������ļ�
		szTrapFile = ""
	},
	["G2"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\G2.txt",--Trap��������ļ�
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\g2trap.lua",--Trap�ű���·��
	},
	["G2front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\G2front.txt",--Trap��������ļ�
		szTrapFile = ""
	},
	["�i�m truy�n t�ng c�a �n Th� Cao Nh�n"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\masterhandtrap.txt",
		szTrapFile = ""
	},
	["ToFloor2"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\to_floor2.txt",
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\tofloor2.lua"
	}
}

function GameFloor1:AddAllNpc()
	for key, value in self.tbNpcTypeList do
		self:AddANpc(key, value.szPosPath)
	end
end

function GameFloor1:Start()
	self:RegAll()
	self:AddAllTrap()
	self:AddAllNpc()
end


GameFloor1:AssociateMap(935)
GameFloor1:SetForbitItem()

