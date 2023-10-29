--��������������߽ű�
--2012.09

Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\lib\\log.lua")
--Include("\\script\\misc\\eventsys\\type\\npc.lua")
tbFaction = 
{
	["emei"] = 1,
	["tangmen"]   = 2,
	["tianwang"] = 3,
	["tianren"] = 4,
	["wudang"] = 5,
	["cuiyan"] = 6,
	["shaolin"] = 7,
	["gaibang"]   = 8,
	["kunlun"] = 9,
	["wudu"] = 10,
}

function SetSkills(szFaction)
	--Th�m k� n�ng, th�m danh hi�u
	if szFaction == "emei" then
		for i=1,7 do add_em(i*10) end
		--X�ng hi�u m�n ph�i
		SetRank(64)

	elseif szFaction == "tangmen" then
		for i=1,7 do add_tm(i*10) end
		--X�ng hi�u m�n ph�i
		SetRank(76)

	elseif szFaction == "tianwang" then
		for i=1,7 do add_tw(i*10) end
		--X�ng hi�u m�n ph�i
		SetRank(69)
	elseif szFaction == "tianren" then
		for i=1,7 do add_tr(i*10) end
		--X�ng hi�u m�n ph�i
		SetRank(81)

	elseif szFaction == "wudang" then
		for i=1,7 do add_wd(i*10) end
		--X�ng hi�u m�n ph�i
		SetRank(73)

	elseif szFaction == "cuiyan" then
		for i=1,7 do add_cy(i*10) end
		--X�ng hi�u m�n ph�i
		SetRank(67)

	elseif szFaction == "shaolin" then
		for i=1,7 do add_sl(i*10) end
		--X�ng hi�u m�n ph�i
		SetRank(72)

	elseif szFaction == "gaibang" then
		for i=1,7 do add_gb(i*10) end
		--X�ng hi�u m�n ph�i
		SetRank(78)

	elseif szFaction == "kunlun" then
		for i=1,7 do add_kl(i*10) end
		--X�ng hi�u m�n ph�i
		SetRank(75)

	elseif szFaction == "wudu" then
		for i=1,7 do add_wu(i*10) end
		--X�ng hi�u m�n ph�i
		SetRank(80)

	else
		Msg2Player("Kh�ng c� m�n ph�i kh�ng th� s� d�ng")
		return nil
	end

	--T�y �i�m, h�c khinh c�ng
	local nDodgePoint = HaveMagic(210)		-- Khinh c�ng, thao t�c kh�c
	local nRollBackPoint = RollbackSkill()

	local nAddPoint = 0
	if(nDodgePoint ~= -1) then
		nAddPoint = nRollBackPoint - nDodgePoint
	else
		nAddPoint = nRollBackPoint
		AddMagic(210,1)
	end

	AddMagicPoint(nAddPoint)
	if (nDodgePoint ~= -1) then AddMagic(210,nDodgePoint) end			-- N�u �� h�c qua khinh c�ng ph�i tr� v� ��ng c�p tr��c ��
end

--Thi�t ��t h�m s� bi�n l��ng li�n quan
function SetAllTasks(szFaction)
	--Thi�t ��t tr�ng th�i nhi�m v� m�n ph�i
	SetTask(tbFaction[szFaction], 70*256)
	--Thi�t ��t bi�n l��ng nhi�m v� khinh c�ng
	SetTask(32,80)
end

--Cho h�m s� li�n quan ��n ph�n th��ng
function GiveAllAwards(szFaction)
	--Cho s�ch k� n�ng 90
	--PlayerFunLib:GetItem({tbProp={6,1,2426,1,0,0}, nBindState = -2,},1,"[�����������]ʹ�����������Ʒ")



	--Cho danh v�ng
	--AddRepute(570)
	--Cho �i�m l�nh ��o
	--AddLeadExp(2222000)
	
	--Cho k� n�ng, t�y �i�m
	SetSkills(szFaction)

	--thi�t ��t m�n ph�i, tr�n doanh li�n quan
	SetFaction("")
	SetCamp(4)
end

-- Nh�p h�m s� item
function VnGetSkill_main()

	local szFaction = GetFaction()

	--Ph�n �o�n �� tr�ng sinh hay ch�a
--	if ST_IsTransLife() == 1 then
--		Msg2Player(format("Ch� c� ��i hi�p ch�a tr�ng sinh m�i ���c ph�p nh�n k� n�ng"))
--		return 1
--	end
	
	if GetLevel() < 120 then
		Msg2Player("��ng c�p kh�ng ��, c�n ph�i tr�n 120 m�i ���c ph�p nh�n k� n�ng.")
		return
	end
	
	--Ph�n �o�n l� �� xu�t s� hay ch�a
	if tbFaction[szFaction] == nil or GetTask(tbFaction[szFaction]) >= 70*256 then
		Msg2Player(format("Ch� c� ��i hi�p ch�a xu�t s� m�i ���c nh�n k� n�ng"))
		return 1
	end

	--Ph�n �o�n B� Tuy�n Chi Th�y
--	if CalcItemCount(-1, 6, 1, 2427, -1) < 5 then
--		Msg2Player(format("C�n ph�i c� 5 c�i B� Tuy�n Chi Th�y m�i m� ���c l� bao n�y"))
--		return 1
--	end
	
	
	--Ph�n �o�n kh�ng gian h�nh trang
--    if PlayerFunLib:CheckFreeBagCell(34,"H�nh trang c�a ��i hi�p kh�ng �� ch� tr�ng , c�n ph�i c� 34 � tr�ng (trong �� �t nh�t ph�i c� 1 kho�ng tr�ng 2*3)") ~= 1 
--	   or PlayerFunLib:CheckFreeBagCellWH(2, 3, 1, "default") ~= 1 then
--	   
--	   return 1;
--    	end
	
	--if ConsumeItem(-1, 5, 6, 1, 2427, -1) == 1 then
		%SetAllTasks(szFaction)
		%GiveAllAwards(szFaction)
		tbLog:PlayerActionLog("NhanKyNang","NhanKyNangThanhCong")
		--Ho�n th�nh t�t c� thao t�c, �� ng��i ch�i ra kh�i tr� ch�i
		KickOutPlayer(GetName())

		--return nil
	--end

	--Msg2Player("M� l� bao th�t b�i.")
	--return 1	
end

--pEventType:Reg("Chi�n T�m T�n Gi�", "Nh�n k� n�ng c�p 10 ��n 60", VnGetSkill_main)