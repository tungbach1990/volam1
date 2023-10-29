Include("\\script\\battles\\battlehead.lua")
Include("\\script\\lib\\file.lua");
Include("\\script\\lib\\string.lua");
Include("\\script\\global\\forbidmap.lua");
Include("\\script\\missions\\sevencity\\war.lua")
Include("\\script\\global\\playerlist.lua")
Include("\\script\\item\\ib\\headshenxingfu.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\missions\\boss\\callboss_incity.lua")
IncludeLib("TONG")


function main(sel)	

--local szTongName, nTongID = GetTongName();
--if szTongName ~= nil and szTongName ~= "" then
--if TONG_GetMemberCount(nTongID) > 150 then
--Say("Bang v��t qu� 150 th�nh vi�n kh�ng th� s� d�ng th�n th�nh ph�.Xin h�y t�n tr�ng s�n ch�i kh�ng gian l�n trong vi�c s�p nh�p bang h�i �� tr�nh phi�n ph�c cho ch�nh b�n bang m�nh.");
--return 1
--end
--end

	if (IsDisabledUseTownP() == 1 or GetTaskTemp(200) == 1 ) or ( SubWorldIdx2ID( SubWorld ) >= 387 and SubWorldIdx2ID( SubWorld ) <= 395)then
		Msg2Player("Hi�n t�i ng��i kh�ng th� s� d�ng th�n h�nh ph�!");
		return 1
	end
	
	local nSubWorldID = GetWorldPos();
	if (nSubWorldID >= 375 and nSubWorldID <= 386) then
		Msg2Player("B�n �� hi�n t�i ng��i �ang ��ng thu�c khu v�c ��c th�, kh�ng th� s� d�ng th�n h�nh ph�.");
		return 1
	end
	
	if (nSubWorldID >= 416 and nSubWorldID <= 511) then
		Msg2Player("B�n �� hi�n t�i ng��i �ang ��ng thu�c khu v�c ��c th�, kh�ng th� s� d�ng th�n h�nh ph�.");
		return 1
	end
	
	if (nSubWorldID == 44 or nSubWorldID == 197 or nSubWorldID == 208 or nSubWorldID == 209 or nSubWorldID == 210 or nSubWorldID == 211 or nSubWorldID == 212 or (nSubWorldID >= 213 and nSubWorldID <= 223)	or nSubWorldID == 336 or nSubWorldID == 341 or nSubWorldID == 342	or nSubWorldID == 175	or nSubWorldID == 337	or nSubWorldID == 338	or nSubWorldID == 339 or ( nSubWorldID >= 387 and  nSubWorldID <= 395 ) )then 
		Msg2Player("B�n �� hi�n t�i ng��i �ang ��ng thu�c khu v�c ��c th�, kh�ng th� s� d�ng th�n h�nh ph�.");
		return 1
	end;

	--check map
	if (CheckAllMaps(nSubWorldID) == 1) then
		Msg2Player("B�n �� hi�n t�i ng��i �ang ��ng thu�c khu v�c ��c th�, kh�ng th� s� d�ng th�n h�nh ph�.");
		return 1
	end;
	
	if (GetLevel() < 5) then
		Say("Ng��i ch�i ph�i ��t ��ng c�p 5 tr� l�n m�i c� th� s� d�ng th�n h�nh ph�.", 0);
		return 1
	end;
				if (GetSkillState(739) >= 1) then
			Say("B�n �ang v�n Ti�u Bang H�i kh�ng th� s� d�ng THP")
			return 1
		end;
		
Say("Th�n h�nh ph� �i ��n n�i ���c ch� ��nh..!!!", 7, 
		"Th�n trang - Th�nh th� - M�n ph�i - CLD/gototown",
		"Maps luy�n c�ng/gotoluyencong",
		"Thi�t ��t �i�m h�i sinh./set_backpos", 
		"�i l�m [Ho�t ��ng]./vitri_khac",
		"�i Minh Nguy�t Tr�n - ��o Hoa ��o./#tbVNGWORDPOS:GotoOtherMap()",
		"R�i kh�i/no");		
	return 1	
end;

function didenchienlongok()
-- if GetFaction() == "cuiyan" then
-- Say("Th�y y�n Kh�ng ��c tham gia Chi�n Long ��ng")
-- return
-- end
	Say("H�y ch�n c�ng m� b�n mu�n!", 4, "C�ng V� Di S�n/cong1","C�ng T�ng V�n ��ng/cong2","C�ng La Ti�u S�n/cong3", "��i m�t l�t �i!/OnCancel")
end

function cong1()
	Msg2Player("�� ��n Chi�n Long ��ng!")
	NewWorld(959, 1670, 2959);
	SetProtectTime(18*3)
	AddSkillState(963, 1, 0, 18*3) 
end

function cong2()
	Msg2Player("�� ��n Chi�n Long ��ng!")
	NewWorld(959, 1548, 2995);
	SetProtectTime(18*3)
	AddSkillState(963, 1, 0, 18*3) 
end

function cong3()
	Msg2Player("�� ��n Chi�n Long ��ng!")
	NewWorld(959, 1701, 3152);
	SetProtectTime(18*3)
	AddSkillState(963, 1, 0, 18*3) 
end

