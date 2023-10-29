Include("\\vng_script\\activitysys\\config\\1033\\variables.lua")

tbAward_Nhan_KimQuang = {
	{szName="Kim Quang B�c Kinh Chi M�ng",tbProp={0,197},nCount=1,nRate=60,nQuality = 1,},
	{szName="Kim Quang Nh� �i�n Chi H�n",tbProp={0,202},nCount=1,nRate=40,nQuality = 1,},
}

local pAnnounce = function(nItemIndex)
	AddGlobalNews(format("Ch�c m�ng ��i hi�p <color=cyan>%s<color> �� ��i th�nh c�ng <color=cyan>%s<color>", GetName(), GetItemName(nItemIndex)))
end
--Phan thuong doi ruong HKMP
tbRuongHKMP = {
	[1] = {
				{szName="Thi�n V��ng Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4547,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
				{szName="Ng� ��c Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4548,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
				{szName="Th�y Y�n Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4549,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
				{szName="C�n l�n Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4550,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
				{szName="Thi�n nh�n Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4551,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
	},
	[2] = {
				{szName="Thi�u l�m Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4552,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
				{szName="���ng m�n Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4553,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
				{szName="Nga my Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4554,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
				{szName="V� �ang Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4555,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
				{szName="C�i bang Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4556,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
	},
}


--Phan thuong ruong boss
tbAward_KillBoss_KimQuang_Fix = {
	{szName="Thi�n s�n b�o l�",tbProp={6,1,72,1,0,0},nCount=2,nExpiredTime=7*24*60},
	{szName="Qu� hoa t�u",tbProp={6,1,125,1,0,0},nCount=1,nExpiredTime=7*24*60},
	{szName="Ti�n th�o l�",tbProp={6,1,71,1,0,0},nCount=5,nExpiredTime=7*24*60},
	{szName="��i l�c ho�n",tbProp={6,0,3,1,0,0},nCount=5,nExpiredTime=7*24*60},
	{szName="Phi t�c ho�n",tbProp={6,0,6,1,0,0},nCount=5,nExpiredTime=7*24*60},
	{szName="T�m t�m t��ng �nh ph�",tbProp={6,1,18,1,0,0},nCount=2,nExpiredTime=7*24*60},
	{szName="Tinh h�ng b�o th�ch",tbProp={4,353,1,1,0,0},nCount=2,},
	{szName="T� th�y tinh",tbProp={4,239,1,1,0,0},nCount=2,},
	{szName="B�n nh��c t�m kinh",tbProp={6,1,12,1,0,0},nCount=2,nExpiredTime=7*24*60},
	{szName="Ti�n th�o l� ��c bi�t",tbProp={6,1,1181,1,0,0},nCount=2,nExpiredTime=7*24*60},
}

tbAward_KillBoss_KimQuang_Random ={
	{szName="Kim Quang Tr�ch Tinh Ho�n",tbProp={0,194},nCount=1,nRate=9.5,nQuality = 1,},
	{szName="Kim Quang ���ng Ngh� Gi�p",tbProp={0,195},nCount=1,nRate=20,nQuality = 1,},
	{szName="Kim Quang L�c Ph� Th�y H� Th�n Ph�",tbProp={0,196},nCount=1,nRate=20,nQuality = 1,},
	{szName="Kim Quang B�ch Kim Y�u ��i",tbProp={0,198},nCount=1,nRate=9.5,nQuality = 1,},
	{szName="Kim Quang Thi�n T�m H� Uy�n",tbProp={0,199},nCount=1,nRate=9.5,nQuality = 1,},
	{szName="Kim Quang Ng� S�c Ng�c B�i",tbProp={0,200},nCount=1,nRate=2,nQuality = 1,},
	{szName="Kim Quang Thi�n T�m Ngoa",tbProp={0,201},nCount=1,nRate=20,nQuality = 1,},
	{szName="Kim Quang B�n L�i To�n Long Th��ng",tbProp={0,203},nCount=1,nRate=9.5,nQuality = 1,},
}

--phan thuong su dung kim quang ruong
tbAward_Use_KimQuang_Ruong = {
	{szName="Kim Quang l�nh",tbProp={6,1,30388,1,0,0},nCount=1,nRate=60,nExpiredTime=DATE_END},
	{szName="Kim Quang Tr�ch Tinh Ho�n",tbProp={0,194},nCount=1,nRate=4,nQuality = 1,},
	{szName="Kim Quang ���ng Ngh� Gi�p",tbProp={0,195},nCount=1,nRate=7.3,nQuality = 1,},
	{szName="Kim Quang L�c Ph� Th�y H� Th�n Ph�",tbProp={0,196},nCount=1,nRate=7.3,nQuality = 1,},
	{szName="Kim Quang B�c Kinh Chi M�ng",tbProp={0,197},nCount=1,nRate=0.0001,nQuality = 1,},
	{szName="Kim Quang B�ch Kim Y�u ��i",tbProp={0,198},nCount=1,nRate=4,nQuality = 1,},
	{szName="Kim Quang Thi�n T�m H� Uy�n",tbProp={0,199},nCount=1,nRate=4,nQuality = 1,},
	{szName="Kim Quang Ng� S�c Ng�c B�i",tbProp={0,200},nCount=1,nRate=2,nQuality = 1,},
	{szName="Kim Quang Thi�n T�m Ngoa",tbProp={0,201},nCount=1,nRate=7.3998,nQuality = 1,},
	{szName="Kim Quang Nh� �i�n Chi H�n",tbProp={0,202},nCount=1,nRate=0.0001,nQuality = 1,},
	{szName="Kim Quang B�n L�i To�n Long Th��ng",tbProp={0,203},nCount=1,nRate=4,nQuality = 1,},
}
