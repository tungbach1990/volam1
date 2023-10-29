Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")

YueGeDaoWorld = Game:new()
YueGeDaoWorld.szMapType = "Nguy�t Ca ��o" --�ı��ͼ��ʾ

YueGeDaoWorld.tbForbitItemType = --���� Υ������
{
	"TRANSFER","MATE"
}

YueGeDaoWorld.Player = {
	szPath = "\\script\\missions\\yuegedao\\yuegedao\\yuegedaoplayer.lua",
	szClassName = "YueGeDaoPlayer",
}

YueGeDaoWorld.PlayerEnterTrapTime = {
}

YueGeDaoWorld.tbNpcTypeList = --npc������
{
	["Nguy�t Ca V� V� 1"] = 
	{
		nNpcId = 1847,
		szName = "Nguy�t Ca V� V�",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\yuegewuwei1.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\yuegewuwei1.lua",
	},
	["Nguy�t Ca V� V� 2"] = 
	{
		nNpcId = 1847,
		szName = "Nguy�t Ca V� V�",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\yuegewuwei2.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\yuegewuwei2.lua",
	},
	["Nguy�t Ca ��o Ch�"] = 
	{
		nNpcId = 1849,
		szName = "Nguy�t Ca ��o Ch�",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\yuegedaozhu.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\yuegedaozhu.lua",
	},
	["Th� M�c"] = 
	{
		nNpcId = 1861,
		szName = "Th� M�c",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\shumu.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\shumu.lua",
	},
	["Nguy�t Ca Ki�m Th�"] = 
	{
		nNpcId = 1848,
		szName = "Nguy�t Ca Ki�m Th�",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\yuegejianshi.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\yuegejianshi.lua",
	},
	["Bia ��"] = 
	{
		nNpcId = 1865,
		szName = "Bia ��",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\shibei.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\shibei.lua",
	},
	["Bia �� Ki�m Gia"] = 
	{
		nNpcId = 1860,
		szName = "Bia �� Ki�m Gia",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\shibeiex.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\shibeiex.lua",
	},
	["Ki�m Si"] = 
	{
		nNpcId = 1853,
		szName = "Ki�m Si",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\jianchi.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\npcdeath.lua",
	},
	["Ki�m Cu�ng"] = 
	{
		nNpcId = 1854,
		szName = "Ki�m Cu�ng",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\jiankuang.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\npcdeath.lua",
	},
	["V� l�m nh�n s� c�a Th�n tr� b�t thanh"] = 
	{
		nNpcId = 1854,
		szName = "V� l�m nh�n s�",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\shenzhibuqingdewulingrenshi.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\npcdeath.lua",
	},
	["Thuy�n Phu Nguy�t Ca ��o"] = 
	{
		nNpcId = 240,
		szName = "Thuy�n Phu Nguy�t Ca ��o",
		nLevel = 95,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\chuanfu.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\chuanfu.lua",
	},
}
YueGeDaoWorld.tbTrapList = 
{
--	["A1"] =
--	{
--		szPosPath = "",--Trap��������ļ�
--		szTrapFile = "",--Trap�ű���·��
--	},
}

function YueGeDaoWorld:AddAllNpc()
	for key, value in self.tbNpcTypeList do
		self:AddANpc(key, value.szPosPath)
	end
end

function YueGeDaoWorld:Start()
	self:RegAll()
	self:AddAllTrap()
	self:AddAllNpc()
end

YueGeDaoWorld:AssociateMap(968)
YueGeDaoWorld:SetForbitItem()
