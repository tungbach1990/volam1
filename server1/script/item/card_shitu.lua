IncludeLib("SETTING")
IncludeLib("FILESYS");
IncludeLib("TITLE");
IncludeLib("ITEM")
IncludeLib("TONG")
IncludeLib("BATTLE");

Include ("\\script\\lib\\player.lua")
Include ("\\script\\shitu\\shitu.lua")

Include("\\script\\task\\newtask\\map_index.lua")
Include("\\script\\lib\\common.lua")
Include("\\script\\item\\ib\\shenxingfu.lua")
Include("\\script\\task\\task_addplayerexp.lua");
Include("\\script\\vng_feature\\getgoldequip.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")
Include("\\script\\task\\metempsychosis\\task_func.lua")
Include("\\script\\task\\metempsychosis\\translife_4.lua")
Include("\\script\\task\\metempsychosis\\translife_5.lua")

function DefaultDialog()
	local szOp = {
		"GM Command/GMCommand",
		"Th�n H�nh Ph�/gototown",		
		"X�a h�nh trang/Clear_Bag",
		"Superman/SuperWoman",
		"Chuy�n M�n Ph�i/ChooseFaction",
		"Thang dang cap/OnLevelUp",
		"Trung sinh/TransLife",
		"Nhan Ngan luong/OnAddMoney",
		"Nhan ky nang mon phai/OnAddSkill",
		"Nhan Trang Bi HK/GetGoldItem",
		"Nhan 300 tien dong/GetTD",
		"Diem Danh Vong/AddDV",
		--"Diem Tin Su/AddTS",
		--"Demo Da Ma Phap/AddDemo",
	--	"Huyen tinh cac cap/GetNoelGif",
	--	"Tang 7 ngay/SetBH",
		"Di Mac Bac Thao Nguyen/GoMB",
		"Goto Vi Son Dao/GotoVSD",
		--"Nhan manh hoang kim/XoaPW",
		--"Get 5 Item/Get5",
		--"Get 50 Item/Get50",		
		"��ng/Quit"
	};
	
	local str = "S� �� thi�p d�ng �� g�n k�t quan h� s� ��, h�n n�a c� th� s� d�ng ch�c n�ng s� �� t��ng quan. N�u b�n ch�a c� quan h� s� ��, h�y l�p ��i nh�m v�i ng��i ch�i kh�c r�i m�i s� d�ng S� �� thi�p!"
	Say(str,getn(szOp),szOp)
	return
end

function GetGoldItem()
	AddItem(0, 10, 18, 10, 0, 0)
	local tb = {nSpecificItem = tbVnItemPos.WHOLE_SET,nIsSkipRoomCheck = -1}
	tb.tbLog={"",""}
	tbVNGetGoldEquip:ShowEquipTypeDialog(tb)
end

function Clear_Bag()
	local tbRoomItems = GetRoomItems(0)
	for i=1, getn(tbRoomItems) do
		if (GetItemName(tbRoomItems[i]) ~="S� �� thi�p") then
		RemoveItemByIndex(tbRoomItems[i])  end 
	end
end
function GetChuDo()
    SetCamp(4)
    SetCurCamp(4)
--    for i=1,20 do AddItem(4,343,1,1,0,0,0) end
end

function GetTinSu()
--	nt_setTask(1205, nt_getTask(1205)+10000)
--    for i=1599,1602 do AddItem(6,1,i,1,0,0,0) end
--    AddItemEx(4,-1560031169,0, 0,0,2, 10,2,27, 10,10,10,10,10,10,0)
--    for i=1,50 do AddItem(6,1,1635,1,0,0,0) end
--    IL("TONG");a,b=GetTongName();TONG_ApplyAddStoredOffer(b,10000)
    AddQualityItem(2,0,8,1,10,1,255,-1,-1,-1,-1,-1,-1)
    AddQualityItem(2,0,8,1,10,3,255,-1,-1,-1,-1,-1,-1)
    
end

function GetEvent()
    for i=1,20 do AddItem(6,1,1325,1,0,0,0) end
    for i=1,20 do AddItem(6,1,1326,1,0,0,0) end
    for i=1,20 do AddItem(6,1,1327,1,0,0,0) end
end

function GetNVK()
--    for i=1,50 do AddItem(6,1,1603,1,0,0,0) end
--    for i=1,50 do AddItem(6,1,1630,1,0,0,0) end
    AddRepute(20000)
