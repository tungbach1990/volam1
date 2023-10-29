Include("\\script\\global\\titlefuncs.lua");
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\awardtemplet.lua")
tbCodeFanpage = 
{
	nStartDate = 201306270000,
	nEndDate = 201307152400,
	tbExtPoint1 = {nID = 3, nBit = 10, nVer = 1},--n�p code t� web
	tbExtPoint2 = {nID = 3, nBit = 11, nVer = 1}, --check gamer �� nh�n th��ng		
}

function tbCodeFanpage:IsActive()
	local nCurDate = tonumber(date("%Y%m%d%H%S"))
	if nCurDate < self.nStartDate or nCurDate >= self.nEndDate then
		return nil
	end
	return 1
end

function tbCodeFanpage:main()
	if (self:IsActive() ~= 1) then
		Talk(1,"","Ho�t ��ng �� k�t th�c!")
		return
	end	
	
	if CalcFreeItemCellCount() < 10 then
		Talk(1, "", "�� b�o ��m t�i s�n, vui l�ng ch�a �t nh�t 10 � tr�ng trong h�nh trang r�i m�i nh�n th��ng.")
		return
	end
	
	if (tbExtPointLib:GetBitValueByVersion(self.tbExtPoint1) ~= 1) then
 		Talk(1,"","Xin l�i! ��i hi�p kh�ng �� �i�u ki�n nh�n th��ng.")
 		return
 	end	
	
	 if (tbExtPointLib:GetBitValueByVersion(self.tbExtPoint2) ~= 0 ) then
 		Talk(1,"","��i hi�p �� nh�n th��ng r�i")
 		return
 	end
	
	 if (tbExtPointLib:SetBitValueByVersion(self.tbExtPoint2, 1) ~= 1) then
	 	return
	 end	
	 local tbAward = {
	 	{szName = "�i�m Kinh Nghi�m", nExp=500000000},
		{szName="Ch�n Nguy�n ��n (��i)",tbProp={6,1,30229,1,0,0},nCount=50,nBindState=-2},
		{szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=500,nBindState=-2},
		{szName="M�t n� V��ng Gi�",tbProp={0,11,561,1,0,0},nCount=1,nExpiredTime=20160,nBindState=-2},
		{szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nBindState=-2,nExpiredTime=4320},
	 }
 	tbAwardTemplet:Give(tbAward, 1,{"CodeFaceBook","NhanThuongTaiChienTam"})		
end

if tbCodeFanpage:IsActive() then
	local pEventType = EventSys:GetType("AddNpcOption")
	nId = pEventType:Reg("Chi�n T�m T�n Gi�", "Nh�n ph�n th��ng n�p code fanpage", tbCodeFanpage.main,{tbCodeFanpage})
end