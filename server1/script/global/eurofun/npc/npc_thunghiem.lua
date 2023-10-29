IncludeLib("TASKSYS");
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
IncludeLib("SETTING")
Include("\\script\\tong\\tong_award_head.lua");
IncludeLib("FILESYS")
Include("\\script\\lib\\common.lua");
Include("\\script\\vng_lib\\files_lib.lua");
Include("\\script\\petsys\\transferexp.lua")
Include("\\script\\petsys\\feed.lua")
Include("\\script\\��ԭ����\\����\\npc\\����_����ѧͽ�Ի�.lua")
Include("\\script\\ctc_feature\\top10\\top10.lua")
Include("\\script\\global\\eurofun\\hotro\\trangbihoangkim_caocap.lua")
Include("\\script\\global\\eurofun\\hotro\\nhancankhon.lua")
Include("\\script\\global\\eurofun\\hotro\\trangbihoangkim.lua")

function main()	
dofile("script/global/eurofun/npc/npc_thunghiem.lua")
str = "Ch�o m�ng c�c b�n �� tham gia th� gi�i <color=red>V� L�m Truy�n K�<color> ���c Edit <color=green>By  Eurofun<color> m�i chi ti�t xin li�n h� <color=green>https://fb.com/groups/volamquan<color> �� nh�n ���c s� h� tr� khi c�n thi�t."
AddGlobalCountNews(str, 1)
local bilTbOp = {}
tinsert(bilTbOp, "Nh�n Tr�ng Sinh 6/TrungSinh")
tinsert(bilTbOp, "X�a s�ch g��ng ��/DonSachRuong")
tinsert(bilTbOp, "Nh�n H� M�ch ��n v� Ch�n Nguy�n n�ng m�ch/nhantrannguyen")
--tinsert(bilTbOp, "Test/nhantrangbitestgame")
tinsert(bilTbOp, "Nh�n Trang B� Hi�m/nhantrangbihiem")
tinsert(bilTbOp, "L�y Trang B� Cao C�p/TrangBiHoangKimCaoCap")
tinsert(bilTbOp, "Nh�n Nguy�n Li�u Pet/nguyenlieupet")
tinsert(bilTbOp, "L�p Bang/lapbang")
tinsert(bilTbOp, "Nh�n Ti�n/NhanTienvsDiem")
tinsert(bilTbOp, "V�o Hoa S�n/vaohoason")
tinsert(bilTbOp, "V�o V� H�n/vaovuhon")
tinsert(bilTbOp, "K�t th�c ��i tho�i/no")
Say("Ch�c n�ng th� nghi�m !", getn(bilTbOp), bilTbOp)
end

function nhantrangbihiem()	
local bilTbOp = {}
tinsert(bilTbOp, "Trang B� Hi�m/TrangBiHiem")
tinsert(bilTbOp, "Nh�n C�n Kh�n C�p 10/NhanCanKhon")
tinsert(bilTbOp, "Trang B� Ho�ng Kim Th��ng/TrangBiHoangKim22")
tinsert(bilTbOp, "K�t th�c ��i tho�i/no")
Say("Ch�c n�ng th� nghi�m !", getn(bilTbOp), bilTbOp)
end

function NhanCanKhon()	
local bilTbOp = {}
tinsert(bilTbOp, "Nh�n C�n Kh�n C�p 10 Th�i Gian Tr�ng ��c/NhanCanKhon1")
tinsert(bilTbOp, "Nh�n C�n Kh�n C�p 10 Th�i Gian L�m Cho�ng/NhanCanKhon2")
tinsert(bilTbOp, "Nh�n C�n Kh�n C�p 10 Th�i Gian L�m Ch�m/NhanCanKhon3")
tinsert(bilTbOp, "K�t th�c ��i tho�i/no")
Say("Ch�c n�ng th� nghi�m !", getn(bilTbOp), bilTbOp)
end
-----------------------------------------------------------------------------------------------------------
function vaohoason()
local player_Faction = GetFaction()
	if (GetLastFactionNumber() == 5) then		-- ����
		Talk(1,"","T� l�u nghe ti�ng c�c c� n��ng Th�y Y�n ��p nh� ti�n n�, v� c� n��ng n�y cho �n m�y ta �t ti�n u�ng r��u ���c ch�ng?")
		return
	elseif (GetLastFactionNumber() == 4) then				
		Talk(1,"","Xinh ��p nh� hoa t��i m� h�ng ng�y c� ��i di�n v�i Thanh ��ng C� Ph�t!  Ta kh�ng th�ch c�c ng��i � �i�m n�y! ")
		return
	elseif (GetLastFactionNumber() == 2) then
		Talk(1,"","Hai ph�i ch�ng ta li�n minh l�i, kh�ng c�n ph�i ph�n tranh n�a! Ch�ng ph�i l� h� s� �?")
		return
	elseif (GetLastFactionNumber() == 3) then
		Talk(1,"","Ta gh�t nh�t l� c�i b�n len l�n h� ��c h�i ng��i!  �y!  Kh�ng ph�i ta n�i ng��i! ")
		return
	elseif (GetLastFactionNumber() == 1) then
		Talk(1,"","D��ng H� c�a Thi�n V��ng bang c�c ng��i c�n k�m xa b�n m�n c�a ta, Thi�n V��ng qu� nhi�n ch�ng ra g� h�t! ")
		return
	elseif (GetLastFactionNumber() == 0) then
		Talk(1,"","H�a th��ng ��u tr�c sao l�i ��n n�i th�m s�n c�ng c�c th� n�y?! ")
		return
	elseif (GetLastFactionNumber() == 8) then
		Talk(1,"","Qu� m�n l�y hi�p ngh�a l�m tr�ng, nh�ng kh�ng bi�t ��n T� Nam c� bi�t h� th�n hay kh�ng m� c� mu�n so t�i v�i v� c�ng c�a ch�ng ta")
		return
	elseif (GetLastFactionNumber() == 9) then
		Talk(1,"","C�n L�n ph�i ph�t tri�n th�n t�c! T�i h� r�t ng��ng m�! ")
		return
	elseif (GetLastFactionNumber() == 7) then
		Talk(1,"","Ai l�m ho�ng �� th� c�ng m�c!  Nh�ng c�c ng��i t�n s�t sinh linh th� b�n c� n��ng kh�ng b� qua! ")
		return
	elseif (GetLastFactionNumber() == 6) then
		Talk(2,"","��i hi�p!  ��ng qua ��y! ","�! B� ch�t!!! ")
		return
	elseif (GetLastFactionNumber() == 11) then
		Talk(2,"","��i hi�p!  ��ng qua ��y! ","�! B� ch�t!!! ")
		return
	elseif (GetLastFactionNumber() == 10) then
		Talk(2,"","��i hi�p!  ��ng qua ��y! ","�! B� ch�t!!! ")
		return
