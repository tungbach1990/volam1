--������ ��ɽ�� ���½��Ի� ��������������
-- By: Dan_Deng(2004-02-03)

Include("\\script\\global\\repute_head.lua")
Include("\\script\\global\\chuangong.lua")
Include("\\script\\task\\lv120skill\\head.lua")		-- 120����������

Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()

	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex);
	if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName) end
	local tbDailog = DailogClass:new(szNpcName);
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex);
	tbDailog.szTitleMsg = "<npc>L�u ng�y kh�ng g�p! T�m ta c� vi�c g�?"
	tbDailog:AddOptEntry("Ta ��n b�i ph�ng Minh ch�.", old_main)
	tbDailog:AddOptEntry("Minh Ch� ng��i c� bi�t Nguy�t Ca ��o n�y c� t�n t�i th�t hay kh�ng?", yuegedao_help)
	tbDailog:Show()
	
--	if (GetTask(TV_LAST_APPLY_TIME) > 0) then
--		Describe(strimg..GetName().."�þò����ˣ�����������ʲô�£�",3,"���������ݷ�һ�������㡣/old_main", "����������ڴ��������顣/chuangong_info", "����ȡ���ϴεĴ�������!/cg_undo")
--	else
--		Describe(strimg..GetName().."�þò����ˣ�����������ʲô�£�",2,"���������ݷ�һ�������㡣/old_main", "����������ڴ��������顣/chuangong_info" )
--		Describe(strimg..GetName().."�þò����ˣ�����������ʲô�£�",1,"���������ݷ�һ�������㡣/old_main");
--	end
end

function old_main()
	Uworld39 = GetTask(39)
	Uworld40 = GetTask(40)
	Udate = tonumber(date("%Y%m%d"))						-- ��Ҫת������ֵ����ֱ�ӽ��бȽ�
	if (Uworld39 == 10) then									-- ���������
		if (Uworld40 == 1023) then									-- bin(1111111111)���������
			U39_prise()
		else
			Talk(1,"U39_progress", 11332)
		end
	elseif (Uworld39 == 0) or ((Udate > Uworld39) and (Uworld39 > 20040101)) then			-- ������������������20���������ȼ�����2��������δ����������ɳ���1��
		if (GetLevel() >= 20) and (GetReputeLevel(GetRepute()) >= 2) then
			Say(11333 ,2,"Kh�ng th�nh v�n ��, ta c� th� l�m ���c. /U39_yes","Ta hi�n r�t b�n, �� khi kh�c n�i ti�p. /no")
		else
			Talk(3,"", 11334, 11335, 11336)
		end
	elseif (Uworld39 >= Udate) then								-- ��������ɣ�δ���ظ�ʱ��
		Talk(2,"", 11337, 11338)
	else																	-- ����(???)
		Talk(1,"", 11339)
		SetTask(39,0)
		SetTask(40,0)
	end
end;

function U39_yes()
	Talk(1,"", 11340)
	SetTask(39,10)
	SetTask(40,0)
	Earn(10000)
	Msg2Player("Ti�p nh�n nhi�m v� Th�i �� V� L�m: Thay ��c C� Ki�m �i th�m d� th�i �� c�c m�n ph�i c� ��ng l�ng li�n k�t di�t n��c Kim hay kh�ng. ")
	AddNote("Ti�p nh�n nhi�m v� Th�i �� V� L�m: Thay ��c C� Ki�m �i th�m d� th�i �� c�c m�n ph�i c� ��ng l�ng li�n k�t di�t n��c Kim hay kh�ng. ")
end

function U39_prise()
	Talk(2,"", 11341, 11342)
	SetTask(39,date("%Y%m%d"))					-- ������Ϊ��ǰ����
	SetTask(40,0)									-- �ӱ�����λ
	i = 10+random(1,10)							-- �����������11---20��
	AddRepute(i)
	Msg2Player("Ho�n th�nh nhi�m v� Th�i �� V� L�m c�a ��c C� Ki�m, danh v�ng c�a b�n t�ng "..i.."�i�m.")
	AddNote("Quay l�i Ho�nh s�n ��i ��nh, ho�n th�nh nhi�m v� Th�i �� V� L�m c�a ��c C� Ki�m. ")
end

