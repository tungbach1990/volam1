Include("\\script\\global\\login_head.lua")
Include("\\script\\global\\systemconfig.lua")
Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_head.lua");

--tinhpn 20100805: VLMC
Include("\\script\\bonusvlmc\\head.lua");
Include("\\script\\vonghoa\\item\\head.lua");

LOGINMSG_EXTPOINTID	= 7;
LOGINMSG_BITL			= 1;
LOGINMSG_BITH			= 4;
TB_LOGINMSG_BYBIT = {
[1]	= "T�i kho�n c�a b�n �ang ���c ��ng k� s� gi�y t� m�i. B�n h�y ��ng nh�p b�ng m�t m� 2 v�o https://acc.volam.com.vn �� bi�t th�ng tin chi ti�t",
[2]	= "T�i kho�n c�a b�n �ang ���c ��ng k� email m�i. B�n h�y ��ng nh�p b�ng m�t m� 2 v�o https://acc.volam.com.vn �� bi�t th�ng tin chi ti�t",
[3]	= "T�i kho�n c�a b�n ch�a ��ng k� s� gi�y t� t�y th�n. B�n h�y ��ng nh�p b�ng m�t m� 2 v�o https://acc.volam.com.vn �� bi�t th�ng tin chi ti�t",
[4]	= "T�i kho�n c�a b�n ch�a ��ng k� email. B�n h�y ��ng nh�p b�ng m�t m� 2 v�o https://acc.volam.com.vn �� bi�t th�ng tin chi ti�t",
};

function extpoint_loginmsg()
	do
		return
	end
--	if (not SYSCFG_EXTPOINTID7_LOGINMSG) then
--		return
--	end;
--	
--	-- ֻ��Խ�ϰ汾���д˹���
--	if (SYSCFG_PRODUCT_REGION_ID ~= DEF_PRODUCT_REGION_VN) then
--		return
--	end
--	SetTask(Task_IsCurUse_VongHoa,0)--set task su dung vong hoa	
--	local nExtP = GetExtPoint(LOGINMSG_EXTPOINTID);
--	if (nExtP ~= 0) then
--		for i = LOGINMSG_BITL, LOGINMSG_BITH do
--			if (GetBit(nExtP, i) == 1 and TB_LOGINMSG_BYBIT[i]) then
--				Msg2Player(TB_LOGINMSG_BYBIT[i])
--			end;
--		end;
--	end;
--	
--	local nDate = tonumber(date("%Y%m%d"))
--	if nDate >=20091201 then
--		if GetTask(2657) == 0 then
--			for i=2629,2635 do
--				SetTask(i,0)
--			end	
--			SetTask(2657,1)
--		end
--	end
--	
--	if IsIPBonus() == 1 and CheckIPBonus() == 1 then
--		IpBonus_Close()
--		IpBonus_Start()
--	else
--		if GetSkillState(451) > 0 and GetTask(TSK_Active_x2EXP) ~= 1 then
--			--Msg2Player("TinhPN: " .. TSK_Active_x2EXP)
--			RemoveSkillState(451)
--		end
--	end;
end;

if login_add then login_add(extpoint_loginmsg, 2) end