function vitri_khac()
local tab_Content = {
		--"V�n Ti�u/goto_vantieu",
		"V��t �i/goto_satthu",	
		"T�n S�/goto_tinsu",		
		"Ki�m Gia M� Cung/goto_kiemgia",
		--"Th� Luy�n ���ng/goto_thiluyenduong",
		"Vi�m �� B�o T�ng/goto_viemde",
		"Phong L�ng ��/goto_phonglangdo",
		--"T�ng - Kim/gopos_step2battle",	
		--"��u Tr��ng Sinh T�/vaodautruong",		
		"Thi�n Tr� M�t C�nh/goto_thientri",
		--"Lo�n Chi�n C�u Ch�u/goto_chaucoc",				
		--"Chi�n tr��ng Th�t Th�nh ��i Chi�n/gopos_sevencityfield",
		"K�t th�c..!/no"
	}
	Say("Th�n h�nh ph�, �i ��n n�i ng��i mu�n.", getn(tab_Content), tab_Content);
end

function vaodautruong()
	local nWeekDay = tonumber(GetLocalDate("%w"))
	if  nWeekDay == 0 or  nWeekDay == 1 or  nWeekDay == 2 or  nWeekDay == 3 or  nWeekDay == 4 or  nWeekDay == 5  then 
	Say("Th�i gian v�o ��u Tr��ng 20h10 Th� 7 h�ng Tu�n")
	return 1
	end
	
	local _, nTongID = GetTongName()
	if (nTongID == 0) then
		Msg2Player("Kh�ng c� trong bang h�i, kh�ng th� tham gia.")
		return
	end
	local szTong = GetTongName()
	if szTong == "" then
		Msg2Player("Kh�ng c� trong bang h�i, kh�ng th� tham gia.")
		return
	end

	--if (TONGM_GetFigure(nTongID, GetName()) == TONG_RETIRE) then
	--	Say("�n s� kh�ng th� tham gia .")
	--	return
	--end		

	local tbSay = {}
	tinsert(tbSay,"H�u Doanh B�c./#gotoDT(1572,2438)")
	tinsert(tbSay,"H�u Doanh Nam./#gotoDT(1206,3156)")
	tinsert(tbSay,"H�u Doanh  ��ng./#gotoDT(1545,3110)")
	tinsert(tbSay,"H�u Doanh T�y./#gotoDT(1218,2452)")
	tinsert(tbSay,"Th�i ta kh�ng mu�n �i./no")
	Say("M�i l�a ch�n khu v�c tham ��u", getn(tbSay), tbSay)
	return 1
end;

function gotoDT(nX,nY)
	local nWeekDay = tonumber(GetLocalDate("%w"))
	local nHour = tonumber(GetLocalDate("%H%M"))
	if  (nHour >= 2010 and nHour < 2059) then
		else
			Say("Th�i gian v�o ��u tr��ng sinh t� l� 20h10. .",0);
			return
		end
NewWorld(355,nX,nY)
SetPunish(0)
SetLogoutRV(1);
BienHinh()
	local szTong = GetTong()
	if not szTong or  szTong == "" then
		SetCreateTeam(0);
		SetCurCamp(4);
BienHinh()
end
end
function BienHinh()
local szTong = GetTongName()

if szTong == "Vui�V�" then
ChangeOwnFeature( 1, 3500*18, 822,  0, 0, 0, 0)
end
if szTong == "V��L�m" then
ChangeOwnFeature( 1, 3500*18, 1194,  0, 0, 0, 0)
end
if szTong == "�Qu�y" then
ChangeOwnFeature( 1, 3500*18, 1195,  0, 0, 0, 0)
end
if szTong == "Ng�" then
ChangeOwnFeature( 1, 3500*18, 1196,  0, 0, 0, 0)
end
if szTong == "" then
ChangeOwnFeature( 1, 3500*18, 1200,  0, 0, 0, 0)
end
if szTong == "" then
ChangeOwnFeature( 1, 3500*18, 1114,  0, 0, 0, 0)
end
if szTong == "" then
ChangeOwnFeature( 1, 3500*18, 1436,  0, 0, 0, 0)
end
if szTong == "" and GetCamp() ~= 6 then
ChangeOwnFeature( 1, 3500*18, 893,  0, 0, 0, 0)
end
if GetCamp() == 6 then
ChangeOwnFeature( 1, 3500*18, 1503,  0, 0, 0, 0)
end
end


function goto_satthu()
SetFightState(0)
NewWorld(78,1509,3209)
end
function goto_thientri()
SetFightState(1)
NewWorld(934,1598,3240)
end
function goto_chaucoc()
SetFightState(0)
NewWorld(176,1574,2955)
end

function goto_vantieu()
SetFightState(1)
NewWorld(1,1559,2768)
end
function goto_tinsu()
SetFightState(0)
NewWorld(11,3024,5086)
end
function goto_thiluyenduong()
SetFightState(0)
NewWorld(176,1588,2941)
end


function goto_kiemgia()
SetFightState(0)
NewWorld(949,1580,3158)
end

function goto_viemde()
SetFightState(0)
--NewWorld(53,1629,3184)
NewWorld(37, 1711, 3179)
end

function goto_phonglangdo()
SetFightState(1)
NewWorld(336,1124,3187)
end


