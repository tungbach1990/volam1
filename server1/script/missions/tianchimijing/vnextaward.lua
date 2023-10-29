--Ph�n th��ng b� sung khi giao nguy�n li�u �ao, Th��ng, Ki�m b� th�t l�c - Created By DinhHQ - 20120409
Include("\\script\\vng_lib\\bittask_lib.lua")
tbVnExtAward = {
	tbBitTSK = {
		nTaskID = 3080,
		nStartBit = 8,
		nBitCount = 1,
		nMaxValue = 1},
}
function tbVnExtAward:VnBonusAward()	
	if PlayerFunLib:CheckTaskDaily(3086, 2, "H�m nay ng��i �� nh�n 2 l�n ph�n th��ng n�y, kh�ng th� nh�n th�m.", "<") then
		local tbVnBonusAward = {
			{szName = "�i�m Kinh Nghi�m", nExp=10000000},			
			{szName="Tu ch�n y�u quy�t (Thi�n tr� m�t c�nh)",tbProp={6,1,30164,1,0,0},nCount=1,nExpiredTime=10080},
			{szName="Thi�n Tr� B� B�o",tbProp={6,1,30193,1,0,0},nCount=3},		
		}
		PlayerFunLib:AddTaskDaily(3086, 1)
		tbAwardTemplet:Give(tbVnBonusAward, 1, {"ThienTriMatCanh", "NhanThuongTaiAnSi"})		
		local tbVnMeridanMaterial = {			
			{szName="Ch�n Nguy�n ��n (trung)",tbProp={6,1,30228,1,0,0},nCount=2,nBindState=-2},
		}
		tbAwardTemplet:Give(tbVnMeridanMaterial, 1, {"KinhMach", "HoanThanhNhiemVuThienTriMatCanh"})		
	end
end

function tbVnExtAward:SetAwardFlag(nVal)
	tbVNG_BitTask_Lib:setBitTask(self.tbBitTSK, nVal)
end

function tbVnExtAward:ToFloor3GetAward()
	if PlayerFunLib:CheckTaskDaily(3086, 2, "H�m nay ng��i �� nh�n 2 l�n ph�n th��ng n�y, kh�ng th� nh�n th�m.", "<") ~= 1 then
		return
	end
	if tbVNG_BitTask_Lib:CheckBitTaskValue(self.tbBitTSK, 1, "Ng��i kh�ng �� �i�u ki�n nh�n th��ng.", "==") ~= 1 then
		return
	end
	if CalcFreeItemCellCount() < 6 then
		Talk(1, "", "�� b�o ��m t�i s�n, xin h�y ch�a �t nh�t 6 � tr�ng trong h�nh trang r�i m�i nh�n th��ng.")
		return
	end
	self:VnBonusAward()
	self:SetAwardFlag(0)
end