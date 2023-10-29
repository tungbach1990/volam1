
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\global\\station.lua")
local tbNpcList = 
{
	{
		nNpcId = 950, 
		szName = "Y m�o ��nh ch� ��i s�", 
		szScriptPath = "\\script\\changefeature\\feature_man.lua",
		nMapId = 934,
			
		nPosX = 50880,
		nPosY = 102752,
	},
	{
		nNpcId = 950, 
		szName = "Y m�o ��nh ch� tr� th�", 
		szScriptPath = "\\script\\changefeature\\feature_man.lua",
		nMapId = 934,
		nPosX = 50080,
		nPosY = 103744,
	},
	{
		nNpcId = 625, 
		szName = "R��ng ch�a ��", 
		szScriptPath = "\\script\\changefeature\\npc\\box.lua",
		nMapId = 934,
		nPosX = 50112,
		nPosY = 106208,
	},
	{
		nNpcId = 393, 
		szName = "Xa phu", 
		szScriptPath = "\\script\\changefeature\\npc\\chefu.lua",
		nMapId = 934,
		
		nPosX = 49632,
		nPosY = 105696,
	},
}

function AddDailogNpc()
	for i=1, getn(%tbNpcList) do
		local tbNpc = %tbNpcList[i]
		basemission_CallNpc(tbNpc)
	end
end