--*******************************************************************
tbMapGoldBoss = {
{"C� B�ch","Ph� Dung ��ng",202,"S�n B�o ��ng",76,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Huy�n Gi�c ��i S�","Nh�n Th�ch ��ng",10,"Thanh kh� ��ng",198,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"���ng Phi Y�n", "Phong L�ng ��",336,"Kho� Lang ��ng",75,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Lam Y Y","V� L�ng ��ng",199,"Phi Thi�n ��ng",204,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"H� Linh Phi�u", "Tr��ng B�ch s�n B�c",322,"V� Danh ��ng",203,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Y�n Hi�u Tr�i", "Sa M�c s�n  ��ng 1",225,"Sa M�c s�n  ��ng 3",227,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"M�nh Th��ng L��ng","Sa m�c ��a bi�u",224,"Sa M�c s�n  ��ng 2",226,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Gia Lu�t T� Ly", "L��ng Th�y ��ng",181,"D��ng Trung ��ng",205,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"��o Thanh Ch�n Nh�n","Tr��ng B�ch s�n Nam",321,"M�c Cao Qu�t",340,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Tuy�n C� T�", "T�y S�n ��o",342,"Phi Thi�n ��ng",204,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"V��ng T�","V� L�ng ��ng",199,"Ph� Dung ��ng",202,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Huy�n Nan ��i S�","Phong L�ng ��",336,"Kho� Lang ��ng",75,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"���ng B�t Nhi�m", "Tr��ng B�ch s�n Nam",321,"Kho� Lang ��ng",75,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"B�ch Doanh Doanh", "Thanh kh� ��ng",198,"Sa m�c ��a bi�u",224,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Thanh Tuy�t S� Th�i", "T�y S�n ��o",342,"D��ng Trung ��ng",205,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Chung Linh T�", "Phi Thi�n ��ng",204,"V� Danh ��ng",203,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"H� Nh�n Ng�", "Nh�n Th�ch ��ng",10,"L��ng Th�y ��ng",181,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"�oan M�c Du�", "Phong L�ng ��",336,"S�n B�o ��ng",76,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"T� ��i Nh�c", "M�c B�c Th�o Nguy�n",341,"V� L�ng ��ng",199,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Thanh Li�n T�","Tr��ng B�ch s�n B�c",322,"Sa M�c s�n  ��ng 3",227,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Thanh Tuy�t S� Th�i","Sa M�c s�n  ��ng 1",225,"Sa M�c s�n  ��ng 3",227,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"H�n Ngu D�t","Phong L�ng ��",336,"Kho� Lang ��ng",75,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
}

local tbmap = 
{
	[20]={
		{"L�ng T�n Th�y Ho�ng",7, 2235, 2847},
		{"La Ti�u s�n",179, 1738, 2559},
		{"Ki�m C�c Th�c ��o",3,1159, 3715},
	},
	[30]={
		{"Th�c C��ng s�n",92, 1637, 3302},
		{"B�ch V�n ��ng",21, 2852, 3887},
		{"Kim Quang ��ng",4, 1596, 3282},
		{"t�ng 1 T�n L�ng",8, 1603, 3497},
		{"Th� Ph� ��ng",167, 1859, 2770},
		{"T�a V�n ��ng",6, 1644, 3195},
	},
	[40]={
		{"�i�m Th��ng ��ng",167, 1411, 2748},
		{"Th�n Ti�n ��ng",23, 1583, 3205},
		{"Kinh Ho�ng ��ng",	5, 1802, 3412},
	},
	[50]={
		{"Thi�n T�m th�p t�ng 1",164, 1606, 3194},
		{"H��ng Th�y ��ng",24, 1692, 3189},
		{"Thi�n T�m ��ng",	42, 1584, 3221},
		{"Thi�t Th�p m� cung",	38, 1602, 3206},
		{"Nghi�t Long ��ng",	179, 1541, 3193},
	},
	[60]={
		{"108 La H�n tr�n",114, 1499, 3312},
		{"Thanh Loa ��ng",	69, 1600, 3207},
		{"Linh C�c ��ng",	94, 1591, 3194},
	},
	[70]={
		{"L�m Du Quan",	319, 1612, 3612},
		{"��i T� ��ng",	72, 1700, 2865},
		{"L�o H� ��ng",	122, 1665, 3326},
		{"Long Nh�n ��ng",	167, 1214, 2731},
	},
	[80]={
		{"V� Danh ��ng",	153, 1439, 3042},
		{"L��ng Th�y ��ng",	179, 1570, 3147},
		{"Thanh Kh� ��ng",174, 1483, 3074},
		{"Ph� Dung ��ng",20, 3701, 6232},
	},
}
function findgoldboss(f_bossx,f_bossy)

	if (not f_bossx) then
		f_bossx1 = 1;
		f_bossy1 = 12;
	else
		f_bossx1 = f_bossx;
		f_bossy1 = f_bossy;
	end
	
	if (f_bossy1 - f_bossx1 > 11) then
		f_bossy1 = f_bossx1 + 11;
	end
	
	local n_count = getn(tbMapGoldBoss);
	local tab_Content = {}
	
	for i = f_bossx1, f_bossy1 do
		tinsert(tab_Content, tbMapGoldBoss[i][1].."/#findgoldboss_Step2( "..i..")");
	end
	if (f_bossx1 ~= 1) then
		tinsert(tab_Content, "Trang tr��c/#findgoldboss( 1,"..(f_bossx1-1)..")");
	end
	
	if (f_bossy1 < n_count) then
		tinsert(tab_Content, "Trang sau/#findgoldboss( "..(f_bossy1+1)..","..n_count..")");
	end
	tinsert(tab_Content, "Tho�t./no");
	Say("��i hi�p t�m cao th� n�o?", getn(tab_Content), tab_Content);
end
function findgoldboss_Step2(nId)
	local tb = {}
	for i=2,getn(tbMapGoldBoss[nId]),2 do --"buoc nhay 2 tuc la i=2,4,6,8,10
	local npcidxtab = GetMapNpcWithName(tbMapGoldBoss[nId][i+1], tbMapGoldBoss[nId][1])
		if npcidxtab == nil then
				nNPCCount = 0
		else
			nNPCCount = getn(npcidxtab);
		end
		for j = 1, nNPCCount do 
			x, y, subworld = GetNpcPos(npcidxtab[j]); 
			m,n,k = floor(x/32),floor(y/32),SubWorldIdx2ID(subworld)
			
			--tinsert(tbOpt, {tbMapGoldBoss[nId][1].."-"..tbMapGoldBoss[nId][i].."["..m.."-"..n.."]",bbbbb, {m,n,k}})
			tinsert(tb,tbMapGoldBoss[nId][1].."-"..tbMapGoldBoss[nId][i].."["..floor(m/8).."-"..floor(n/16).."]/#findgoldboss_Step3("..m..","..n..","..k..")")
		end
	end
	strTittle = "T�m th�y cao th� v� l�m "..tbMapGoldBoss[nId][1].." t�i c�c v� tr� sau ��y."
	--tinsert(tbOpt, {"tho�t ",Quit})
	tinsert(tb,"Quay l�i./#findgoldboss(1,12)")
	tinsert(tb,"Tho�t./Quit")
	--CreateNewSayEx(strTittle, tbOpt)
	Say(strTittle,getn(tb),tb)
end
function findgoldboss_Step3(nX,nY,Map)
	NewWorld(Map,nX,nY) --
	SetFightState(1)
end
--*******************************************************************

tab_RevivePos = {
	[1] = {	--"Dia ly"
		{"Th�nh �� ��ng", 6, 11},{"Th�nh �� t�y", 7, 11},{"Th�nh �� nam", 8, 11},{"Th�nh �� b�c", 9, 11},{"Th�nh �� trung t�m", 5, 11}
	},
	[2] = {	--"Dia ly"
		{"T��ng D��ng ��ng", 30, 78},{"T��ng D��ng t�y", 32 , 78},{"T��ng D��ng nam", 31, 78},{"T��ng D��ng b�c", 33, 78},{"T��ng D��ng trung t�m", 29, 78}
	},
	[3] = {	--"Dia ly"
		{"Ph��ng T��ng ��ng", 1, 1},{"Ph��ng T��ng t�y", 2, 1},{"Ph��ng T��ng nam", 3, 1},{"Ph��ng T��ng b�c", 4, 1},{"Ph��ng T��ng trung t�m", 0, 1}
	},
	[4] = {	--"Dia ly"
		{"��i l� b�c", 64, 162},{"��i l� trung t�m", 63, 162}
	},
	[5] = {	--"Dia ly"
		{"Bi�n Kinh ��ng", 24, 37},{"Bi�n Kinh t�y", 25, 37},{"Bi�n Kinh nam", 24, 37},{"Bi�n Kinh b�c", 26, 37},{"Bi�n Kinh trung t�m", 23, 37}
	},
	[6] = {	--"Dia ly"
		{"D��ng Ch�u ��ng", 35, 80},{"D��ng Ch�u t�y", 38, 80},{"D��ng Ch�u nam", 37, 80},{"D��ng Ch�u b�c", 36, 80},{"D��ng Ch�u trung t�m", 34, 80}
	},
	[7] = {	--"Dia ly"
		{"L�m An ��ng", 68, 176},{"L�m An nam", 67, 176},{"L�m An b�c", 69, 176}
	},
	[8] = {	--"Dia ly"
		{"Ba L�ng huy�n", 19, 53},{"Giang T�n Th�n", 10, 20},{"V�nh L�c tr�n", 43, 99},{"Chu Ti�n tr�n", 45, 100},{"��o H��ng th�n", 47, 101},{"Long M�n tr�n", 55, 121},{"Th�ch C� tr�n", 59, 153},{"Long Tuy�n th�n", 65, 174},{"T�y S�n th�n", 1, 175}
	},
	[9] = {	--"Dia ly"
		{"Thi�n V��ng Bang", 21, 59},{"Thi�u L�m ph�i", 52, 103},{"���ng M�n", 15, 25},{"Ng� ��c Gi�o", 71, 183},{"Nga My ph�i", 13, 13},{"Th�y Y�n m�n", 61, 154},{"Thi�n Nh�n gi�o", 28, 49},{"C�i Bang", 53, 115},{"V� �ang ph�i", 40, 81},{"C�n L�n ph�i", 58, 131},{"Hoa S�n ph�i", 987, 987}
	},
};
--Cai gi do
function set_backpos()
	for i = 1, getn(tbBATTLEMAP) do 
		if ( nMapId == tbBATTLEMAP[i] ) then
			Msg2Player("L�c n�y b�n kh�ng th� s� d�ng v�t ph�m n�y");
			return 1;
		end
	end	
	

	
	local tab_Content = {
		"R�i kh�i/no",
		"Th�nh ��/#setpos_step2(1)",
		"T��ng D��ng/#setpos_step2(2)",
		"Ph��ng T��ng/#setpos_step2(3)",
		"��i L�/#setpos_step2(4)",
		"Bi�n Kinh/#setpos_step2(5)",
		"D��ng Ch�u/#setpos_step2(6)",
		"L�m An/#setpos_step2(7)",
		"Th�n trang/#setpos_step2(8)",
		"M�n ph�i/#setpos_step2(9)"
	}
	Say("Thi�t ��t �i�m h�i th�nh cho l �n sau s� d�ng th� ��a ph�", getn(tab_Content), tab_Content);
end;

--"Dia ly"
function setpos_step2(nIdx)
	local tab_Content = {};
	for i = 1, getn(tab_RevivePos[nIdx]) do
		tinsert(tab_Content, tab_RevivePos[nIdx][i][1].."/#setpos_step3( "..nIdx..","..i..")");
	end;
	tinsert(tab_Content, "R�i kh�i/no");
	Say("Thi�t ��t �i�m h�i th�nh cho l �n sau s� d�ng th� ��a ph�", getn(tab_Content), tab_Content);
end;
--"Dia ly"
function setpos_step3(nIdx, nSubIdx)
	SetRevPos(tab_RevivePos[nIdx][nSubIdx][3], tab_RevivePos[nIdx][nSubIdx][2]);
	Say("��i hi�p �� ��t th�nh c�ng �i�m h�i sinh"..tab_RevivePos[nIdx][nSubIdx][1], 0);
	Msg2Player("��i hi�p �� ��t th�nh c�ng �i�m h�i sinh"..tab_RevivePos[nIdx][nSubIdx][1]);
end;
--"Dia ly"
function gototown()
	
	local tab_Content = {
		"R�i kh�i/no",
		"Th�nh th� /gopos_step2town",
		"Th�n trang/#gopos_step2(8)",
		"M�n ph�i/#gopos_step2(9)",
		--"Chi�n Tr��ng T�ng - Kim/gopos_step2battle",
		--"Chi�n tr��ng Th�t Th�nh ��i Chi�n/gopos_sevencityfield",
		"Chi�n Long ��ng/didenchienlongok",

	}
	Say("Th�n h�nh ph�, �i ��n n�i ng��i mu�n.", getn(tab_Content), tab_Content);
end;


function gotoluyencong()
	
	local tab_Content = {
		"B�n �� c�p 90/#gopos_step2lv90()",
		"B�n �� c�p tr�n 90/#gopos_step2lv90x()",
		"B�n �� Luy�n c�ng c�a t�n th�./#luyencongtanthu()",
		"R�i kh�i/no",

	}
	Say("Th�n h�nh ph�, �i ��n n�i ng��i mu�n.", getn(tab_Content), tab_Content);
end;

function luyencongtanthu()
	local tab_Content = {
		"Di chuy�n ��n b�n �� luy�n c�ng c�p 20 /gopos_step2lv20",
		"Di chuy�n ��n b�n �� luy�n c�ng c�p 30 /gopos_step2lv30",
		"Di chuy�n ��n b�n �� luy�n c�ng c�p 40 /gopos_step2lv40",
		"Di chuy�n ��n b�n �� luy�n c�ng c�p 50 /gopos_step2lv50",
		"Di chuy�n ��n b�n �� luy�n c�ng c�p 60 /gopos_step2lv60",
		"Di chuy�n ��n b�n �� luy�n c�ng c�p 70 /gopos_step2lv70",
		"Di chuy�n ��n b�n �� luy�n c�ng c�p 80 /gopos_step2lv80",
		"Ta ch�a mu�n �i ��u c�./no",
	}
	Say("L�a ch�n b�n �� luy�n c�ng c�n thi�t.", getn(tab_Content), tab_Content);
end;

function gopos_step2town()
	local tab_Content = {
		"R�i kh�i/no",
		"Th�nh ��/#gopos_step2(1)",
		"T��ng D��ng/#gopos_step2(2)",
		"Ph��ng T��ng/#gopos_step2(3)",
		"��i L�/#gopos_step2(4)",
		"Bi�n Kinh/#gopos_step2(5)",
		"D��ng Ch�u/#gopos_step2(6)",
		"L�m An/#gopos_step2(7)",
	}
	Say("Th�n h�nh ph�, �i ��n n�i ng��i mu�n.", getn(tab_Content), tab_Content);
end

--"Dia ly"
function gopos_step2(nIdx)
	local tab_Content = {};
	for i = 1, getn(tab_RevivePos[nIdx]) do
		tinsert(tab_Content, tab_RevivePos[nIdx][i][1].."/#gopos_step3( "..nIdx..","..i..")");
	end;
	tinsert(tab_Content, "R�i kh�i/no");
	Say("Th�n h�nh ph�, �i ��n n�i ng��i mu�n.", getn(tab_Content), tab_Content);
end;

--"Dia ly"
function gopos_step3(nIdx, nSubIdx)
	local file = [[\settings\RevivePos.ini]];
	ini_loadfile(file, 0)
	local szData = ini_getdata(file, tab_RevivePos[nIdx][nSubIdx][3], tab_RevivePos[nIdx][nSubIdx][2]);

	local szArr = split(szData);
	local nPosX = floor(tonumber(szArr[1]) / 32);
	local nPosY = floor(tonumber(szArr[2]) / 32);
	
	if (not nPosX or not nPosY) then
		return
	end;
	NewWorld(tab_RevivePos[nIdx][nSubIdx][3], nPosX, nPosY)
	SetFightState(0);
	Msg2Player("Xin h�y ng�i y�n, ch�ng ta �i "..tab_RevivePos[nIdx][nSubIdx][1].." n�o");
	SetProtectTime(18*3) --"Dia ly"
	AddSkillState(963, 1, 0, 18*3)
end;

tab_lv90map = {
		
		{322,1589,3164	,"Tr��ng B�ch S�n B�c",},
		{321,967,2313	,"Tr��ng B�ch S�n Nam",},
		{75,1811,3012	,"Kho� Lang ��ng",},
		{225,1474,3275	,"Sa M�c M� Cung 1",},
		{226,1560,3184	,"Sa M�c M� Cung 2",},
		{227,1588,3237	,"Sa M�c M� Cung 3",},
		{336,1124,3187	,"Phong L�ng ��",},
		{340,1845,3438	,"M�c Cao Qu�t",},
		{144,1691,3020	,"D��c V��ng ��ng t�ng 4",},
		{93,1529,3166	,"Ti�n C�c ��ng M�t Cung",},
		{124,1675,3418	,"C�n Vi�n ��ng M� Cung",},
		{152,1672,3361	,"Tuy�t B�o ��ng T�ng 8",},
		--{949,1602,3199	,"M� Cung Ki�m Gia",},
		--{875,1576,3177	,"H�c Sa ��ng",},
		--{917,1816,3392	,"Ph�ch Huy�t C�c",},
		--{918,1816,3392	,"�c Nh�n C�c",},
		---{919,1608,3168	,"Th�c C�t Nhai",},
		--{920,1608,3168	,"H�c M�c Nhai",},
		--{921,1560,3104	,"Thi�n Ph� S�n",},
		--{922,1560,3104	,"B�n Long S�n",},
		--{923,2008,4080	,"��a M�u S�n",},
		--{924,2008,4080	,"Uy�n Ph��ng S�n",},
		--{950,1592,3195	,"�c Lang C�c",},
}

function gopos_step2lv90(ns, ne)
	print(ns, ne)
	if (not ns) then
		ns_1 = 1;
		ne_1 = 7;
	else
		ns_1 = ns;
		ne_1 = ne;
	end
	if (ne_1 - ns_1 > 6) then
		ne_1 = ns_1 + 6;
	end
	local n_count = getn(tab_lv90map);
	local tab_Content = {};
	for i = ns_1, ne_1 do
		tinsert(tab_Content, tab_lv90map[i][4].."/#gopos_step3lv90( "..i..")");
	end
	if (ns_1 ~= 1) then
		tinsert(tab_Content, "Trang tr��c/#gopos_step2lv90( 1,"..(ns_1-1)..")");
	end
	if (ne_1 < n_count) then
		tinsert(tab_Content, "Trang k� /#gopos_step2lv90( "..(ne_1+1)..","..n_count..")");
	end
	tinsert(tab_Content, "R�i kh�i/no");
	Say("Th�n h�nh ph�, �i ��n n�i ng��i mu�n.", getn(tab_Content), tab_Content);
end


function gopos_step3lv90(nIdx)
	NewWorld(tab_lv90map[nIdx][1], tab_lv90map[nIdx][2], tab_lv90map[nIdx][3])
	SetFightState(1);
	Msg2Player("Xin h�y ng�i y�n, ch�ng ta �i "..tab_lv90map[nIdx][4].." n�o");
	SetProtectTime(18*3) --cai gi do
	AddSkillState(963, 1, 0, 18*3)
end

-------------**********-----------
tab_lv90mapx = {
				
		{875,1576,3177	,"H�c Sa ��ng",},
		{917,1816,3392	,"Ph�ch Huy�t C�c",},
		{918,1816,3392	,"�c Nh�n C�c",},
		{919,1608,3168	,"Th�c C�t Nhai",},
		{920,1608,3168	,"H�c M�c Nhai",},
		{921,1560,3104	,"Thi�n Ph� S�n",},
		{922,1560,3104	,"B�n Long S�n",},
		{923,2008,4080	,"��a M�u S�n",},
		{924,2008,4080	,"Uy�n Ph��ng S�n",},
		{950,1592,3195	,"�c Lang C�c",},
}
function gopos_step2lv90x(ns, ne)
	print(ns, ne)
	if (not ns) then
		ns_1 = 1;
		ne_1 = 7;
	else
		ns_1 = ns;
		ne_1 = ne;
	end
	if (ne_1 - ns_1 > 6) then
		ne_1 = ns_1 + 6;
	end
	local n_count = getn(tab_lv90mapx);
	local tab_Content = {};
	for i = ns_1, ne_1 do
		tinsert(tab_Content, tab_lv90mapx[i][4].."/#gopos_step3lv90x( "..i..")");
	end	
	if (ns_1 ~= 1) then
		tinsert(tab_Content, "Trang tr��c/#gopos_step2lv90x( 1,"..(ns_1-1)..")");
	end
	if (ne_1 < n_count) then
		tinsert(tab_Content, "Trang k� /#gopos_step2lv90x( "..(ne_1+1)..","..n_count..")");
	end
	tinsert(tab_Content, "R�i kh�i/no");
	Say("Th�n h�nh ph�, �i ��n n�i ng��i mu�n.", getn(tab_Content), tab_Content);
end

function gopos_step3lv90x(nIdx)
	NewWorld(tab_lv90mapx[nIdx][1], tab_lv90mapx[nIdx][2], tab_lv90mapx[nIdx][3])
	SetFightState(1);
	Msg2Player("Xin h�y ng�i y�n, ch�ng ta �i "..tab_lv90mapx[nIdx][4].." n�o");
	SetProtectTime(18*3) --cai gi do
	AddSkillState(963, 1, 0, 18*3)
end

----------------******************

tab_lv80map = {
		{224,1622,3118	,"Sa M�c ��a bi�u",},
		{198,1521,2947	,"Thanh Kh� ��ng",},
		{320,1147,3123	,"Ch�n n�i Tr��ng B�ch",},
		{181,1425,2999	,"L��ng Th�y ��ng",},
		{201,1616,3195	,"B�ng H� ��ng",},
	}

function gopos_step2lv80(ns, ne)
	local n_count = getn(tab_lv80map);
	local tab_Content = {};
	for i = 1, 5 do
		tinsert(tab_Content, tab_lv80map[i][4].."/#gopos_step3lv80( "..i..")");
	end
	
	
	tinsert(tab_Content, "H�y b�/no");
	Say("Th�n H�nh Ph�, di chuy�n ��n n�i c�n ��n.", getn(tab_Content), tab_Content);
end


function gopos_step3lv80(nIdx)
	NewWorld(tab_lv80map[nIdx][1], tab_lv80map[nIdx][2], tab_lv80map[nIdx][3])
	SetFightState(1);
	Msg2Player("Ng�i y�n! Ch�ng ta �i "..tab_lv80map[nIdx][4].."!");
	SetProtectTime(18*3) --cai gi do
	AddSkillState(963, 1, 0, 18*3)
end
---------------------map luyen cong 70----------------------------
tab_lv70map = {
		{319,1630,3587	,"L�m Du Quan",},
		{123,1702,3350	,"L�o H� ��ng",},
		{206,1603,3215	,"T�n L�ng t�ng 2",},
		
	}

function gopos_step2lv70(ns, ne)
	local n_count = getn(tab_lv70map);
	local tab_Content = {};
	for i = 1, 3 do
		tinsert(tab_Content, tab_lv70map[i][4].."/#gopos_step3lv70( "..i..")");
	end
	
	
	tinsert(tab_Content, "H�y b�/no");
	Say("Th�n H�nh Ph�, di chuy�n ��n n�i c�n ��n.", getn(tab_Content), tab_Content);
end


function gopos_step3lv70(nIdx)
	NewWorld(tab_lv70map[nIdx][1], tab_lv70map[nIdx][2], tab_lv70map[nIdx][3])
	SetFightState(1);
	Msg2Player("Ng�i y�n! Ch�ng ta �i "..tab_lv70map[nIdx][4].."!");
	SetProtectTime(18*3) --cai gi do
	AddSkillState(963, 1, 0, 18*3)
end
---------------------map luyen cong 60----------------------------
tab_lv60map = {
		{79,1600,3206	,"T��ng D��ng Nha M�n M�t ��o",},
		{56,1516,3443	,"Ho�nh S�n Ph�i",},
		{166,1649,3231	,"Thi�n T�m Th�p t�ng 3",},
		
	}

function gopos_step2lv60(ns, ne)
	local n_count = getn(tab_lv60map);
	local tab_Content = {};
	for i = 1, 3 do
		tinsert(tab_Content, tab_lv60map[i][4].."/#gopos_step3lv60( "..i..")");
	end
	
	
	tinsert(tab_Content, "H�y b�/no");
	Say("Th�n H�nh Ph�, di chuy�n ��n n�i c�n ��n.", getn(tab_Content), tab_Content);
end


function gopos_step3lv60(nIdx)
	NewWorld(tab_lv60map[nIdx][1], tab_lv60map[nIdx][2], tab_lv60map[nIdx][3])
	SetFightState(1);
	Msg2Player("Ng�i y�n! Ch�ng ta �i "..tab_lv60map[nIdx][4].."!");
	SetProtectTime(18*3) --Cai gi do
	AddSkillState(963, 1, 0, 18*3)
end
---------------------map luyen cong 50----------------------------
tab_lv50map = {
		{182,1777,2982	,"Nghi�t Long ��ng",},
		{164,1611,3187	,"Thi�n T�m Th�p",},
		
	}

function gopos_step2lv50(ns, ne)
	local n_count = getn(tab_lv50map);
	local tab_Content = {};
	for i = 1, 2 do
		tinsert(tab_Content, tab_lv50map[i][4].."/#gopos_step3lv50( "..i..")");
	end
	
	
	tinsert(tab_Content, "H�y b�/no");
	Say("Th�n H�nh Ph�, di chuy�n ��n n�i c�n ��n.", getn(tab_Content), tab_Content);
end


function gopos_step3lv50(nIdx)
	NewWorld(tab_lv50map[nIdx][1], tab_lv50map[nIdx][2], tab_lv50map[nIdx][3])
	SetFightState(1);
	Msg2Player("Ng�i y�n! Ch�ng ta �i "..tab_lv50map[nIdx][4].."!");
	SetProtectTime(18*3) --cai gi do
	AddSkillState(963, 1, 0, 18*3)
end
---------------------map luyen cong 40----------------------------
tab_lv40map = {
		{21,2622,4502	,"Thanh Th�nh S�n",},
		{167,1575,3239	,"�i�m Th��ng S�n",},

	}

function gopos_step2lv40(ns, ne)
	local n_count = getn(tab_lv40map);
	local tab_Content = {};
	for i = 1, 2 do
		tinsert(tab_Content, tab_lv40map[i][4].."/#gopos_step3lv40( "..i..")");
	end
	
	
	tinsert(tab_Content, "H�y b�/no");
	Say("Th�n H�nh Ph�, di chuy�n ��n n�i c�n ��n.", getn(tab_Content), tab_Content);
end


function gopos_step3lv40(nIdx)
	NewWorld(tab_lv40map[nIdx][1], tab_lv40map[nIdx][2], tab_lv40map[nIdx][3])
	SetFightState(1);
	Msg2Player("Ng�i y�n! Ch�ng ta �i "..tab_lv40map[nIdx][4].."!");
	SetProtectTime(18*3) --cai gi do
	AddSkillState(963, 1, 0, 18*3)
end
---------------------map luyen cong 30----------------------------
tab_lv30map = {
		{193,1938,2845	,"V� Di S�n",},
		{170,1612,3187	,"Th� Ph� ��ng",},
	}

function gopos_step2lv30(ns, ne)
	local n_count = getn(tab_lv30map);
	local tab_Content = {};
	for i = 1, 2 do
		tinsert(tab_Content, tab_lv30map[i][4].."/#gopos_step3lv30( "..i..")");
	end
	
	
	tinsert(tab_Content, "H�y b�/no");
	Say("Th�n H�nh Ph�, di chuy�n ��n n�i c�n ��n.", getn(tab_Content), tab_Content);
end


function gopos_step3lv30(nIdx)
	NewWorld(tab_lv30map[nIdx][1], tab_lv30map[nIdx][2], tab_lv30map[nIdx][3])
	SetFightState(1);
	Msg2Player("Ng�i y�n! Ch�ng ta �i "..tab_lv30map[nIdx][4].."!");
	SetProtectTime(18*3) --cai gid 
	AddSkillState(963, 1, 0, 18*3)
end
---------------------map luyen cong 20----------------------------
tab_lv20map = {
		{19,3102,3963	,"Ki�m C�c T�y Nam",},
		{7,2276,2825	,"T�n L�ng t�ng 1",},

	}

function gopos_step2lv20(ns, ne)
	local n_count = getn(tab_lv20map);
	local tab_Content = {};
	for i = 1, 2 do
		tinsert(tab_Content, tab_lv20map[i][4].."/#gopos_step3lv20( "..i..")");
	end
	
	
	tinsert(tab_Content, "H�y b�/no");
	Say("Th�n H�nh Ph�, di chuy�n ��n n�i c�n ��n.", getn(tab_Content), tab_Content);
end


function gopos_step3lv20(nIdx)
	NewWorld(tab_lv20map[nIdx][1], tab_lv20map[nIdx][2], tab_lv20map[nIdx][3])
	SetFightState(1);
	Msg2Player("Ng�i y�n! Ch�ng ta �i "..tab_lv20map[nIdx][4].."!");
	SetProtectTime(18*3) ---- cai gi
	AddSkillState(963, 1, 0, 18*3)
end
---------------------map luyen cong 10----------------------------

function gopos_step2battle()
	--if ( GetLevel() < 120 ) then
		--Talk( 1, "", "Phong V�n Lu�n Ki�m gian kh� kh�c li�t, ng��i ch�a ��t ��n c�p 120 h�y v� luy�n th�m r�i h�y t�nh." );
	--else
		Say ( "Trong Phong V�n Lu�n Ki�m, b�n l�i th� v� s� ng��i tuy c� chi�m �u th� nh�ng s� nh�n ���c �i�m t�ch l�y �t h�n, c�c h� mu�n ch�n b�o danh b�n n�o?", 3, "V�o �i�m b�o danh phe T�ng (T)/#DoRescriptFunc(1)", "V�o �i�m b�o danh phe Kim (K)/#DoRescriptFunc(2)","�� ta suy ngh� l�i./no" );
	--end;
end

function gopos_sevencityfield()
	Say("Ng��i mu�n �i chi�n tr��ng n�o c�a Th�t Th�nh ��i Chi�n?", 8,
		"Chi�n tr��ng Th�nh ��/#goto_sevencityfield(1)",
		"Chi�n tr��ng Bi�n Kinh/#goto_sevencityfield(2)",
		"Chi�n tr��ng ��i L�/#goto_sevencityfield(3)",
		"Chi�n tr��ng Ph��ng T��ng/#goto_sevencityfield(4)",
		"Chi�n tr��ng L�m An/#goto_sevencityfield(5)",
		"Chi�n tr��ng T��ng D��ng/#goto_sevencityfield(6)",
		"Chi�n tr��ng D��ng Ch�u/#goto_sevencityfield(7)",
		"�� ta suy ngh� l�i/Cancel")
end

function goto_sevencityfield(nIndex)
	local player = PlayerList:GetPlayer(PlayerIndex)
	local tbErr = {}
	if (BattleWorld:CheckMapPermission(player, tbErr) == 0) then
		player:Say(tbErr.Msg)
		return
	end
	local nMapId = FIELD_LIST[nIndex]
	BattleWorld:Transfer(player, nMapId)
end

function DoRescriptFunc(nSel)
	--if ( GetLevel() < 120 ) then
	--	Talk( 1, "", "Phong V�n Lu�n Ki�m gian kh� kh�c li�t, ng��i ch�a ��t ��n c�p 120 h�y v� luy�n th�m r�i h�y t�nh." );
	--	return
	--end
	local tbsongjin_pos = {1541, 3178};	--cai gi do
	local szstr = "Phe T�ng (T)";
	if (nSel == 2) then
		tbsongjin_pos = {1570, 3085};
		szstr = "Phe Kim (K)";
	end;
	szstr = ""
	if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		NewWorld( 323, tbsongjin_pos[1], tbsongjin_pos[2]);
	SetProtectTime(18*3) --- cai gi do
	AddSkillState(963, 1, 0, 18*3)
		SetFightState(0);
		DisabledUseTownP(0); --- cai gi do
		Msg2Player( "��n n�i b�o danh Chi�n Tr��ng T�ng Kim S� C�p" );
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		NewWorld( 324, tbsongjin_pos[1], tbsongjin_pos[2]);
	SetProtectTime(18*3) --- cai gi do
	AddSkillState(963, 1, 0, 18*3)
		SetFightState(0);
		DisabledUseTownP(0);--- cai gi do
		Msg2Player( "��n n�i b�o danh Chi�n Tr��ng T�ng Kim Trung C�p" );
	else
		NewWorld( 325, tbsongjin_pos[1], tbsongjin_pos[2]);
	SetProtectTime(18*3) --- cai gi do
	AddSkillState(963, 1, 0, 18*3)
		SetFightState(0);
		DisabledUseTownP(0); --- cai gi do
		Msg2Player( "��n n�i b�o danh Chi�n Tr��ng T�ng Kim Cao C�p" );
	end
end


function no()
end

