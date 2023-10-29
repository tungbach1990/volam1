Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")

YueGeMiGuWorld = Game:new()
YueGeMiGuWorld.nRoomCount = 0
YueGeMiGuWorld.nRoomLimit = 1
YueGeMiGuWorld.tbRoomSet = {}
YueGeMiGuWorld.tbPlayer2RoomId = {}
YueGeMiGuWorld.tbRoomCenterPos = {
	{51040, 139424},
}
YueGeMiGuWorld.szRoomCenterPosFilePath = "\\settings\\maps\\yuegedao\\yuegemigu\\daozhu.txt"
YueGeMiGuWorld.szMapType = "Nguy�t Ca ��o" --�ı��ͼ��ʾ

YueGeMiGuWorld.tbForbitItemType = --���� Υ������
{
	"TRANSFER","MATE"
}

YueGeMiGuWorld.Player = {
	szPath = "\\script\\missions\\yuegedao\\yuegemigu\\yuegemiguplayer.lua",
	szClassName = "YueGeMiGuPlayer",
}

YueGeMiGuWorld.PlayerEnterTrapTime = {
}

YueGeMiGuWorld.tbNpcTypeList = --npc������
{

}
YueGeMiGuWorld.tbTrapList = 
{
--	["A1"] =
--	{
--		szPosPath = "",--Trap��������ļ�
--		szTrapFile = "",--Trap�ű���·��
--	},
}

function YueGeMiGuWorld:AddRoomCenterPos()
	local szPosPath = self.szRoomCenterPosFilePath
	if (TabFile_Load(szPosPath, szPosPath) == 0) then
		print("Load TabFile Error!"..szPosPath)
		return 0
	end
	
	local nRowCount = TabFile_GetRowCount(szPosPath)
	for nRow=2, nRowCount do
		local nX = TabFile_GetCell(szPosPath, nRow, 1)
		local nY = TabFile_GetCell(szPosPath, nRow, 2)
		self.tbRoomCenterPos[nRow-1] = {nX, nY}
	end
	self.nRoomLimit = nRowCount - 1
end

function YueGeMiGuWorld:AddAllNpc()
	for key, value in self.tbNpcTypeList do
		self:AddANpc(key, value.szPosPath)
	end
end

function YueGeMiGuWorld:Start()
	self:RegAll()
	self:AddAllTrap()
	self:AddAllNpc()
	self:AddRoomCenterPos()
end

YueGeMiGuWorld:AssociateMap(969)
YueGeMiGuWorld:SetForbitItem()

