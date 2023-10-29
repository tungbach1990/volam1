Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\missions\\citywar_global\\infocenter_head.lua")
Include("\\script\\vng_event\\denbu_congthanh\\head.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")

function tbDenbuCT2011:ShowDialog()
	if (tbDenbuCT2011:IsActive() ~= 1) then
		Talk(1,"","Ho�t ��ng �� k�t th�c!")
		return
	end
	
	local strTittle = "Ph�n th��ng ��n b� C�ng th�nh, n�u ��i Hi�p kh�ng gia nh�p Bang H�i s� kh�ng nh�n ���c <color=red>Ph�n th��ng Khi�u Chi�n L�nh <color>"
	Describe(strTittle, 2, "Ta mu�n nh�n/#tbDenbuCT2011:GetAward()", "��ng/OnCancel")
end

function tbDenbuCT2011:GetAward()
	if not self.tbListaward[GetAccount()] then	
		Talk(1, "", "��i Hi�p kh�ng c� trong danh s�ch nh�n th��ng l�n n�y")	
		return
	end
	
	if (tbExtPointLib:GetBitValue(self.nExtpoint_Is_DBCT, self.nBit_Is_DBCT) == 1) then
		Talk(1, "", "Ch�ng ph�i ��i hi�p ��  nh�n th��ng r�i sao?")
		return
	end
	
	if (tbExtPointLib:SetBitValue(self.nExtpoint_Is_DBCT, self.nBit_Is_DBCT, 1) ~= 1)then
		return
	end
	
	local tbPlayerAward = self.tbListaward[GetAccount()]
	tbAwardTemplet:Give(tbPlayerAward, 1, {"DenbuCT2011","NhanDenbuCongThanh"});
	
	if(self:CheckBangHoi() == 1) then
		local szTongName, nTongID = GetTongName();
		checkCreatLG(szTongName);
		checkJoinLG(szTongName);
		local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
		LG_ApplyAppendMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName, szTongName, LGTSK_TIAOZHANLING_COUNT, 2000, "", "");
		Msg2Player("��i hi�p n�p th�nh c�ng 2000 Khi�u Chi�n L�nh cho Bang H�i !")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."DenbuCT2011"..GetAccount().."\t"..GetName().."\t".."N�p th�nh c�ng 2000 KCL cho Bang H�i")
	end
	Msg2Player("Ch�c m�ng ��i Hi�p nh�n th�nh c�ng ph�n th��ng ��n b� C�ng Th�nh.");
end

function tbDenbuCT2011:IsActive()
	local now = tonumber(date("%Y%m%d"));
	if (now < tbDenbuCT2011.nEndDate) then
		return 1;
	end
	return 0;
end

--Ki�m tra Bang H�i
function tbDenbuCT2011:CheckBangHoi()
	local TongName,TongID = GetTongName();
	if TongName == "" or TongName == nil then
		return 0;
	else
		return 1;
	end
end

function OnCancel()
end

local pEventType = EventSys:GetType("AddNpcOption")

if (tbDenbuCT2011:IsActive() ~= 0) then
	nId = pEventType:Reg("L� Quan", "Nh�n ��n b� C�ng Th�nh", tbDenbuCT2011.ShowDialog,{tbDenbuCT2011})
end	
