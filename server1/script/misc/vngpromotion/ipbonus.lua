Include("\\script\\lib\\basic.lua")

IP_EXTPOINT = 4 								-- Ext used for IP Bonus
IP_BIT = 1 											-- Bit check
IP_Name = "Nh�n ��i kinh nghi�m"		-- Event Name
IP_SWITCH = 0 									-- Open or close event


function IpBonus()
do return end
	local nPromotionSay =
	{		
		"T�i h� mu�n bi�t m�nh �� �i�u ki�n nh�n th��ng kh�ng?/getInfo",
	}	
	
	local nDay = tonumber(date("%w"))
	
	if nDay == 6 or nDay == 0 then
		tinsert(nPromotionSay,"Nh�n ph�n th��ng/getBonus")
	end	
	
	tinsert(nPromotionSay,"T�i h� ch� gh� qua th�i!/OnCancel")
	
	Say("Nh� �i�u h�nh s� g�i t�ng nhi�u ph�n qu� cho nh�ng ng��i ch�i � nh�ng ph�ng m�y ho�c c� nh�n c� nhi�u ��ng g�p. N�i dung c�a ho�t ��ng trong giai �o�n n�y l� <color=red>"..IP_Name.."<color>.",getn(nPromotionSay),nPromotionSay)
end;

function IsIPBonus()
	return IP_SWITCH
end

function CheckIPBonus()
	local nExtValue = GetExtPoint(IP_EXTPOINT)	
	if (GetBit(nExtValue,IP_BIT) == 1) then
		return 1
	else
		return 0
	end
end

function getBonus()
	if  (IsIPBonus() == 1) then		
		if (CheckIPBonus() == 1) then			
			AddIPAward();
		else
			Say("Th�t ti�c, IP c�a ng��i kh�ng thu�c trong danh s�ch nh�n th��ng. H�y quay l�i sau nh�!",1,"Th�t ng�i qu�!/OnCancel")
			return
		end;	
	end;
end;

function getInfo()
	if (CheckIPBonus() == 1) then
		Say("Cung h�! IP c�a ng��i �ang c� trong danh s�ch nh�n th��ng. H�y c� g�ng h�n!",1,"Xin �a t�/OnCancel")
		return
	else
		Say("Th�t ti�c, IP c�a ng��i kh�ng thu�c trong danh s�ch nh�n th��ng. H�y quay l�i sau nh�!",1,"Th�t ng�i qu�!/OnCancel")
		return
	end;
end;

function AddIPAward()
	if GetSkillState(451) > 0 then
		Say("Ch�ng ph�i ng��i �� nh�n th��ng r�i sao?" ,1,"Th�t ng�i qu�!/OnCancel")
		return
	end	
	
	Say("T�ng ng��i 1 m�n qu� nh� thay cho l�i tri �n! M�n qu� l�n n�y l� <color=red>"..IP_Name.."<color>.",1,"Xin �a t�/OnCancel")
	AddSkillState(451, 20, 1, 18*60*60*24);
	Msg2Player("Ch�c m�ng b�n nh�n ���c ph�n th��ng "..IP_Name);	
	WriteLog(format("[IPBonus]\t%s\t%s\t%s\t%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),IP_Name))
end;

function OnCancel()
end;