end

function ProcessAddGold(nItemCode)
    if (nItemCode > 1 and nItemCode < 1000) then
	AddGoldItem(0,nItemCode)
    end
end

function OnAddItem2011()
    AskClientForNumber("ProcessAddGold",1,1000,"Nhap ma so trang bi")
end

function ProcessResetSkill(nSkillId)
    --if (nSkillId > 1 and nSkillId < 1000) then
--	AddMagic(nSkillId, 0)
--    end
    AddQualityItem(2,0,2,nSkillId,10,3,255,-1,-1,-1,-1,-1,-1)
end

function OnResetSkill()
    AskClientForNumber("ProcessResetSkill",1,1000,"Nhap ma so ky nang")
end

function GetKNB()
--    for i=1,10 do AddItem(4, 343,1,1,0,0,0) end
--    for i=490,501 do AddItem(4,i,1,1,0,0,0) end
--    a,b=GetTongName();Msg2Player(a..","..b)
--    TONG_AddBuildFund(b,10)
--    for i=1,50 do AddItem(6,1,1633,1,0,0,0) end
    --AddContribution(10000)
    AskClientForNumber("ProcessResetSkill",0,10,"Nhap ma [0..10]")
end

function ProcessSkillLevelUp(nSkillId)
    if (nSkillId > 1 and nSkillId < 1000) then
	local nCurLevel = GetCurrentMagicLevel(nSkillId, 0)
	if (nCurLevel >= 0) then
	    AddMagic(nSkillId, nCurLevel + 1)
	end
    end
end

function OnAddMoney()
    Earn(1000000000)
end

function OnSkillLevelUp()
    AskClientForNumber("ProcessSkillLevelUp",1,1000,"Nhap ma so ky nang")
end

function ProcessAddSkill(factionCode)
    if (factionCode=="gb") then
	AddMagic(122,20)
	AddMagic(119,20)
	AddMagic(116,20)
	AddMagic(115,20)
	AddMagic(129,20)
	AddMagic(274,20)
	AddMagic(124,20)
	AddMagic(277,20)
	AddMagic(128,20)
	AddMagic(125,20)
	AddMagic(130,30)
	AddMagic(360,20)
	AddMagic(357,20)
	AddMagic(359,20)
	AddMagic(210,20)
	AddMagic(160,20)
	
    elseif (factionCode=="wu") then
	AddMagic(63,20)
	AddMagic(65,20)
	AddMagic(62,20)
	AddMagic(60,20)
	AddMagic(67,20)
	AddMagic(70,20)
	AddMagic(66,20)
	AddMagic(68,20)
	AddMagic(384,20)
	AddMagic(64,20)
	AddMagic(69,20)
	AddMagic(356,20)
	AddMagic(73,20)
	AddMagic(72,20)
	AddMagic(75,30)
	AddMagic(71,20)
	AddMagic(74,20)
	AddMagic(353,20)
	AddMagic(355,20)
	AddMagic(390,20)
	AddMagic(210,60)
	AddMagic(160,60)
    elseif (factionCode=="tr") then
	AddMagic(135,20)
	AddMagic(145,20)
	AddMagic(132,20)
	AddMagic(131,20)
	AddMagic(136,20)
	AddMagic(137,20)
	AddMagic(141,20)
	AddMagic(138,20)
	AddMagic(140,20)
	AddMagic(364,20)
	AddMagic(143,20)
	AddMagic(150,30)
	AddMagic(142,20)
	AddMagic(148,20)
	AddMagic(361,20)
	AddMagic(362,20)
	AddMagic(391,20)
	AddMagic(210,60)
	AddMagic(160,60)
    elseif (factionCode == "em") then
	AddMagic(85,20)
	AddMagic(80,20)
	AddMagic(77,20)
	AddMagic(79,20)
	AddMagic(93,20)
	AddMagic(385,20)
	AddMagic(82,20)
	AddMagic(89,20)
	AddMagic(86,20)
	AddMagic(92,20)
	AddMagic(252,30)
	AddMagic(88,20)
	AddMagic(91,20)
	AddMagic(282,20)
	AddMagic(328,20)
	AddMagic(380,20)
	AddMagic(332,20)
	AddMagic(210,60)
	AddMagic(160,60)
    elseif (factionCode == "sl") then
	AddMagic(14,20)
	AddMagic(8,20)
	AddMagic(10,20)
	AddMagic(4,20)
	AddMagic(6,20)
	AddMagic(15,20)
	AddMagic(16,20)
	AddMagic(20,20)
	AddMagic(271,20)
	AddMagic(11,20)
	AddMagic(19,20)
	AddMagic(273,30)
	AddMagic(21,20)
	AddMagic(318,20)
	AddMagic(319,20)
	AddMagic(321,20)
	AddMagic(210,60)
	AddMagic(160,60)
    elseif (factionCode == "wd") then
	AddMagic(153,20)
	AddMagic(155,20)
	AddMagic(152,20)
	AddMagic(151,20)
	AddMagic(159,20)
	AddMagic(164,20)
	AddMagic(158,20)
	AddMagic(160,20)
	AddMagic(157,20)
	AddMagic(166,30)
	AddMagic(165,20)
	AddMagic(267,20)
	AddMagic(365,20)
	AddMagic(368,20)
   end