function U39_progress()
	Uworld40 = GetTask(40)
	faction_list = {"Nga My ph�i","���ng M�n","Thi�n V��ng Bang","Thi�n Nh�n Gi�o","V� �ang ph�i","Th�y Y�n m�n","Thi�u L�m ph�i","C�i Bang","C�n L�n ph�i","Ng� ��c Gi�o"}
	str = ""
	for i = 1,10 do									-- �������λ�����ɣ��б�˳������������˳��
		if (GetBit(Uworld40,i) == 1) then
			if (str == "") then
				str = faction_list[i]
			else
--				str = str + "��" + faction_list[i]
--				str = format("%s��%d", str, faction_list[i])
				str = str..", "..faction_list[i]
			end
		end
	end
	if (str == "") then								-- ���ݼ������Ӧ�Ի�
		Talk(1,"", 11343)
	else
		Talk(1,"","Ng��i hi�n gi� �� �i �i�u tra ���c c�c m�n ph�i: "..str..", hy v�ng c� th� nhanh m�t ch�t. ")
	end
end

function no()
end

function biguan_talk()
	if (GetLevel() < 120) then
		describe_talk({npc_string(1, "Ng��i v�n ch�a ��t c�p 120, c�ng l�c h�y c�n non k�m, t�t nh�t ��ng nh�ng tay v�o vi�c n�y.")})
	elseif (GetLastFactionNumber() == -1) then
		describe_talk({npc_string(1, "Ng��i v� m�n v� ph�i, ta v� ng��i c�ng ch�ng li�n can g� v�i nhau.")})
	else
		local szTemp = "Huynh ��"
		if (GetSex() == 1) then
			szTemp = "N� hi�p"
		end
		local tDialog =
		{
			npc_string(1, "V�"..szTemp.." n�y, h�i n�y ta �� tuy�n b� c�ng vi�c c�a li�n minh �� c� �� t� �i l�m r�i, ng��i c�n ��n t�m ta c� g� �� l�m?"),
			speak_string(1, "Ch�ng d�m gi�u minh ch�, ta v� chuy�n b� quan c�a �ng m� ��n ��y. Trong m�t c�c nh�n s� v� l�m, th�i gian n�y c�ng t�m g�i l� th�i b�nh, kh�ng c� ch�nh s� binh bi�n g�. Nh�ng quy�t ��nh c�a �ng xem ra h�i kh�c th��ng, kh�ng ch�ng s� g�y �t nhi�u l�i ��n th�i, giang h� l�i th�m m�t phen b�t an."),
			npc_string(1, "Giang h� tr��c nay lu�n r�t nh�y c�m, ch�c ng��i c�ng hi�u. V� ta c�ng v� d�o n�y c�c danh s� tho�i �n c�a th�p ��i m�n ph�i �� t�i xu�t giang h�, v� an ��nh c�a v� l�m m� ta quy�t ��nh nh� v�y."),
			speak_string(1, "N�u l� v� chuy�n y�n ��nh v� l�m, l� n�o minh ch� l�i kh�ng ra m�t l�n ti�ng vi�c n�y?"),
			npc_string(1, "L�n ti�ng? Hi�n gi� c�ng ch�a ph�i l�c, hu�ng g� ��n ta c�ng kh�ng mu�n t�m hi�u s� t�nh b�n trong, n�i g� ��n vi�c l�n ti�ng, t�t c� ��u ch�a r� r�ng, v� th� ta c�n c� th�i gian �� t�m hi�u. C�c h� h�y quay v� tr��c �i, ta c� vi�c c�n ph�i gi�i quy�t."),
			speak_string(1, "Th�i ���c r�i, n�u �� nh� th� ta c�ng kh�ng l�m m�t th�i gian c�a bang ch� n�a. �, c�n l�i cu�i c�ng ta mu�n n�i l�, c�c nh�n s� v� l�m v� chuy�n n�y m� b�n kho�n, ri�ng ta c�ng v� chuy�n n�y m� b�n ba kh�p n�i, n�n c�ng hi v�ng minh ch� s�m c�ng b� ch�n t��ng c�a v� vi�c. Ta xin c�o t�."),
			self_string(1, "Xem ra ch� c� r�i kh�i Ho�nh S�n Ph�i, t� tay �i �i�u tra v� vi�c n�y th�i. Vi�c li�n quan ��n ��c c� ��i hi�p, nh�t ��nh ph�i t� <color=white>C�a ch�nh ��i s�nh<color> xu�t h�nh m� th�i."),
		}
		describe_talk(tDialog)
		SetTask(LV120_SKILL_STATE, 2)
		SyncTaskValue(LV120_SKILL_STATE)
	end