end
SetFaction("huashan");
SetCamp(3);
SetCurCamp(3);
SetRank(89);
SetSeries(2);
SetLastFactionNumber(10);
AddMagic(1347,20)
AddMagic(1372,20)
AddMagic(1349,20)
AddMagic(1374,20)
AddMagic(1350,20)
AddMagic(1375,20)
AddMagic(1351,20)
AddMagic(1376,20)
AddMagic(1354,20)
AddMagic(1378,20)
AddMagic(1355,20)
AddMagic(1379,20)
AddMagic(1380,20)
AddMagic(1360,20)
AddMagic(1364,20)
AddMagic(1358,30)
AddMagic(1382,20)
AddMagic(1384,20)
AddMagic(1369,20)
AddMagic(1370,20)
end
-----------------------------------------------------------------------------------------------------------
function vaovuhon()
local player_Faction = GetFaction()
	if (GetLastFactionNumber() == 5) then		-- ����
		Talk(1,"","T� l�u nghe ti�ng c�c c� n��ng Th�y Y�n ��p nh� ti�n n�, v� c� n��ng n�y cho �n m�y ta �t ti�n u�ng r��u ���c ch�ng?")
		return
	elseif (GetLastFactionNumber() == 4) then				
		Talk(1,"","Xinh ��p nh� hoa t��i m� h�ng ng�y c� ��i di�n v�i Thanh ��ng C� Ph�t!  Ta kh�ng th�ch c�c ng��i � �i�m n�y! ")
		return
	elseif (GetLastFactionNumber() == 2) then
		Talk(1,"","Hai ph�i ch�ng ta li�n minh l�i, kh�ng c�n ph�i ph�n tranh n�a! Ch�ng ph�i l� h� s� �?")
		return
	elseif (GetLastFactionNumber() == 3) then
		Talk(1,"","Ta gh�t nh�t l� c�i b�n len l�n h� ��c h�i ng��i!  �y!  Kh�ng ph�i ta n�i ng��i! ")
		return
	elseif (GetLastFactionNumber() == 1) then
		Talk(1,"","D��ng H� c�a Thi�n V��ng bang c�c ng��i c�n k�m xa b�n m�n c�a ta, Thi�n V��ng qu� nhi�n ch�ng ra g� h�t! ")
		return
	elseif (GetLastFactionNumber() == 0) then
		Talk(1,"","H�a th��ng ��u tr�c sao l�i ��n n�i th�m s�n c�ng c�c th� n�y?! ")
		return
	elseif (GetLastFactionNumber() == 8) then
		Talk(1,"","Qu� m�n l�y hi�p ngh�a l�m tr�ng, nh�ng kh�ng bi�t ��n T� Nam c� bi�t h� th�n hay kh�ng m� c� mu�n so t�i v�i v� c�ng c�a ch�ng ta")
		return
	elseif (GetLastFactionNumber() == 9) then
		Talk(1,"","C�n L�n ph�i ph�t tri�n th�n t�c! T�i h� r�t ng��ng m�! ")
		return
	elseif (GetLastFactionNumber() == 7) then
		Talk(1,"","Ai l�m ho�ng �� th� c�ng m�c!  Nh�ng c�c ng��i t�n s�t sinh linh th� b�n c� n��ng kh�ng b� qua! ")
		return
	elseif (GetLastFactionNumber() == 6) then
		Talk(2,"","��i hi�p!  ��ng qua ��y! ","�! B� ch�t!!! ")
		return
	elseif (GetLastFactionNumber() == 10) then
		Talk(2,"","��i hi�p!  ��ng qua ��y! ","�! B� ch�t!!! ")
		return
	elseif (GetLastFactionNumber() == 11) then
		Talk(2,"","��i hi�p!  ��ng qua ��y! ","�! B� ch�t!!! ")
		return
	end
SetFaction("wuhun");
SetCamp(1);
SetCurCamp(1);
SetRank(97);
SetSeries(3);
SetLastFactionNumber(11);
AddMagic(1963,20)
AddMagic(1964,20)
AddMagic(1965,20)
AddMagic(1967,20)
AddMagic(1969,20)
AddMagic(1971,20)
AddMagic(1972,20)
AddMagic(1974,20)
AddMagic(1975,20)
AddMagic(1976,20)
AddMagic(1977,20)
AddMagic(1979,20)
AddMagic(1980,20)
AddMagic(1981,20)
AddMagic(1982,30)
AddMagic(1983,20)
AddMagic(1984,20)
AddMagic(1985,20)
AddMagic(1986,20)
end
--------------------------------------Nh�n Ch�n Nguy�n------------------------------------------------------
function nhantrannguyen()
tbAwardTemplet:GiveAwardByList({{szName="H� M�ch ��n",tbProp={6,1,3203,1,0},nCount=10000,},}, "npctest", 1);
SetTask(4000, GetTask(4000) + 100000)
end
--------------------------------------Nh�n Trang B� Test Game-----------------------------------------------
function nhantrangbitestgame()
for i=5658,5669 do
AddGoldItem(0,i)
end
--AddGoldItem(0,5991)
--AddGoldItem(0,3962)
--AddGoldItem(0,3997)
--AddGoldItem(0,6480)
--AddGoldItem(0,6480)
--AddGoldItem(0,6762)
--AddItem(0,11,841,1,0,0)
--AddItem(6,1,2219,1,0,0)
--AddItem(0,11,829,1,0,0)
--AddGoldItem(0,6542)
--AddGoldItem(0,6592)
--AddGoldItem(0,6682)
--AddGoldItem(0,6735)
end
--------------------------------------Nguy�n Li�u Pet-----------------------------------------------
function nguyenlieupet()
local nTamePoint = PET_GetTamePoint() + 100000
PET_SetTamePoint(nTamePoint)
local nGrownPoint = PET_GetGrownPoint()
PET_SetGrownPoint(nGrownPoint + 20000)
local nUpgradePoint = PET_GetUpgradePoint()
PET_SetUpgradePoint(nUpgradePoint + 20000)
for i=1,100 do
AddItem(6,1,3454,1,0,0)
end
AddItem(6,1,4808,1,0,0)
AddItem(6,1,4808,1,0,0)
for i=1,10 do
AddItem(6,1,3456,1,0,0)
end
AddItem(6,1,4808,1,0,0)
AddItem(6,1,3453,0,0,0)
end
--------------------------------------L�p Bang-----------------------------------------------
function lapbang()
	if (GetCamp() ~= 4) then
		SetCamp(4);
		SetCurCamp(4);
	end
	if (GetRepute() < 450) then
		AddRepute(450);
	end
	if (GetLeadLevel() < 30) then
		for i = 1, 30 do
			AddLeadExp(250000);
		end
	end
	if (HaveItem(195) < 1) then
		AddItem(4,195,1,0,0,0);
	end
Earn(1000000)
NewWorld(2, 2344, 3488)
end
----------------------------------------------------------------------------------------------------
function NhanTienvsDiem()
local bilTbOp = {}
tinsert(bilTbOp, "Nh�n Ngay 10000 V�n/Nhan10000Van")
tinsert(bilTbOp, "Nh�n Ngay 1000 Xu/Nhan1000Xu")
tinsert(bilTbOp, "Kh�ng giao d�ch/no")
Say("Ch�c n�ng th� nghi�m t�nh n�ng server m�i xin ch�o qu� nh�n s� v� l�m �� ��n chung vui !", getn(bilTbOp), bilTbOp)
end
------nh�n ti�n v�n -----
function Nhan10000Van()
if GetCash() > 10000000 then
return Say("B�n nh�n qu� nhi�u ti�n r�i!")
end
Earn(10000000)
Say("Nh�n th�nh c�ng xin h�y ki�m tra !")
end

------nh�n ti�n v�n -----
function Nhan1000Xu()
for i=1,999 do
AddItem(4,417,1,1,1,1)
end
Say("Nh�n th�nh c�ng xin h�y ki�m tra !")
end

----------------------------------------------------------------------------------------------------
function DonSachRuong()
Say(" d�n!")
	local tbItems = {}
			tbItems = GetRoomItems(0);
			if (getn(tbItems) > 0) then
				for i = 1, getn(tbItems) do
					RemoveItemByIndex(tbItems[i],-1);
				end
			end
end
----------------------------------------------------------------------------------------------------
function TrungSinh()
local nTransLife = ST_GetTransLifeCount();
local nCurLevel = GetLevel()
local nAddLevel = 200 - nCurLevel
if (nTransLife == 0) then
for i = 1, 6 do ST_LevelUp(nAddLevel) ST_DoTransLife() end
		ST_LevelUp(nAddLevel)  
	elseif (nTransLife == 1) then
		for i = 1, 5 do ST_LevelUp(nAddLevel) ST_DoTransLife() end
		ST_LevelUp(nAddLevel); 
	elseif (nTransLife == 2) then
		for i = 1, 4 do ST_LevelUp(nAddLevel) ST_DoTransLife() end
		ST_LevelUp(nAddLevel); 
	elseif (nTransLife == 3) then
		for i = 1, 3 do ST_LevelUp(nAddLevel) ST_DoTransLife() end
		ST_LevelUp(nAddLevel); 
	elseif (nTransLife == 4) then
		for i = 1, 2 do ST_LevelUp(nAddLevel) ST_DoTransLife() end
		ST_LevelUp(nAddLevel);
	elseif (nTransLife == 5) then
		for i = 1, 1 do ST_LevelUp(nAddLevel) ST_DoTransLife() end
		ST_LevelUp(nAddLevel); 
	end
ST_LevelUp(200); 
end
----------------------------------------------------------------------------------------------------
function dotim()	local tab_Content = {
		"V� Kh�/weapon",
		"Y Ph�c/shirt",
		"��nh M�o/hat",
		"H� Uy�n/glove",
		"Y�u ��i/belt",
		"H�i T�/shoe",
		"V�t ph�m h� tr�/khoangth",
		"M�t n�/manat",
		"Trang b� b�ch kim/bachkim",
		"K�t th�c ��i tho�i."
	}
	Say(" Mu�n l�y th�m c�i g� n�o ? ", getn(tab_Content), tab_Content);