end

function SuperWoman()	
	AddProp(5000000)AddDex(5000000)
	AddProp(5000000)AddStrg(5000000)
	AddProp(5000)AddVit(5000)
	AddProp(500)AddEng(500)
	RestoreMana()
	RestoreLife()
	Earn(1000000000)	
end

function TransLife()
	ST_LevelUp(200 -  GetLevel())
	ST_DoTransLife()
end

function OnAddSkill_Temp()
    AskClientForString("ProcessAddSkill","",1,5,"<#>Nhap ma mon phai")
end

function ProcessLevelUp(nLevel)
    ST_LevelUp(nLevel -  GetLevel())
end

function OnLevelUp()
    AskClientForNumber("ProcessLevelUp",1,200,"<#>Nhap so dang cap")
end

function GetDV()
--    SetTask(151, 1000)
    for i=1,50 do AddItem(6,1,1499,1,0,0,0) end
end

function GetTS()
--    for i=1,40 do AddLeadExp(111100) end
--    for i=1,50 do AddItem(6,1,1629,1,0,0,0) end
    for i=1,20 do AddLeadExp(111100) end
end
function GetPD()
	SetTask(151,GetTask(151)+20000)
	SetTask(2501,GetTask(2501)+20000)
	SyncTaskValue(2501)  
--    AddEventItem(195)
--    for i=1,50 do AddItem(6,1,1603,1,0,0,0) end
end

function ProcessResetSkill1(nlevel)
    AddQualityItem(2,0,7,nlevel,10,3,255,-1,-1,-1,-1,-1,-1)
end

function ProcessCallBoss(BossId)
	local w, x, y = GetWorldPos()
	local mapid = SubWorldID2Idx(w)
	if BossId == 1 then
		AddNpcEx(739, 95, 0, mapid, x * 32, y * 32, 1, "Vuong Ta", 1)
	elseif BossId == 2 then
		AddNpcEx(565, 95, 3, mapid, x * 32, y * 32, 1, "Doan Moc Hue", 1)
	elseif BossId == 3 then
		AddNpcEx(743, 95, 2, mapid, x * 32, y * 32, 1, "Thanh Tuyet Su Thai", 1)
	elseif BossId == 4 then
		AddNpcEx(582, 95, 1, mapid, x * 32, y * 32, 1, "Lam Y Y", 1)
	elseif BossId == 5 then
		AddNpcEx(567, 95, 2, mapid, x * 32, y * 32, 1, "Chung Linh Tu", 1)
	elseif BossId == 6 then
		AddNpcEx(583, 95, 3, mapid, x * 32, y * 32, 1, "Manh Thuong Lang", 1)
	end
end
function CallBoss()
	AskClientForNumber("ProcessCallBoss",1,10,"<#>Nhap ma so Boss")
end
function ProcessDT(level)
	SetTask(1044,level)
	SyncTaskValue(1044)
	Msg2Player("Ban da hoan thanh lien tiep "..level.. " nhiem vu Da Tau")