end

function yuegedao_help()
	Talk(2, "yuegedao_fix", "��c C� Ki�m: thu� thi�u ni�n khi ta h�nh t�u giang h� c� nghe n�i ��n. Ng��i h�i c� vi�c g� kh�ng?",
													"Ng��i ch�i: nh� ng�y h�m nay Nguy�t Ca L�nh l�i t�i xu�t giang h�, sau khi �� t� nh�n ���c m� kh�ng bi�t ph�i x� tr� th� n�o cho ph�i l�?")
end

function yuegedao_fix()
	local TSK_LV150_SKILL = 2885
	local FINAL_150SKILL_TASKSTATE = 14
	local tbname_150skill_list = {
		[0] = {1055, 1056, 1057},
		[1] = {1058, 1059, 1060},
		[2] = {1069, 1070, 1071, 1110},
		[3] = {1066, 1067},
		[4] = {1061, 1062, 1114},
		[5] = {1063, 1065},
		[6] = {1073, 1074},
		[7] = {1075, 1076},
		[8] = {1078, 1079},
		[9] = {1080, 1081},
	}
	local tbFactStepList = {
		[5] = 6,
		[2] = 7,
		[4] = 7,
		[3] = 5,
		[6] = 9,
		[7] = 9,
		[0] = 6,
		[8] = 5,
		[1] = 4,
		[9] = 5,
	}
	local nLevel = GetLevel()
	if nLevel < 150 then
		Talk(1, "", "Ng��i v�n ch�a �� c�p 150, kh�ng c� t� c�ch nh�n Nguy�t Ca L�nh!")
		return
	end
	local nFact = GetLastFactionNumber()
	if nFact == -1 then	
		Talk(1, "", "Ng��i v�n ch�a gia nh�p m�n ph�i n�o c�, kh�ng c� t� c�ch nh�n Nguy�t Ca L�nh!")
		return 1
	end
	local tbSkill = tbname_150skill_list[nFact]
	local nGetAllSkill = 1
	for i = 1, getn(tbSkill) do
		local nSkillId = tbSkill[i]
		if HaveMagic(nSkillId) == -1 then
			nGetAllSkill = 0
			break
		end
	end
	local nYueGedaoStep = mod(floor(GetTask(TSK_LV150_SKILL)/100), 100)
	if nGetAllSkill == 1 or nYueGedaoStep >= FINAL_150SKILL_TASKSTATE then
		Talk(1, "", "Xem ra ng��i �� l�nh h�i ���c r�t nhi�u �i�u t�t tr�n Nguy�t Ca ��o, ng��i kh�ng c�n ph�i c� c�i l�nh b�i n�y n�a ��u, vi�n l� giang h�, ng��i c� �i �i.")
		return
	end
	local nTaskStep = mod(GetTask(TSK_LV150_SKILL), 100)
	if nTaskStep < tbFactStepList[nFact] then
		Talk(1, "", "Tr��c ti�n ng��i c� l�m cho t�t vi�c m� s� m�n c�a ng��i giao cho r�i h�y n�i.")
		return
	end
	if CalcItemCount(-1, 6, 1, 2908, -1) > 0 then
		Talk(1, "", "R� r�ng l� ng��i c� m�t Nguy�t Ca L�nh r�i.")
		return
	end
	if CalcFreeItemCellCount() < 1 then
		Talk(1, "", "H�nh trang �t c�n ph�i c� 1 � tr�ng")
		return
	end
	Talk(1, "", "Ta v�n c�n m�t Nguy�t Ca L�nh, ng��i c� c�m l�y �i, s� c� �ch l�m ��y.")
	local tbAward = {
		{szName = "Nguy�t Ca L�nh", tbProp = {6,1,2908,1,0,0,}, nBindState = -2,},
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "��n ��c C� Ki�m - Ho�nh S�n Ph�i nh�n Nguy�t Ca L�nh")	
end