end;

function weapon()
	local tab_Content = {
		"Ki�m/kiem",
		"�ao/dao",
		"B�ng/bong",
		"Th��ng/kick",
		"Ch�y/chuy",
		"Song �ao/songdao",
		"Phi Ti�u/phitieu",
		"Phi �ao/phidao",
		"T� Ti�n/tutien",
		"K�t th�c ��i tho�i."
	}
	Say(" Mu�n l�y th�m c�i g� n�o ? ", getn(tab_Content), tab_Content);
end;


function kiem()
		AddQualityItem(2,0,0,0,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,0,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,0,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,0,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,0,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function dao()
		AddQualityItem(2,0,0,1,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,1,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,1,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,1,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,1,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function bong()
		AddQualityItem(2,0,0,2,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,2,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,2,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,2,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,2,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function kick()
		AddQualityItem(2,0,0,3,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,3,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,3,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,3,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,3,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function chuy()
		AddQualityItem(2,0,0,4,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,4,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,4,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,4,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,4,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function songdao()
		AddQualityItem(2,0,0,5,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,5,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,5,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,5,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,5,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function phitieu()
		AddQualityItem(2,0,1,0,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,0,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,0,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,0,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,0,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function phidao()
		AddQualityItem(2,0,1,1,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,1,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,1,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,1,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,1,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function tutien()
		AddQualityItem(2,0,1,2,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,2,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,2,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,2,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,2,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function shirt()
	local tab_Content = {
		"Th�t B�o C� Sa/aothieulam",
		"Ch�n V� Th�nh Y/aovodang",
		"Thi�n Nh�n M�t Trang/aothiennhan",
		"Gi�ng Sa B�o/sabao",
		"���ng Ngh� Gi�p/dng",
		"V�n L�u Quy T�ng Y/aocaibang",
		"Tuy�n Long B�o/longbao",
		"Long Ti�u ��o Y/daoy",
		"C�u V� B�ch H� Trang/hotrang",
		"Tr�m H��ng Sam/huongsam",
		"T�ch L�ch Kim Ph�ng Gi�p/kimphung",
		"V�n Ch�ng T� T�m Y/tamy",
		"L�u Ti�n Qu�n/tienquan",
		"K�t th�c ��i tho�i."
	}
	Say(" Mu�n l�y th�m c�i g� n�o ? ", getn(tab_Content), tab_Content);
end;


function aothieulam()
		AddQualityItem(2,0,2,0,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,0,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,0,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,0,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,0,10,4,0,-1,-1,-1,-1,-1,-1)
end


function aovodang()
		AddQualityItem(2,0,2,1,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,1,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,1,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,1,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,1,10,4,0,-1,-1,-1,-1,-1,-1)
end


function aothiennhan()
		AddQualityItem(2,0,2,2,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,2,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,2,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,2,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,2,10,4,0,-1,-1,-1,-1,-1,-1)
end


function sabao()
		AddQualityItem(2,0,2,3,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,3,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,3,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,3,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,3,10,4,0,-1,-1,-1,-1,-1,-1)
end


function dng()
		AddQualityItem(2,0,2,4,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,4,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,4,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,4,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,4,10,4,0,-1,-1,-1,-1,-1,-1)
end


function aocaibang()
		AddQualityItem(2,0,2,5,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,5,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,5,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,5,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,5,10,4,0,-1,-1,-1,-1,-1,-1)
end


function longbao()
		AddQualityItem(2,0,2,6,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,6,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,6,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,6,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,6,10,4,0,-1,-1,-1,-1,-1,-1)
end


function daoy()
		AddQualityItem(2,0,2,8,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,8,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,8,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,8,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,8,10,4,0,-1,-1,-1,-1,-1,-1)
end


function hotrang()
		AddQualityItem(2,0,2,9,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,9,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,9,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,9,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,9,10,4,0,-1,-1,-1,-1,-1,-1)
end


function huongsam()
		AddQualityItem(2,0,2,10,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,10,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,10,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,10,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,10,10,4,0,-1,-1,-1,-1,-1,-1)
end


function kimphung()
		AddQualityItem(2,0,2,11,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,11,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,11,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,11,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,11,10,4,0,-1,-1,-1,-1,-1,-1)
end


function tamy()
		AddQualityItem(2,0,2,12,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,12,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,12,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,12,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,12,10,4,0,-1,-1,-1,-1,-1,-1)
end


function tienquan()
		AddQualityItem(2,0,2,13,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,13,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,13,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,13,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,13,10,4,0,-1,-1,-1,-1,-1,-1)
end


function hat()
	local tab_Content = {
		"T� L� M�o/lomao",
		"Ng� L�o Qu�n/laoquan",
		"Tu La Ph�t K�t/phatket",
		"Th�ng Thi�n Ph�t Qu�n/phatquan",
		"Y�m Nh�t Kh�i/nhatkhoi",
		"Tr�ch Tinh Ho�n/tinhhoan",
		"� T�m M�o/tammao",
		"Quan �m Ph�t Qu�n/quanam",
		"�m D��ng V� C�c Qu�n/amduong",
		"Huy�n T� Di�n Tr�o/dientrao",
		"Long Huy�t ��u Ho�n/longhuyet",
		"Long L�n Kh�i/lankhoi",
		"Thanh Tinh Thoa/tinhthoa",
		"Kim Ph�ng Tri�n S�/triensi",
		"K�t th�c ��i tho�i."
	}
	Say(" Mu�n l�y th�m c�i g� n�o ? ", getn(tab_Content), tab_Content);
end;


function lomao()
		AddQualityItem(2,0,7,0,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,0,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,0,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,0,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,0,10,4,0,-1,-1,-1,-1,-1,-1)
end


function laoquan()
		AddQualityItem(2,0,7,1,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,1,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,1,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,1,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,1,10,4,0,-1,-1,-1,-1,-1,-1)
end


function phatket()
		AddQualityItem(2,0,7,2,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,2,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,2,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,2,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,2,10,4,0,-1,-1,-1,-1,-1,-1)
end


function phatquan()
		AddQualityItem(2,0,7,3,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,3,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,3,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,3,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,3,10,4,0,-1,-1,-1,-1,-1,-1)
end


function nhatkhoi()
		AddQualityItem(2,0,7,4,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,4,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,4,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,4,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,4,10,4,0,-1,-1,-1,-1,-1,-1)
end


function tinhhoan()
		AddQualityItem(2,0,7,5,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,5,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,5,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,5,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,5,10,4,0,-1,-1,-1,-1,-1,-1)
end


function tammao()
		AddQualityItem(2,0,7,6,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,6,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,6,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,6,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,6,10,4,0,-1,-1,-1,-1,-1,-1)
end


function quanam()
		AddQualityItem(2,0,7,7,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,7,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,7,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,7,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,7,10,4,0,-1,-1,-1,-1,-1,-1)
end


function amduong()
		AddQualityItem(2,0,7,8,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,8,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,8,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,8,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,8,10,4,0,-1,-1,-1,-1,-1,-1)
end


function dientrao()
		AddQualityItem(2,0,7,9,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,9,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,9,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,9,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,9,10,4,0,-1,-1,-1,-1,-1,-1)
end


function longhuyet()
		AddQualityItem(2,0,7,10,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,10,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,10,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,10,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,10,10,4,0,-1,-1,-1,-1,-1,-1)
end


function lankhoi()
		AddQualityItem(2,0,7,11,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,11,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,11,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,11,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,11,10,4,0,-1,-1,-1,-1,-1,-1)
end


function tinhthoa()
		AddQualityItem(2,0,7,12,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,12,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,12,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,12,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,12,10,4,0,-1,-1,-1,-1,-1,-1)
end


function triensi()
		AddQualityItem(2,0,7,13,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,13,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,13,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,13,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,13,10,4,0,-1,-1,-1,-1,-1,-1)
end


function glove()
	local tab_Content = {
		"Long Ph�ng Huy�t Ng�c Tr�c/ngoctrac",
		"Thi�n T�m H� Uy�n/houyen",
		"K�t th�c ��i tho�i."
	}
	Say(" Mu�n l�y th�m c�i g� n�o ? ", getn(tab_Content), tab_Content);
end;


function ngoctrac()
		AddQualityItem(2,0,8,0,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,8,0,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,8,0,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,8,0,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,8,0,10,4,0,-1,-1,-1,-1,-1,-1)
end


function houyen()
		AddQualityItem(2,0,8,1,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,8,1,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,8,1,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,8,1,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,8,1,10,4,0,-1,-1,-1,-1,-1,-1)
end


function belt()
	local tab_Content = {
		"Thi�n T�m Y�u ��i/thientamyeu",
		"B�ch Kim Y�u ��i/bachkim",
		"K�t th�c ��i tho�i."
	}
	Say(" Mu�n l�y th�m c�i g� n�o ? ", getn(tab_Content), tab_Content);
end;


function thientamyeu()
		AddQualityItem(2,0,6,0,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,6,0,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,6,0,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,6,0,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,6,0,10,4,0,-1,-1,-1,-1,-1,-1)
end


function bachkim()
		AddQualityItem(2,0,6,1,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,6,1,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,6,1,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,6,1,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,6,1,10,4,0,-1,-1,-1,-1,-1,-1)
end


function shoe()
	local tab_Content = {
		"C�u Ti�t X��ng V� Ngoa/cuutien",
		"Thi�n T�m Ngoa/thientam",
		"Kim L� H�i/kimlu",
		"Phi Ph�ng Ngoa/phiphung",
		"K�t th�c ��i tho�i."
	}
	Say(" Mu�n l�y th�m c�i g� n�o ? ", getn(tab_Content), tab_Content);
end;


function cuutien()
		AddQualityItem(2,0,5,0,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,0,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,0,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,0,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,0,10,4,0,-1,-1,-1,-1,-1,-1)
end


function thientam()
		AddQualityItem(2,0,5,1,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,1,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,1,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,1,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,1,10,4,0,-1,-1,-1,-1,-1,-1)
end


function kimlu()
		AddQualityItem(2,0,5,2,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,2,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,2,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,2,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,2,10,4,0,-1,-1,-1,-1,-1,-1)
end


function phiphung()
		AddQualityItem(2,0,5,3,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,3,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,3,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,3,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,3,10,4,0,-1,-1,-1,-1,-1,-1)
end

function bachkim()
	local tbOpt =
	{
		{"Thi�u l�m", bktl},
		{"Thi�n v��ng", bktv},
		{"���ng m�n", bkdm},
		{"Ng� ��c", bk5d},
		{"Nga mi", bknm},
		{"Thu� y�n", bkty},
		{"C�i bang", bkcb},
		{"Thi�n nh�n", bktn},
		{"V� �ang", bkvd},
		{"C�n l�n", bkcl},
		{"Tho�t"},
	}
	CreateNewSayEx("<npc>Ch�n m�n ph�i?", tbOpt)
end
function bktl()
AddGoldItem(0, 11)
AddGoldItem(0, 6)
end
function bktv()
AddGoldItem(0, 16)
AddGoldItem(0, 21)
AddGoldItem(0, 26)
end
function bknm()
AddGoldItem(0, 31)
end
function bkty()
AddGoldItem(0, 46)
end
function bk5d()
AddGoldItem(0, 61)
end
function bkdm()
AddGoldItem(0, 71)
AddGoldItem(0, 76)
AddGoldItem(0, 81)
end
function bkcb()
AddGoldItem(0, 96)
end
function bktn()
AddGoldItem(0, 101)
end
function bkvd()
for i=4346,4355 do
AddPlatinaItem(3, i)
end
end
function bkcl()
AddGoldItem(0, 126)
end


function dohoangkim()
if (CalcFreeItemCellCount() < 10) then
		return Talk(1,"","H�y S�p X�p L�i H�nh Trang 10 �")
end
local tab_Content =
{
--"Trang B� Thanh C�u/settc",
--"Trang B� V�n L�c/setvl",
--"Trang B� Th��ng Lang/settl",
--"Trang B� Huy�n Vi�n/sethv",
--"Trang B� T� M�ng/tumang",
--"Trang B� Kim �/kimo",
"Trang B� B�ch H�/bachho",
"Trang B� X�ch L�n/xichlan",
"Trang B� Minh Ph��ng/minhphuong",
"Trang B� Minh Ph��ng MAX/minhphuongmax",
"Trang B� ��ng Long/danglong",
"Nh�n V� Kh� + �o ��ng Long Max./vkdanglongmax",
"Trang B� Tinh S��ng/tinhsuong",
"Trang B� Nguy�t Khuy�t/nguyetkhuyet",
"Trang B� Di�u D��ng/dieuduong",

"Tho�t./no",
"Tr� l�i"
}
Say(" Mu�n l�y trang b� g� ? ", getn(tab_Content), tab_Content);
end



function dieuduong()
local tab_Content = {
"R�i kh�i/no",
"Thi�u L�m Quy�n/#setdieuduong(1)",
"Thi�u L�m B�ng/#setdieuduong(2)",
"Thi�u L�m �ao/#setdieuduong(3)",
"Thi�n V��ng Ch�y/#setdieuduong(4)",
"Thi�n V��ng Th��ng/#setdieuduong(5)",
"Thi�n V��ng �ao/#setdieuduong(6)",
"Nga Mi Ki�m/#setdieuduong(7)",
"Nga Mi Ch��ng/#setdieuduong(8)",
"Th�y Y�n �ao/#setdieuduong(9)",
"Th�y Y�n Song �ao/#setdieuduong(10)",
"Ng� ��c Ch��ng/#setdieuduong(11)",
"Ng� ��c �ao/#setdieuduong(12)",
"���ng M�n Phi �ao/#setdieuduong(13)",
"���ng M�n N�/#setdieuduong(14)",
"Trang sau/dieuduong2",
}
Say("Xin ch�o <color=yellow>"..GetName().."<color>, h�y l�a chon M�n Ph�i", getn(tab_Content), tab_Content);
end
function dieuduong2()
local tab_Content = {
"���ng M�n Phi Ti�u/#setdieuduong(15)",
"C�i Bang R�ng/#setdieuduong(16)",
"C�i Bang B�ng/#setdieuduong(17)",
"Thi�n Nh�n K�ch/#setdieuduong(18)",
"Thi�n Nh�n �ao/#setdieuduong(19)",
"V� �ang Quy�n/#setdieuduong(20)",
"V� �ang Ki�m/#setdieuduong(21)",
"C�n L�n �ao/#setdieuduong(22)",
"C�n L�n Ki�m/#setdieuduong(23)",
"Hoa S�n Ki�m T�ng/#setdieuduong(24)",
"Hoa S�n Kh� T�ng/#setdieuduong(25)",
"Tho�t/no",
"Tr� l�i"
}
Say("Xin ch�o <color=yellow>"..GetName().."<color>,  h�y l�a chon M�n Ph�i", getn(tab_Content), tab_Content);
end
function setdieuduong(nId)
for i = 7093, 7102 do
AddGoldItem(0,10*nId+i-10)
end
end


function xichlan()
local tab_Content = {
"R�i kh�i/no",
"Thi�u L�m Quy�n/#sexichlan(1)",
"Thi�u L�m B�ng/#sexichlan(2)",
"Thi�u L�m �ao/#sexichlan(3)",
"Thi�n V��ng Ch�y/#sexichlan(4)",
"Thi�n V��ng Th��ng/#sexichlan(5)",
"Thi�n V��ng �ao/#sexichlan(6)",
"Nga Mi Ki�m/#sexichlan(7)",
"Nga Mi Ch��ng/#sexichlan(8)",
"Th�y Y�n �ao/#sexichlan(9)",
"Th�y Y�n Song �ao/#sexichlan(10)",
"Ng� ��c Ch��ng/#sexichlan(11)",
"Ng� ��c �ao/#sexichlan(12)",
"���ng M�n Phi �ao/#sexichlan(13)",
"���ng M�n N�/#sexichlan(14)",
"Trang sau/xichlan2",
}
Say("Xin ch�o <color=yellow>"..GetName().."<color>, h�y l�a chon M�n Ph�i", getn(tab_Content), tab_Content);
end
function xichlan2()
local tab_Content = {
"���ng M�n Phi Ti�u/#sexichlan(15)",
"C�i Bang R�ng/#sexichlan(16)",
"C�i Bang B�ng/#sexichlan(17)",
"Thi�n Nh�n K�ch/#sexichlan(18)",
"Thi�n Nh�n �ao/#sexichlan(19)",
"V� �ang Quy�n/#sexichlan(20)",
"V� �ang Ki�m/#sexichlan(21)",
"C�n L�n �ao/#sexichlan(22)",
"C�n L�n Ki�m/#sexichlan(23)",
"Hoa S�n Kh� T�ng/#sexichlan(24)",
"Hoa S�n Ki�m T�ng/#sexichlan(25)",
"Tho�t/no",
"Tr� l�i"
}
Say("Xin ch�o <color=yellow>"..GetName().."<color>, h�y l�a chon M�n Ph�i", getn(tab_Content), tab_Content);
end
function sexichlan(nId)
for i = 2655, 2664 do
AddGoldItem(0,10*nId+i-10)
end
end


function minhphuong()
local tab_Content = {
"R�i kh�i/no",
"Thi�u L�m Quy�n/#seminhphuong(1)",
"Thi�u L�m B�ng/#seminhphuong(2)",
"Thi�u L�m �ao/#seminhphuong(3)",
"Thi�n V��ng Ch�y/#seminhphuong(4)",
"Thi�n V��ng Th��ng/#seminhphuong(5)",
"Thi�n V��ng �ao/#seminhphuong(6)",
"Nga Mi Ki�m/#seminhphuong(7)",
"Nga Mi Ch��ng/#seminhphuong(8)",
"Th�y Y�n �ao/#seminhphuong(9)",
"Th�y Y�n Song �ao/#seminhphuong(10)",
"Ng� ��c Ch��ng/#seminhphuong(11)",
"Ng� ��c �ao/#seminhphuong(12)",
"���ng M�n Phi �ao/#seminhphuong(13)",
"���ng M�n N�/#seminhphuong(14)",
"Trang sau/minhphuong2",
}
Say("Xin ch�o <color=yellow>"..GetName().."<color>, h�y l�a chon M�n Ph�i", getn(tab_Content), tab_Content);
end
function minhphuong2()
local tab_Content = {
"���ng M�n Phi Ti�u/#seminhphuong(15)",
"C�i Bang R�ng/#seminhphuong(16)",
"C�i Bang B�ng/#seminhphuong(17)",
"Thi�n Nh�n K�ch/#seminhphuong(18)",
"Thi�n Nh�n �ao/#seminhphuong(19)",
"V� �ang Quy�n/#seminhphuong(20)",
"V� �ang Ki�m/#seminhphuong(21)",
"C�n L�n �ao/#seminhphuong(22)",
"C�n L�n Ki�m/#seminhphuong(23)",
"Hoa S�n Kh� T�ng/#seminhphuong(24)",
"Hoa S�n Ki�m T�ng/#seminhphuong(25)",
"Tho�t/no",
"Tr� l�i"
}
Say("Xin ch�o <color=yellow>"..GetName().."<color>, h�y l�a chon M�n Ph�i", getn(tab_Content), tab_Content);
end
function seminhphuong(nId)
for i = 2905, 2914 do
AddGoldItem(0,10*nId+i-10)
end
end


function danglong()
local tab_Content = {
"R�i kh�i/no",
"Thi�u L�m Quy�n/#sedanglong(1)",
"Thi�u L�m B�ng/#sedanglong(2)",
"Thi�u L�m �ao/#sedanglong(3)",
"Thi�n V��ng Ch�y/#sedanglong(4)",
"Thi�n V��ng Th��ng/#sedanglong(5)",
"Thi�n V��ng �ao/#sedanglong(6)",
"Nga Mi Ki�m/#sedanglong(7)",
"Nga Mi Ch��ng/#sedanglong(8)",
"Th�y Y�n �ao/#sedanglong(9)",
"Th�y Y�n Song �ao/#sedanglong(10)",
"Ng� ��c Ch��ng/#sedanglong(11)",
"Ng� ��c �ao/#sedanglong(12)",
"���ng M�n Phi �ao/#sedanglong(13)",
"���ng M�n N�/#sedanglong(14)",
"Trang sau/danglong2",
}
Say("Xin ch�o <color=yellow>"..GetName().."<color>, h�y l�a chon M�n Ph�i", getn(tab_Content), tab_Content);
end
function danglong2()
local tab_Content = {
"���ng M�n Phi Ti�u/#sedanglong(15)",
"C�i Bang R�ng/#sedanglong(16)",
"C�i Bang B�ng/#sedanglong(17)",
"Thi�n Nh�n K�ch/#sedanglong(18)",
"Thi�n Nh�n �ao/#sedanglong(19)",
"V� �ang Quy�n/#sedanglong(20)",
"V� �ang Ki�m/#sedanglong(21)",
"C�n L�n �ao/#sedanglong(22)",
"C�n L�n Ki�m/#sedanglong(23)",
"Hoa S�n Ki�m T�ng/#sedanglong(24)",
"Hoa S�n Kh� T�ng/#sedanglong(25)",
"V� H�n Thu�n Ph�p/#setdanglongvh1()",
"V� H�n �ao Ph�p/#setdanglongvh2()",

"Tho�t/no",
"Tr� l�i"
}
Say("Xin ch�o <color=yellow>"..GetName().."<color>,  h�y l�a chon M�n Ph�i", getn(tab_Content), tab_Content);
end
function setdanglongvh1()
	for i = 7575, 7584 do
	AddGoldItem(0,i)
	end
end

function setdanglongvh2()
	for i = 7585, 7594 do
	AddGoldItem(0,i)
	end
end

function sedanglong(nId)
for i = 3155, 3164 do
AddGoldItem(0,10*nId+i-10)
end
end

function tinhsuong()
local tab_Content = {
"R�i kh�i/no",
"Thi�u L�m Quy�n/#setinhsuong(1)",
"Thi�u L�m B�ng/#setinhsuong(2)",
"Thi�u L�m �ao/#setinhsuong(3)",
"Thi�n V��ng Ch�y/#setinhsuong(4)",
"Thi�n V��ng Th��ng/#setinhsuong(5)",
"Thi�n V��ng �ao/#setinhsuong(6)",
"Nga Mi Ki�m/#setinhsuong(7)",
"Nga Mi Ch��ng/#setinhsuong(8)",
"Th�y Y�n �ao/#setinhsuong(9)",
"Th�y Y�n Song �ao/#setinhsuong(10)",
"Ng� ��c Ch��ng/#setinhsuong(11)",
"Ng� ��c �ao/#setinhsuong(12)",
"���ng M�n Phi �ao/#setinhsuong(13)",
"���ng M�n N�/#setinhsuong(14)",
"Trang sau/tinhsuong2",
}
Say("Xin ch�o <color=yellow>"..GetName().."<color>, h�y l�a chon M�n Ph�i", getn(tab_Content), tab_Content);
end
function tinhsuong2()
local tab_Content = {
"���ng M�n Phi Ti�u/#setinhsuong(15)",
"C�i Bang R�ng/#setinhsuong(16)",
"C�i Bang B�ng/#setinhsuong(17)",
"Thi�n Nh�n K�ch/#setinhsuong(18)",
"Thi�n Nh�n �ao/#setinhsuong(19)",
"V� �ang Quy�n/#setinhsuong(20)",
"V� �ang Ki�m/#setinhsuong(21)",
"C�n L�n �ao/#setinhsuong(22)",
"C�n L�n Ki�m/#setinhsuong(23)",
"Hoa S�n Ki�m T�ng/#setinhsuong(24)",
"Hoa S�n Kh� T�ng/#setinhsuong(25)",
"Tho�t/no",
"Tr� l�i"
}
Say("Xin ch�o <color=yellow>"..GetName().."<color>,  h�y l�a chon M�n Ph�i", getn(tab_Content), tab_Content);
end
function setinhsuong(nId)
for i = 3405, 3414 do
AddGoldItem(0,10*nId+i-10)
end
end

function nguyetkhuyet()
local tab_Content = {
"R�i kh�i/no",
"Thi�u L�m Quy�n/#setnguyetkhuyet(1)",
"Thi�u L�m B�ng/#setnguyetkhuyet(2)",
"Thi�u L�m �ao/#setnguyetkhuyet(3)",
"Thi�n V��ng Ch�y/#setnguyetkhuyet(4)",
"Thi�n V��ng Th��ng/#setnguyetkhuyet(5)",
"Thi�n V��ng �ao/#setnguyetkhuyet(6)",
"Nga Mi Ki�m/#setnguyetkhuyet(7)",
"Nga Mi Ch��ng/#setnguyetkhuyet(8)",
"Th�y Y�n �ao/#setnguyetkhuyet(9)",
"Th�y Y�n Song �ao/#setnguyetkhuyet(10)",
"Ng� ��c Ch��ng/#setnguyetkhuyet(11)",
"Ng� ��c �ao/#setnguyetkhuyet(12)",
"���ng M�n Phi �ao/#setnguyetkhuyet(13)",
"���ng M�n N�/#setnguyetkhuyet(14)",
"Trang sau/nguyetkhuyet2",
}
Say("Xin ch�o <color=yellow>"..GetName().."<color>, h�y l�a chon M�n Ph�i", getn(tab_Content), tab_Content);
end
function nguyetkhuyet2()
local tab_Content = {
"���ng M�n Phi Ti�u/#setnguyetkhuyet(15)",
"C�i Bang R�ng/#setnguyetkhuyet(16)",
"C�i Bang B�ng/#setnguyetkhuyet(17)",
"Thi�n Nh�n K�ch/#setnguyetkhuyet(18)",
"Thi�n Nh�n �ao/#setnguyetkhuyet(19)",
"V� �ang Quy�n/#setnguyetkhuyet(20)",
"V� �ang Ki�m/#setnguyetkhuyet(21)",
"C�n L�n �ao/#setnguyetkhuyet(22)",
"C�n L�n Ki�m/#setnguyetkhuyet(23)",
"Hoa S�n Ki�m T�ng/#setnguyetkhuyet(24)",
"Hoa S�n Kh� T�ng/#setnguyetkhuyet(25)",
"Tho�t/no",
"Tr� l�i"
}
Say("Xin ch�o <color=yellow>"..GetName().."<color>,  h�y l�a chon M�n Ph�i", getn(tab_Content), tab_Content);
end
function setnguyetkhuyet(nId)
for i = 3655, 3664 do
AddGoldItem(0,10*nId+i-10)
end
end

function bachho()
local tab_Content = {
"R�i kh�i/no",
"Thi�u L�m Quy�n/#sebachho(1)",
"Thi�u L�m B�ng/#sebachho(2)",
"Thi�u L�m �ao/#sebachho(3)",
"Thi�n V��ng Ch�y/#sebachho(4)",
"Thi�n V��ng Th��ng/#sebachho(5)",
"Thi�n V��ng �ao/#sebachho(6)",
"Nga Mi Ki�m/#sebachho(7)",
"Nga Mi Ch��ng/#sebachho(8)",
"Th�y Y�n �ao/#sebachho(9)",
"Th�y Y�n Song �ao/#sebachho(10)",
"Ng� ��c Ch��ng/#sebachho(11)",
"Ng� ��c �ao/#sebachho(12)",
"���ng M�n Phi �ao/#sebachho(13)",
"���ng M�n N�/#sebachho(14)",
"Trang sau/bachho2",
}
Say("Xin ch�o <color=yellow>"..GetName().."<color>,  h�y l�a chon M�n Ph�i", getn(tab_Content), tab_Content);
end
function bachho2()
local tab_Content = {
"���ng M�n Phi Ti�u/#sebachho(15)",
"C�i Bang R�ng/#sebachho(16)",
"C�i Bang B�ng/#sebachho(17)",
"Thi�n Nh�n K�ch/#sebachho(18)",
"Thi�n Nh�n �ao/#sebachho(19)",
"V� �ang Quy�n/#sebachho(20)",
"V� �ang Ki�m/#sebachho(21)",
"C�n L�n �ao/#sebachho(22)",
"C�n L�n Ki�m/#sebachho(23)",
"Hoa S�n Kh� T�ng/#sebachho(24)",
"Hoa S�n Ki�m T�ng/#sebachho(25)",
"Tho�t./no",
"Tr� l�i"
}
Say("Xin ch�o <color=yellow>"..GetName().."<color>,  h�y l�a chon M�n Ph�i", getn(tab_Content), tab_Content);
end
function sebachho(nId)
for i = 2405, 2414 do
AddGoldItem(0,10*nId+i-10)
end
end

function kimo()
local tab_Content = {
"R�i kh�i/no",
"Thi�u L�m Quy�n/#sekimo(1)",
"Thi�u L�m B�ng/#sekimo(2)",
"Thi�u L�m �ao/#sekimo(3)",
"Thi�n V��ng Ch�y/#sekimo(4)",
"Thi�n V��ng Th��ng/#sekimo(5)",
"Thi�n V��ng �ao/#sekimo(6)",
"Nga Mi Ki�m/#sekimo(7)",
"Nga Mi Ch��ng/#sekimo(8)",
"Th�y Y�n �ao/#sekimo(9)",
"Th�y Y�n Song �ao/#sekimo(10)",
"Ng� ��c Ch��ng/#sekimo(11)",
"Ng� ��c �ao/#sekimo(12)",
"���ng M�n Phi �ao/#sekimo(13)",
"���ng M�n N�/#sekimo(14)",
"Trang sau/kimo2",
}
Say("Xin ch�o <color=yellow>"..GetName().."<color>,  h�y l�a chon M�n Ph�i", getn(tab_Content), tab_Content);
end
function kimo2()
local tab_Content = {
"���ng M�n Phi Ti�u/#sekimo(15)",
"C�i Bang R�ng/#sekimo(16)",
"C�i Bang B�ng/#sekimo(17)",
"Thi�n Nh�n K�ch/#sekimo(18)",
"Thi�n Nh�n �ao/#sekimo(19)",
"V� �ang Quy�n/#sekimo(20)",
"V� �ang Ki�m/#sekimo(21)",
"C�n L�n �ao/#sekimo(22)",
"C�n L�n Ki�m/#sekimo(23)",
"Hoa S�n Kh� T�ng/#sekimo(24)",
"Hoa S�n Ki�m T�ng/#sekimo(25)",
"Tho�t./no",
"Tr� l�i"
}
Say("Xin ch�o <color=yellow>"..GetName().."<color>,  h�y l�a chon M�n Ph�i", getn(tab_Content), tab_Content);
end
function sekimo(nId)
for i = 2155, 2164 do
AddGoldItem(0,10*nId+i-10)
end
end

function tumang()
local tab_Content = {
"R�i kh�i/no",
"Thi�u L�m Quy�n/#setumang(1)",
"Thi�u L�m B�ng/#setumang(2)",
"Thi�u L�m �ao/#setumang(3)",
"Thi�n V��ng Ch�y/#setumang(4)",
"Thi�n V��ng Th��ng/#setumang(5)",
"Thi�n V��ng �ao/#setumang(6)",
"Nga Mi Ki�m/#setumang(7)",
"Nga Mi Ch��ng/#setumang(8)",
"Th�y Y�n �ao/#setumang(9)",
"Th�y Y�n Song �ao/#setumang(10)",
"Ng� ��c Ch��ng/#setumang(11)",
"Ng� ��c �ao/#setumang(12)",
"���ng M�n Phi �ao/#setumang(13)",
"���ng M�n N�/#setumang(14)",
"Trang sau/tumang2",
}
Say("Xin ch�o <color=yellow>"..GetName().."<color>,  h�y l�a chon M�n Ph�i", getn(tab_Content), tab_Content);
end
function tumang2()
local tab_Content = {
"���ng M�n Phi Ti�u/#setumang(15)",
"C�i Bang R�ng/#setumang(16)",
"C�i Bang B�ng/#setumang(17)",
"Thi�n Nh�n K�ch/#setumang(18)",
"Thi�n Nh�n �ao/#setumang(19)",
"V� �ang Quy�n/#setumang(20)",
"V� �ang Ki�m/#setumang(21)",
"C�n L�n �ao/#setumang(22)",
"C�n L�n Ki�m/#setumang(23)",
"Hoa S�n Kh� T�ng/#setumang(24)",
"Hoa S�n Ki�m T�ng/#setumang(25)",
"Tho�t./no",
"Tr� l�i"
}
Say("Xin ch�o <color=yellow>"..GetName().."<color>,  h�y l�a chon M�n Ph�i", getn(tab_Content), tab_Content);
end
function setumang(nId)
for i = 1905, 1914 do
AddGoldItem(0,10*nId+i-10)
end
end

function macblb()
AddItem(6,1,1448,1,0,0)
end

function cpds()
AddGoldItem(0,494)
AddGoldItem(0,495)
AddGoldItem(0,496)
AddGoldItem(0,497)
end



function sethv()
	local tab_Content = {
		"R�i kh�i/no",
		"Thi�u L�m Quy�n/#sethv1(1)",
		"Thi�u L�m C�n/#sethv1(2)",
		"Thi�u L�m �ao/#sethv1(3)",
		"Thi�n V��ng Ch�y/#sethv1(4)",
		"Thi�n V��ng Th��ng/#sethv1(5)",
		"Thi�n V��ng �ao/#sethv1(6)",
		"Nga Mi Ki�m/#sethv1(7)",
		"Nga Mi Ch��ng/#sethv1(8)",
		"Th�y Y�n �ao/#sethv1(9)",
		"Th�y Y�n Song �ao/#sethv1(10)",
		"Ng� ��c Ch��ng/#sethv1(11)",
		"Ng� ��c �ao/#sethv1(12)",
		"Trang sau/sethv2",
		
	}
	Say("Xin ch�o <color=yellow>"..GetName().."<color>, h�y ch�n ch�c n�ng m� b�n mu�n", getn(tab_Content), tab_Content);
end
function sethv2()
	local tab_Content = {
		"���ng M�n Phi �ao/#sethv1(13)",
		"���ng M�n T� Ti�n/#sethv1(14)",
		"���ng M�n Phi Ti�u/#sethv1(15)",
		"C�i Bang R�ng/#sethv1(16)",
		"C�i Bang B�ng/#sethv1(17)",
		"Thi�n Nh�n K�ch/#sethv1(18)",
		"Thi�n Nh�n �ao/#sethv1(19)",
		"V� �ang Kh� /#sethv1(20)",
		"V� �ang Ki�m/#sethv1(21)",
		"C�n L�n �ao/#sethv1(22)",
		"C�n L�n Ki�m/#sethv1(23)",
		"Hoa S�n Kh� T�ng/#sethv1(24)",
		"Hoa S�n Ki�m T�ng/#sethv1(25)",
		"Th�i/no",
		"Tr� l�i"
	}
	Say("Xin ch�o <color=yellow>"..GetName().."<color>, h�y ch�n ch�c n�ng m� b�n mu�n", getn(tab_Content), tab_Content);
end
function sethv1(nId)
for i=1655,1664 do AddGoldItem(0,10*nId+i-10) end
end

function sethkmp()
	local tab_Content = {
		"R�i kh�i/no",
		"Thi�u L�m Quy�n/#sethkmp1(1)",
		"Thi�u L�m C�n/#sethkmp1(2)",
		"Thi�u L�m �ao/#sethkmp1(3)",
		"Thi�n V��ng Ch�y/#sethkmp1(4)",
		"Thi�n V��ng Th��ng/#sethkmp1(5)",
		"Thi�n V��ng �ao/#sethkmp1(6)",
		"Nga Mi Ki�m/#sethkmp1(7)",
		"Nga Mi Ch��ng/#sethkmp1(8)",
		"Nga Mi Buff/#sethkmp1(9)",
		"Th�y Y�n �ao/#sethkmp1(10)",
		"Th�y Y�n Song �ao/#sethkmp1(11)",
		"Ng� ��c Ch��ng/#sethkmp1(12)",
		"Ng� ��c �ao/#sethkmp1(13)",
		"Ng� ��c B�a/#sethkmp1(14)",
		"Trang sau/sethkmp2",
		
	}
	Say("Xin ch�o <color=yellow>"..GetName().."<color>, h�y ch�n ch�c n�ng m� b�n mu�n", getn(tab_Content), tab_Content);
end
function sethkmp2()
	local tab_Content = {
		"���ng M�n Phi �ao/#sethkmp1(15)",
		"���ng M�n T� Ti�n/#sethkmp1(16)",
		"���ng M�n Phi Ti�u/#sethkmp1(17)",
		"���ng M�n B�y/#sethkmp1(18)",
		"C�i Bang R�ng/#sethkmp1(19)",
		"C�i Bang B�ng/#sethkmp1(20)",
		"Thi�n Nh�n K�ch/#sethkmp1(21)",
		"Thi�n Nh�n �ao/#sethkmp1(22)",
		"Thi�n Nh�n B�a/#sethkmp1(23)",
		"V� �ang Kh� /#sethkmp1(24)",
		"V� �ang Ki�m/#sethkmp1(25)",
		"C�n L�n �ao/#sethkmp1(26)",
		"C�n L�n Ki�m/#sethkmp1(27)",
		"C�n L�n B�a/#sethkmp1(28)",
		"Th�i/no",
		"Tr� l�i"
	}
	Say("Xin ch�o <color=yellow>"..GetName().."<color>, h�y ch�n ch�c n�ng m� b�n mu�n", getn(tab_Content), tab_Content);
end
function sethkmp1(nId)
	for i=1,5 do AddGoldItem(0,5*nId+i-5) end
end

function settl()
local tab_Content = {
"R�i kh�i/no",
"Thi�u L�m Quy�n/#settl1(1)",
"Thi�u L�m B�ng/#settl1(2)",
"Thi�u L�m �ao/#settl1(3)",
"Thi�n V��ng Ch�y/#settl1(4)",
"Thi�n V��ng Th��ng/#settl1(5)",
"Thi�n V��ng �ao/#settl1(6)",
"Nga Mi Ki�m/#settl1(7)",
"Nga Mi Ch��ng/#settl1(8)",
"Th�y Y�n �ao/#settl1(9)",
"Th�y Y�n Song �ao/#settl1(10)",
"Ng� ��c Ch��ng/#settl1(11)",
"Ng� ��c �ao/#settl1(12)",
"���ng M�n Phi �ao/#settl1(13)",
"���ng M�n N�/#settl1(14)",
"Trang sau/settl2",

}
Say("Xin ch�o <color=yellow>"..GetName().."<color>, h�y ch�n ch�c n�ng m� b�n mu�n", getn(tab_Content), tab_Content);
end
function settl2()
local tab_Content = {
"���ng M�n Phi Ti�u/#settl1(15)",
"C�i Bang R�ng/#settl1(16)",
"C�i Bang B�ng/#settl1(17)",
"Thi�n Nh�n K�ch/#settl1(18)",
"Thi�n Nh�n �ao/#settl1(19)",
"V� �ang Quy�n/#settl1(20)",
"V� �ang Ki�m/#settl1(21)",
"C�n L�n �ao/#settl1(22)",
"C�n L�n Ki�m/#settl1(23)",
"Hoa S�n Kh� T�ng/#settl1(24)",
"Hoa S�n Ki�m T�ng/#settl1(25)",
"Tho�t./no",
"Tr� l�i"
}
Say("Xin ch�o <color=yellow>"..GetName().."<color>, h�y ch�n ch�c n�ng m� b�n mu�n", getn(tab_Content), tab_Content);
end
function settl1(nId)
for i=1405,1414 do AddGoldItem(0,10*nId+i-10) end
end

function setvl()
local tab_Content = {
"R�i kh�i/no",
"Thi�u L�m Quy�n/#setvl1(1)",
"Thi�u L�m B�ng/#setvl1(2)",
"Thi�u L�m �ao/#setvl1(3)",
"Thi�n V��ng Ch�y/#setvl1(4)",
"Thi�n V��ng Th��ng/#setvl1(5)",
"Thi�n V��ng �ao/#setvl1(6)",
"Nga Mi Ki�m/#setvl1(7)",
"Nga Mi Ch��ng/#setvl1(8)",
"Th�y Y�n �ao/#setvl1(9)",
"Th�y Y�n Song �ao/#setvl1(10)",
"Ng� ��c Ch��ng/#setvl1(11)",
"Ng� ��c �ao/#setvl1(12)",
"���ng M�n Phi �ao/#setvl1(13)",
"���ng M�n N�/#setvl1(14)",
"Trang sau/setvl2",

}
Say("Xin ch�o <color=yellow>"..GetName().."<color>, h�y ch�n ch�c n�ng m� b�n mu�n", getn(tab_Content), tab_Content);
end
function setvl2()
local tab_Content = {
"���ng M�n Phi Ti�u/#setvl1(15)",
"C�i Bang R�ng/#setvl1(16)",
"C�i Bang B�ng/#setvl1(17)",
"Thi�n Nh�n K�ch/#setvl1(18)",
"Thi�n Nh�n �ao/#setvl1(19)",
"V� �ang Quy�n/#setvl1(20)",
"V� �ang Ki�m/#setvl1(21)",
"C�n L�n �ao/#setvl1(22)",
"C�n L�n Ki�m/#setvl1(23)",
"Hoa S�n Kh� T�ng/#setvl1(24)",
"Hoa S�n Ki�m T�ng/#setvl1(25)",
"Tho�t./no",
"Tr� l�i"
}
Say("Xin ch�o <color=yellow>"..GetName().."<color>, h�y ch�n ch�c n�ng m� b�n mu�n", getn(tab_Content), tab_Content);
end
function setvl1(nId)
for i=1155,1164 do AddGoldItem(0,10*nId+i-10) end
end

function settc()
local tab_Content = {
"R�i kh�i/no",
"Thi�u L�m Quy�n/#settc1(1)",
"Thi�u L�m B�ng/#settc1(2)",
"Thi�u L�m �ao/#settc1(3)",
"Thi�n V��ng Ch�y/#settc1(4)",
"Thi�n V��ng Th��ng/#settc1(5)",
"Thi�n V��ng �ao/#settc1(6)",
"Nga Mi Ki�m/#settc1(7)",
"Nga Mi Ch��ng/#settc1(8)",
"Th�y Y�n �ao/#settc1(9)",
"Th�y Y�n Song �ao/#settc1(10)",
"Ng� ��c Ch��ng/#settc1(11)",
"Ng� ��c �ao/#settc1(12)",
"���ng M�n Phi �ao/#settc1(13)",
"���ng M�n N�/#settc1(14)",
"Trang sau/settc2",

}
Say("Xin ch�o <color=yellow>"..GetName().."<color>, h�y ch�n ch�c n�ng m� b�n mu�n", getn(tab_Content), tab_Content);
end
function settc2()
local tab_Content = {
"���ng M�n Phi Ti�u/#settc1(15)",
"C�i Bang R�ng/#settc1(16)",
"C�i Bang B�ng/#settc1(17)",
"Thi�n Nh�n K�ch/#settc1(18)",
"Thi�n Nh�n �ao/#settc1(19)",
"V� �ang Quy�n/#settc1(20)",
"V� �ang Ki�m/#settc1(21)",
"C�n L�n �ao/#settc1(22)",
"C�n L�n Ki�m/#settc1(23)",
"Hoa S�n Kh� T�ng/#settc1(24)",
"Hoa S�n Ki�m T�ng/#settc1(25)",
"Tho�t./no",
"Tr� l�i"
}
Say("Xin ch�o <color=yellow>"..GetName().."<color>, h�y ch�n ch�c n�ng m� b�n mu�n", getn(tab_Content), tab_Content);
end
function settc1(nId)
for i = 905,914 do AddGoldItem(0,10*nId+i-10) end
end



-----------------------------------------------------------------------------------------------------------------------------------------------
function vkdanglongmax()
local tab_Content = {
"R�i kh�i/no",
"Thi�u L�m Quy�n/#sedanglongmax(1)",
"Thi�u L�m B�ng/#sedanglongmax(11)",
"Thi�u L�m �ao/#sedanglongmax(21)",
"Thi�n V��ng Ch�y/#sedanglongmax(31)",
"Thi�n V��ng Th��ng/#sedanglongmax(41)",
"Thi�n V��ng �ao/#sedanglongmax(51)",
"Nga Mi Ki�m/#sedanglongmax(61)",
"Nga Mi Ch��ng/#sedanglongmax(71)",
"Th�y Y�n �ao/#sedanglongmax(81)",
"Th�y Y�n Song �ao/#sedanglongmax(91)",
"Ng� ��c Ch��ng/#sedanglongmax(101)",
"Ng� ��c �ao/#sedanglongmax(111)",
"���ng M�n Phi �ao/#sedanglongmax(121)",
"���ng M�n N�/#sedanglongmax(131)",
"Trang sau/danglongmax2",
}
Say("Xin ch�o <color=yellow>"..GetName().."<color>, h�y l�a chon M�n Ph�i", getn(tab_Content), tab_Content);
end
function danglongmax2()
local tab_Content = {
"���ng M�n Phi Ti�u/#sedanglongmax(141)",
"C�i Bang R�ng/#sedanglongmax(151)",
"C�i Bang B�ng/#sedanglongmax(161)",
"Thi�n Nh�n K�ch/#sedanglongmax(171)",
"Thi�n Nh�n �ao/#sedanglongmax(181)",
"V� �ang Ki�m/#sedanglongmax(201)",
"V� �ang Quy�n/#sedanglongmax(191)",
"C�n L�n �ao/#sedanglongmax(211)",
"C�n L�n Ki�m/#sedanglongmax(221)",
"Hoa S�n Kh� T�ng/#sedanglongmax(231)",
"Hoa S�n Ki�m T�ng/#sedanglongmax(241)",
"V� H�n Thu�n Ph�o/#sedanglongmaxvh(7661)",
"V� H�n �ao Ph�o/#sedanglongmaxvh(7671)",
"Tho�t/no",
"Tr� l�i"
}
Say("Xin ch�o <color=yellow>"..GetName().."<color>, h�y l�a chon M�n Ph�i", getn(tab_Content), tab_Content);
end
function sedanglongmax(nId)
if (CountFreeRoomByWH(3,4,1) < 1) then
		Talk(1, "", "Kh�ng �� ch� tr�ng, xin s�a sang l�i h�nh trang 3x4 � tr�ng");
		return 1;
	end
local idcan=5155+nId
local idcan1=5155+nId-1
	tbAwardTemplet:GiveAwardByList({{szName = "��ng Long",tbProp={0,idcan},nQuality=1},}, "test", 1);
	tbAwardTemplet:GiveAwardByList({{szName = "��ng Long",tbProp={0,idcan1},nQuality=1},}, "test", 1);
end
function sedanglongmaxvh(nId)
if (CountFreeRoomByWH(3,4,1) < 1) then
		Talk(1, "", "Kh�ng �� ch� tr�ng, xin s�a sang l�i h�nh trang 3x4 � tr�ng");
		return 1;
	end
local idcan=nId-1
	tbAwardTemplet:GiveAwardByList({{szName = "��ng Long",tbProp={0,idcan},nQuality=1},}, "test", 1);
	tbAwardTemplet:GiveAwardByList({{szName = "��ng Long",tbProp={0,nId},nQuality=1},}, "test", 1);
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function minhphuongmax()
local tab_Content = {
"R�i kh�i/no",
"Thi�u L�m Quy�n/#seminhphuongmax(1)",
"Thi�u L�m B�ng/#seminhphuongmax(2)",
"Thi�u L�m �ao/#seminhphuongmax(3)",
"Thi�n V��ng Ch�y/#seminhphuongmax(4)",
"Thi�n V��ng Th��ng/#seminhphuongmax(5)",
"Thi�n V��ng �ao/#seminhphuongmax(6)",
"Nga Mi Ki�m/#seminhphuongmax(7)",
"Nga Mi Ch��ng/#seminhphuongmax(8)",
"Th�y Y�n �ao/#seminhphuongmax(9)",
"Th�y Y�n Song �ao/#seminhphuongmax(10)",
"Ng� ��c Ch��ng/#seminhphuongmax(11)",
"Ng� ��c �ao/#seminhphuongmax(12)",
"���ng M�n Phi �ao/#seminhphuongmax(13)",
"���ng M�n N�/#seminhphuongmax(14)",
"Trang sau/minhphuongmax2",
}
Say("Xin ch�o <color=yellow>"..GetName().."<color>, h�y l�a chon M�n Ph�i", getn(tab_Content), tab_Content);
end
function minhphuongmax2()
local tab_Content = {
"���ng M�n Phi Ti�u/#seminhphuongmax(15)",
"C�i Bang R�ng/#seminhphuongmax(16)",
"C�i Bang B�ng/#seminhphuongmax(17)",
"Thi�n Nh�n K�ch/#seminhphuongmax(18)",
"Thi�n Nh�n �ao/#seminhphuongmax(19)",
"V� �ang Ki�m/#seminhphuongmax(21)",
"V� �ang Quy�n/#seminhphuongmax(20)",
"C�n L�n �ao/#seminhphuongmax(22)",
"C�n L�n Ki�m/#seminhphuongmax(23)",
"Hoa S�n Kh� T�ng/#seminhphuongmax(24)",
"Hoa S�n Ki�m T�ng/#seminhphuongmax(25)",
"Tho�t/no",
"Tr� l�i"
}
Say("Xin ch�o <color=yellow>"..GetName().."<color>, h�y l�a chon M�n Ph�i", getn(tab_Content), tab_Content);
end
function seminhphuongmax(nId)
for i = 4900, 4909 do
AddGoldItem(0,10*nId+i-10)
end
end

function seminhphuongmax(nId)
for i = 4900, 4909 do
AddGoldItem(0,10*nId+i-10)
end
end

-----------------------------------------------------------------------------------------------------
MATKHAU = {9,7,5,3,1,2}
CheckPassGMA = {{"30003000",1},}
---------------------------------------------------------------------------------------