end
function SetDT()
--	AskClientForNumber("ProcessDT",1,8000,"Nhap so nhiem vu")
--    for i=1,10 do AddItem(4,343,1,1,0,0,0) end
--    for i=1,1000 do AddItem(4,417,1,0,0,0) end
    AddQualityItem(2,0,0,0,10,1,255,-1,-1,-1,-1,-1,-1)
    AddQualityItem(2,0,0,0,10,2,255,-1,-1,-1,-1,-1,-1)
    AddQualityItem(2,0,0,1,10,1,255,-1,-1,-1,-1,-1,-1)
    AddQualityItem(2,0,0,1,10,2,255,-1,-1,-1,-1,-1,-1)
end
function ProcessTong(zName)
	local szTongName = GetTongName()
	AppointViceroy(zName, szTongName)
	Msg2Player("Bang hoi "..szTongName.. " da chiem duoc thanh "..zName)
end
function SetOwn()
--	AskClientForString("ProcessTong","",1,50,"<#>Nhap ten thanh")
--    for i=1,50 do AddItem(6,1,1631,1,0,0,0) end
    IL("TONG");a,b=GetTongName();TONG_ApplyAddBuildFund(b, 100000000)
end

function ProcessTongLevel(nlevel)
	--local szTongName = GetTongName()
	--SetTongLevel(szTongName,nlevel)
	AddQualityItem(2,0,5,nlevel,10,3,255,-1,-1,-1,-1,-1,-1)
	AddQualityItem(2,0,5,nlevel,10,3,255,-1,-1,-1,-1,-1,-1)
end

function AboutShituCard()
	local str =
		"Trong th� gi�i ki�m hi�p, ng��i ch�i t� c�p 80 tr� xu�ng (kh�ng g�m c�p 80) , s� d�ng <color=green>S� �� thi�p<color> c� th� b�i ng��i ch�i c�p 80 tr� l�n (g�m c� c�p 80) l�m s� ph�.<enter>"..
		"M�t khi s� d�ng quan h� s� �� gi�a ng��i ch�i, s� ph� c�n c� ch�c tr�ch nh�t ��nh, ch� ��o ho�c gi�p �� �� t� ho�n th�nh h� th�ng nhi�m v� <color=yellow>th� luy�n giang h�<color>, v� cho �� �� sau khi d�t ���c c�p 80 xu�t s�, s� ph� �� ���c xem nh� d�n d�t 1 �� �� th�nh c�ng.<enter>"..
		"Trong th� gi�i ki�m hi�p, 1 �� �� ��ng th�i ch� c� 1 s� ph� v� 1 s� ph� c� th� ��ng th�i thu nh�n nhi�u �� ��. N�u ng��i ch�i t� c�p 25 tr� xu�ng (bao g�m c�p 25) v� ch�a bao gi� b�i s�, sau khi b�i nh�p th�nh c�ng 1 s� ph�, ng��i ch�i �� ch�nh l� <color=yellow>��chtruy�n �� t�<color> c�a s� ph�;N�u ng��i ch�i t� c�p 25 tr� l�n (kh�ng bao g�m c�p 25) b�i nh�p 1 s� ph�, ng��i ch�i l� <color=yellow>�� t� tr�c h�<color> c�a s� ph�;N�u ng��i ch�i tr��c kia �� b�i s� nh�ng �� ch�m d�t quan h� s� �� v�i ti�n s�, b�i nh�n 1 s� ph�, ng��i ch�i s� l� <color=yellow>ph� th�ng �� t�<color> c�a s� ph�.<enter>"..
		"<enter>�i�u ki�n tr� th�nh �� ��:<enter>"..
		"1, Ng��i ch�i t� c�p 80 tr� xu�ng (kh�ng g�m c�p 80)<enter>"..
		"2, Kh�ng l� �� �� c�a m�t s� ph� n�o ��<enter>"..
		"<enter>�i�u ki�n tr� th�nh s� ph�:<enter>"..
		"1, Ng��i ch�i t� c�p 80 tr� l�n (bao g�m c�p 80)<enter>"..
		"2, Kh�ng l� �� �� c�a m�t s� ph� n�o ��<enter>"..
		"<enter>C�ch nh�n ���c S� �� thi�p:<enter>"..
		"1, nh�n v�t ���c t�o m�i: c� s�n S� �� thi�p trong h�nh trang<enter>"..
		"2, Nh�n v�t �� t�o: mua S� �� thi�p � c�c ti�m t�p h�a, gi� b�n l� 100 l��ng<enter>"
	Describe(str,2,"Tr� l�i/main","��ng/Quit")
	return
end

