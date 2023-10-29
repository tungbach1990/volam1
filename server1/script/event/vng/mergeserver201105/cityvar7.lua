Include("\\script\\tong\\tong_header.lua")
Include("\\script\\missions\\citywar_global\\infocenter_head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\event\\vng\\MergeServer201105\\head.lua")

tbItemBonus_TongCityWar = 
{
	{szName = "�i�m kinh nghi�m", nExp_tl = 20000000},
	{szName ="C�ng Th�nh Chi�n L� Bao",tbProp={6,1,2377,1,0,0},nExpiredTime=14400, nCount = 2},
	{szName ="Huy�t Chi�n L�nh K�",tbProp={6,1,2212,1,0,0},nExpiredTime=14400, nCount = 2},
	{szName ="Th�n H�nh Ph�",tbProp={6,1,1266,1,0,0},nExpiredTime=10080, nCount = 1},
}
function GetBonus_CityTongWar()
do return end
	if checkBangHuiLimit() == 0 then
			Say("Xin l�i! ��i hi�p ch�a gia nh�p bang h�i n�o c�!",0);
			return
	end
	if (MergerSV_TongGetBonusCitywar_Time() ~= 1) then
		Say("Xin l�i! Hi�n t�i kh�ng th�ch h�p �� nh�n ph�n th��ng n�y",0);
		return
	end
	if (Check_PlayerObj() ~= 1) then
		Say("Xin l�i! ��ng c�p ��i hi�p kh�ng th�ch h�p nh�n ph�n th��ng n�y  !",0);
		return
	end
	if (PlayerFunLib:CheckTaskDaily(Task_TongCityWar_Date,1,"Xin l�i ��i hi�p, Ph�n th��ng n�y m�i tu�n ch� c� th� nh�n 1 l�n !","<") ~= 1) then
		return
	end
	if (GetJoinTongTime() < 60*24) then
		Talk(1,"","��i hi�p l� ng��i m�i gia nh�p v�o bang n�n kh�ng th� nh�n th��ng !")
		return
	end
	if (GetTask(Task_TongCityWar_Bonus) >=  4) then
		Say("Xin l�i! Ph�n th��ng n�y ch� nh�n t�i �a 4 l�n !",0);
		return
	end
	if (CalcFreeItemCellCount() <10) then
		Say("Xin l�i! H�nh trang ��i hi�p kh�ng �� 10 � tr�ng !",0);
		return
	end
	if (Check_CityTongWar() ==1) then
		PlayerFunLib:AddTaskDaily(Task_TongCityWar_Date,1)
		SetTask(Task_TongCityWar_Bonus, GetTask(Task_TongCityWar_Bonus) + 1)
		tbAwardTemplet:GiveAwardByList(tbItemBonus_TongCityWar, "MergerSV_201010");
	else
		Say("Xin l�i! bang c�a ��i hi�p kh�ng c� chi�m th�nh n�o c� !",0);
		return
	end
end

function MergerSV_TongGetBonusCitywar_Date()
		local nDate = tonumber(GetLocalDate("%Y%m%d"))
		if (nDate > End_TongGetCityWarBonus_Date) then
			return 0
		end
		return 1
end