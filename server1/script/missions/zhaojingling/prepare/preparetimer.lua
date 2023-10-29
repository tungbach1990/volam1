Include("\\script\\missions\\zhaojingling\\prepare\\preparegame.lua")

PrepareGame.nPassTime = 0 --ÿ��������ʼ�������߹���ʱ��


function PrepareGame:InitTimer()
	if SubWorldID2Idx(PREPARE_MAP) <= 0 then
		return
	end
	
	if self.nTimeIndex then
		DelTimer(self.nTimeIndex)
	end
	
	self.nPassTime = 0
	local nTime = 1 * 60
	self.nTimeIndex = AddTimer(nTime * 18, "PrepareGame:OnTime", 0)
	Msg2Map(PREPARE_MAP, "Tr�n hu�n luy�n M�c Nh�n m�i �� b�t ��u")
	AddGlobalNews("B�o danh Ho�ng Th�nh Hu�n Luy�n Cung b�t ��u, xin c�c ch� v� hi�p kh�ch nhanh ch�ng ��n L�m An tham gia b�o danh t�i Quan nh�c nh�")
end

function PrepareGame:OnTime(nTimerId, nParam)
	if SubWorldID2Idx(PREPARE_MAP) <= 0 then
		return 0, 0
	end
	
	self.nPassTime = self.nPassTime + 60
	local nRestTime = PREPARETIME * 60 - self.nPassTime
	if nRestTime > 0 then
		Msg2Map(PREPARE_MAP, format("C�n %d ph�t tr�n ��u t�m M�c Nh�n s� b�t ��u", floor(nRestTime / 60)))
		return 60 * 18, 0
	end
	
	------��������,����Ҵ��ͽ�������---
	self:GoToGame()
	DynamicExecute("\\script\\missions\\zhaojingling\\game\\gametimer.lua", "Game:InitTimer")
	return 0, 0
end