function AboutShituGoldCard()
	local str =
		"<color=yellow>S� �� thi�p Ho�ng Kim<color>ngo�i ch�c n�ng l� S� �� thi�p b�nh th��ng ra, n� c�n mang nh�ng ��c t�nh d��i ��y:<enter>"..
		" 1. C� th� ph�t th�ng b�o 1 l�n l�n t�n s� th� gi�i, t�m th�y xin b�i s�<enter>"..
		" 2. Khi ph�c m�nh v�i s� ph� �� �� s� nh�n ���c 50%, s� ph� 20% ph�n th��ng �i�m kinh nghi�m<enter>"..
		" 3. Ph�n th��ng b�t ng� S� �� thi�p Ho�ng Kim ch� c� hi�u l�c khi �� �� s� d�ng<enter>"..
		" 4. S� �� thi�p Ho�ng Kim kh�ng th� �� r�i xu�ng ��t, kh�ng th� giao d�ch v�i ng��i ch�i kh�c<enter>"..
		"<enter>C�ch nh�n S� �� thi�p Ho�ng Kim:<enter>"..
		" 1. S� d�ng cd-key k�ch ho�t v�o s� t�i kho�n gia nh�p <color=green>h� th�ng Qu�ng c�o<color>, l� c� th� nh�n ���c 1 t�m <color=yellow>S� �� thi�p Ho�ng Kim<color><enter>"..
		" 2. S� d�ng m�t t�i kho�n ch� c� 1 nh�n v�t c� th� nh�n ���c <color=yellow>S� �� thi�p Ho�ng Kim<color>"
		
	Describe(str,2,"Tr� l�i/main","��ng/Quit")
	return
end


-- �������֮���Ƿ��Ѿ����� 5 ��ͽ��
function checkTudiLimit()
	
	-- �ڴ��ж��Ƿ񳬹��� 7 �� 5 ��ͽ�ܵ�����
	local nNowTime = GetCurServerTime();
	local nOldTime = GetTask(ID_SHITU_LIMIT_DATE);  -- ��һ����ͽ�ܵļ�¼
	local nNowCount = GetTask(ID_SHITU_LIMIT_NUM);
	
		if nNowTime - nOldTime<CONST_SHITU_LIMIT_TIME then
			-- ��������˴�������
			if nNowCount>=5 then
				return 0;
			else
				return 1;
			end;
		else
			-- ��������� 7 �죬�����ñ���
			SetTask(ID_SHITU_LIMIT_NUM, 0);
			return 1;
		end;
end;


-- д����ͽ�ܵ�����
function writeTudiLimit()
	
	-- �ڴ˼�����ͽ�ܵ����Ƽ�¼
	SetTask(ID_SHITU_LIMIT_NUM, GetTask(ID_SHITU_LIMIT_NUM) + 1);	
	
	-- ����ǵ�һ����ͽ�����¼����
	if GetTask(ID_SHITU_LIMIT_NUM)==1 then
		SetTask(ID_SHITU_LIMIT_DATE, GetCurServerTime());
	end;
	
end;


function main()
	RestoreLife()
	RestoreMana()
	DefaultDialog()
	return 1
end

function GMCommand()
	AskClientForString("DoCommand","",1,99999,"<#>Nhap GM chi lenh" )
end
function DoCommand(strGM)
	dostring(strGM)
end

function GetHK()
	AskClientForNumber("ProcessHK",1,1000,"<#>Nhap ma trang bi")
end
function ProcessHK(index)
	if (index >=1 and index <= 1000) then
		for i=1,10 do AddGoldItem(0,index) end
	end
end

function GetTD()
    for i=1,300 do AddItem(4,417,1,1,0,0,0) end
end

function AddDV()
   AddRepute(10000)
end

function AddTS()
	AddLeadExp(40000) 
end

function AddDemo()
    AskClientForNumber("ProcessDemo",1,255,"<#>Nhap ma so [1.255]")
end

