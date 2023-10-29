Include("\\script\\global\\titlefuncs.lua");
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
tbVnHuyenVu = 
{
	nStartDate = 201205240000,
	nEndDate = 201207232400,
	nExtPointID = 3,
	nExtPointBit = 9,--n�p code t� web
	nExtPointID2 = 3,
	nExtPointBit2= 10, --check gamer �� nh�n th��ng
	--HVL 2
	nExtPointID3 = 3,
	nExtPointBit3= 11,--n�p code t� web
	nExtPointID4 = 3,
	nExtPointBit4= 12,--check gamer �� nh�n th��ng
	
	nTittleID = 3002,
	nTittleExpiredTime = 30 * 24 * 60 * 60 * 18,
}

function tbVnHuyenVu:IsActive()
	local nCurDate = tonumber(date("%Y%m%d%H%S"))
	if nCurDate < self.nStartDate or nCurDate >= self.nEndDate then
		return nil
	end
	return 1
end

function tbVnHuyenVu:AddDialog(tbDialog)
	if not self:IsActive() then
		return
	end
	tinsert(tbDialog, "Nh�n ph�n th��ng Huy�n V� L�nh/#tbVnHuyenVu:main()")
end

function tbVnHuyenVu:main()
	if (self:IsActive() ~= 1) then
		Talk(1,"","Ho�t ��ng �� k�t th�c!")
		return
	end	
	if PlayerFunLib:CheckTotalLevel(150, "default", ">=") ~= 1 then
		return
	end
	if (tbExtPointLib:GetBitValue(self.nExtPointID3, self.nExtPointBit3) ~= 1) then
 		Talk(1,"","Xin l�i! ��i hi�p kh�ng �� �i�u ki�n nh�n th��ng.")
 		return
 	end
	if (GetExtPoint(self.nExtPointID2) < 0) or (GetExtPoint(self.nExtPointID3) < 0) then
		Talk(1,"","��i hi�p ch�a th� nh�n th��ng l�c n�y,  xin h�y  li�n h� Bang Qu�n Tr�")
		return
	end	
	
	 if (tbExtPointLib:GetBitValue(self.nExtPointID4, self.nExtPointBit4) ~= 0 ) then
 		Talk(1,"","��i hi�p �� nh�n th��ng r�i")
 		return
 	end
	
	 if (tbExtPointLib:SetBitValue(self.nExtPointID4, self.nExtPointBit4, 1) ~= 1) then
	 	return
	 end
	local nIsLastEvent = tbExtPointLib:GetBitValue(self.nExtPointID2, self.nExtPointBit2)
	local nServerTime = GetCurServerTime()+ 2592000; --30*24*60*60
	local nDate	= FormatTime2Number(nServerTime);
	local nDay	= floor(mod(nDate,1000000) / 10000);
	local nMon	= mod(floor(nDate / 1000000) , 100)
	local nTime	= nMon * 1000000 + nDay * 10000
	SetTask(TASK_ACTIVE_TITLE, self.nTittleID);
	Title_AddTitle(self.nTittleID, 2, nTime);
	Title_ActiveTitle(self.nTittleID);
	local sz_title = Title_GetTitleName(self.nTittleID);		
	Msg2Player(format("Ch�c m�ng b�n �� nh�n ���c danh hi�u <color=yellow>%s<color>", sz_title));
	if nIsLastEvent == 1 then
	 	local tbAward = {
		 	{szName = "�i�m kinh nghi�m", nExp_tl = 200000000},
		 	{szName="Qu� Ho�ng Kim",tbProp={6,1,907,1,0,0},nCount=2,nExpiredTime = 43200, nBindState = -2},
		 	{szName="Thi�n Tr� M�t L�nh",tbProp={6,1,30194,1,0,0},nCount=2,nExpiredTime = 10080,},
		 	{szName="M�t n� - Anh h�ng chi�n tr��ng",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=10080, nUsageTime=60, nBindState = -2},
		 	{szName = "�i�m c�ng hi�n bang h�i", nVngContribute=20000,nCount=1,},
		 }
	 	tbAwardTemplet:Give(tbAward, 1,{"HuyenVuLenh2","NhanThuongLoai2"})	 
	else				
		 local tbAward = {
		 	{szName = "�i�m kinh nghi�m", nExp_tl = 100000000},
		 	{szName="Qu� Ho�ng Kim",tbProp={6,1,907,1,0,0},nCount=1,nExpiredTime = 43200, nBindState = -2},
		 }
	 	tbAwardTemplet:Give(tbAward, 1,{"HuyenVuLenh2","NhanThuongLoai1"})	 	
	end	
end