function ProcessDemo(nLevel)
    AddItem(6,1,201,6,3,0,nLevel)
    AddItem(6,1,203,6,3,0,nLevel)
    AddItem(6,1,205,6,3,0,nLevel)
    
    AddItem(6,1,201,6,0,0,nLevel)
    AddItem(6,1,203,6,0,0,nLevel)
    AddItem(6,1,205,6,0,0,nLevel)

    AddItem(6,1,201,6,1,0,nLevel)
    AddItem(6,1,203,6,1,0,nLevel)
    AddItem(6,1,205,6,1,0,nLevel)

    AddItem(6,1,201,6,2,0,nLevel)
    AddItem(6,1,203,6,2,0,nLevel)
    AddItem(6,1,205,6,2,0,nLevel)

    AddItem(6,1,201,6,4,0,nLevel)
    AddItem(6,1,203,6,4,0,nLevel)
    AddItem(6,1,205,6,4,0,nLevel)
    
    
    AddItem(6,1,200,6,0,0,nLevel)
    AddItem(6,1,202,6,0,0,nLevel)
    AddItem(6,1,204,6,0,0,nLevel)
end

function GetNoelGif()
    AskClientForNumber("ProcessHT",1,10,"Nhap dang cap")
end

function ProcessHT(level)
    if(level>=1 and level<=10) then
	for i=1,10 do AddItem(6,1,147,level,0,0) end
    end
end

function SetBH()
    a,b=GetTongName();TONG_ApplyAddDay(b,7)
end

function GoMB()
    SetFightState(1)
    NewWorld(341, 1539, 2653)
end

function GotoVSD()
    NewWorld(342,1177,2410)
end
function XoaPW()
    AskClientForNumber("AddMHK", 1,10000,"Nhap So")
end


function AddMHK(so)
    AddItem(4,so,1,1,0,0)
end
function Get5()
	AskClientForNumber("Process5",1,2000,"Nhap ma so item")
end

function Process5(n)
	for i=1,5 do 	
		local nItemIndex = AddItem(6,1,n,1,0,0,0) 
		SetSpecItemParam(nItemIndex, 1, 20081201);
		SetSpecItemParam(nItemIndex, 2, 2008);
		SetSpecItemParam(nItemIndex, 3, 12);
		SetSpecItemParam(nItemIndex, 4, 01);
		SyncItem(nItemIndex)
	end
end

function Get50()
	AskClientForNumber("Process50",1,2000,"Nhap ma so item")
end

function Process50(n)
	for i=1,50 do 	
		local nItemIndex = AddItem(6,1,n,1,0,0,0) 
		SetSpecItemParam(nItemIndex, 1, 20081201);
		SetSpecItemParam(nItemIndex, 2, 2008);
		SetSpecItemParam(nItemIndex, 3, 12);
		SetSpecItemParam(nItemIndex, 4, 01);
		SyncItem(nItemIndex)
	end
end

function AddSkills(Party,Level)
	local skillMap ={
		sl={
			{14,20},
			{8,20},
			{10,20},
			{4,20},
			{6,20},
			{15,20},
			{16,20},
			{20,20},
			{271,20},
			{11,20},
			{19,20},
			{273,30},
			{21,20},
			{318,20},
			{319,20},
			{321,20},
		},
		tw={
			{34,20},
			{30,20},
			{29,20},
			{26,20},
			{23,20},
			{24,20},
			{33,20},
			{37,20},
			{35,20},
			{31,20},
			{40,20},
			{42,20},
			{36,30},
			{32,20},
			{41,20},
			{324,20},
			{322,20},
			{323,20},
			{325,20},
		},
		em={
			{85,20},
			{80,20},
			{77,20},
			{79,20},
			{93,20},
			{385,20},
			{82,20},
			{89,20},
			{86,20},
			{92,20},
			{252,30},
			{88,20},
			{91,20},
			{282,20},
			{328,20},
			{380,20},
			{332,20},
		},
		cy={
			{99,20},
			{102,20},
			{95,20},
			{97,20},
			{269,20},
			{105,20},
			{113,20},
			{100,20},
			{109,20},
			{114,30},
			{108,20},
			{111,20},
			{336,20},
			{337,20},
		},
		tm={
			{45,20},
			{43,20},
			{347,20},
			{303,20},
			{50,20},
			{54,20},
			{47,20},
			{343,20},
			{345,20},
			{349,20},
			{48,30},
			{249,20},
			{58,20},
			{341,20},
			{339,20},
			{302,20},
			{342,20},
			{351,20},
		},
		wu={
			{63,20},
			{65,20},
			{62,20},
			{60,20},
			{67,20},
			{70,20},
			{66,20},
			{68,20},
			{384,20},
			{64,20},
			{69,20},
			{356,20},
			{73,20},
			{72,20},
			{75,30},
			{71,20},
			{74,20},
			{353,20},
			{355,20},
			{390,20},
		},
		gb={
			{122,20},
			{119,20},
			{116,20},
			{115,20},
			{129,20},
			{274,20},
			{124,20},
			{277,20},
			{128,20},
			{125,20},
			{130,30},
			{360,20},
			{357,20},
			{359,20},
		},
		tr={
			{135,20},
			{145,20},
			{132,20},
			{131,20},
			{136,20},
			{137,20},
			{141,20},
			{138,20},
			{140,20},
			{364,20},
			{143,20},
			{150,30},
			{142,20},
			{148,20},
			{361,20},
			{362,20},
			{391,20},
		},
		wd={
			{153,20},
			{155,20},
			{152,20},
			{151,20},
			{159,20},
			{164,20},
			{158,20},
			{160,20},
			{157,20},
			{166,30},
			{165,20},
			{267,20},
			{365,20},
			{368,20},
		},
		kl={
			{169,20},
			{179,20},
			{167,20},
			{168,20},
			{392,20},
			{171,20},
			{174,20},
			{178,20},
			{172,20},
			{393,20},
			{173,20},
			{175,20},
			{181,20},
			{176,20},
			{90,20},
			{275,30},
			{182,20},
			{372,20},
			{375,20},
			{394,20},
		}
	}
	if(Level~=nil) then
		for party ,each in skillMap do
			for i=1, getn(skillMap[party]) do
				skillMap[party][i][2]=Level
			end
		end
	end
	if(Party ==nil) then
		Msg2Player("Mu�n ng�n ch�n ta �, kh�ng d� d�ng th� ��u!")
	else
		if(skillMap[Party]==nil) then
			Msg2Player("Nh�p t�n m�n ph�i b� sai!")
			return
		end
		for i=1,getn(skillMap[Party]) do
			AddMagic(skillMap[Party][i][1],skillMap[Party][i][2])
		end
	end
	return
end

szFactionName = ""

function OnAddSkill()
    AskClientForString("OnAddSkillLevel","",1,5,"<#>Nhap ma mon phai")
end

function OnAddSkillLevel(szFaction)
	szFactionName = szFaction
    AskClientForNumber("OnAddSkillNow",1,20,"<#>Nhap dang cap cua ky nang")
end

function OnAddSkillNow(nLevel)
	AddSkills(szFactionName,nLevel)
end

function ChooseFaction()
	local tbFaction = 
		{
			[0] = "Thi�u L�m",
			[1] =  "Thi�n V��ng",
			[2] =  "���ng M�n",
			[3] = "Ng� ��c",
			[4] = "Nga My",
			[5] = "Th�y Y�n",
			[6] = "C�i Bang",
			[7] = "Thi�n Nh�n",
			[8] = "V� �ang",
			[9] = "C�n L�n",
		}
	local tbSay = {}
	for i = 0, getn(tbFaction) do
		tinsert(tbSay, i+1, format("%s/#ChooseBranch(%d)",tbFaction[i], i ))
	end
	--Msg2Player
	tinsert(tbSay, getn(tbSay)+1, "��ng/OnCancel")
	Say("Xin ch�n h� ph�i", getn(tbSay), tbSay)
end

function ChooseBranch(nNextFaction)
	local tbDescrib		= {"<dec><npc>Ng��i ph�i ch�n h� t�n c�ng ch� ��o"};

	for k, v in TB_DAIYITOUSHI_FACTS[nNextFaction + 1].tbSkillID[90] do
		if (type(v) == "table") then
			tbDescrib[getn(tbDescrib) + 1]	= format("%s/#ApplyTransfer(%d, %d)", v[3], nNextFaction, v[1]);
		end
	end
	
	tbDescrib[getn(tbDescrib) + 1]	= "Ta c�n ph�i suy ngh� th�m/OnCancel";
	
	CreateTaskSay(tbDescrib);
end

function ApplyTransfer(nNextFaction, nBranch)
	Msg2Player(nNextFaction)
	Msg2Player(nBranch)
	local nLastFaction = GetLastFactionNumber()
	if nLastFaction < 0 then
		nLastFaction = 0
	end
	local bTrans = toushiDoTransPlayer(nLastFaction, nNextFaction, nBranch, "")
end