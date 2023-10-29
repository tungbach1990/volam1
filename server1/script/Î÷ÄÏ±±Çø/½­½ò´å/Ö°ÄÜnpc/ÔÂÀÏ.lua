-- ����.lua ���������NPC��NPC���ڵش���
-- By: Dan_Deng(2003-12-27)
-- Uworld67 == GetTask(67)������λ���壺1-7(��������״̬)��8-15(������)��16-23(����)��24(���)��25-32(����)
-- PS��2���Ƿ��͹���ָ��
-- GetTaskTemp(5)����¼�Ƿ������ף������ף�
-- GetTaskTemp(6)����¼�����ߵ�����ID
-- GetTaskTemp(7)����¼�������ߵ�����ID
-- ���������δ��, �ȼ�>=20, �з����ӳ�, �з�ȥ������˵��, Ȼ��Ů����ȥ˵������������
-- By: Dan_Deng(2004-03-02) ��д�ű��ṹ���Ա�ά��
-- Update: Dan_deng(2004-03-02) Э�����
-- Update: Fanghao_Wu(2004-8-20) ��Ϧ����
-- Update: �ӷ��� (2007-10-12) �޸��޸���״̬

Include("\\script\\global\\teamhead.lua");
Include("\\script\\event\\valentine2007\\event.lua");
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")

TK_DATE_APPLYDIV = 1779; --������������
TOTALSEC_OF_DAY = 60 * 60 * 24; -- 1����ڶ����룬���ڰ�����ת����
COSTOFSIMGLEDIV = 1000000; --������黨��

function main(sel)
	if (check_married() == 1) then
		SetTask(67, SetBit(GetTask(67), 24, 0));
		Msg2Player("<color=yellow>T�nh tr�ng h�n ph�i c�a b�n �� thay ��i<color>");
	end;
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	
	if (GetSex() == 0) and (GetTaskTemp(5) == 1) then	
		tbDailog.szTitleMsg = "<#><npc>� trung nh�n c�a ng��i v�n ch�a tr� l�i ng��i, c� c�n m�i c� ta nhanh nhanh m�t ch�t kh�ng?"
		tbDailog:AddOptEntry("Ta ngh� vi�c c�u h�n c�a ta qu� ���ng ��t, ng��i c� th� h�y b� cho ta ���c kh�ng?", male_cancel)
		tbDailog:AddOptEntry("���c, ta �i th� xem", male_hurry)
	elseif (GetSex() == 1) and (GetTaskTemp(5) == 1) then	
		tbDailog.szTitleMsg = "<#><npc>anh ta �ang ��i ng��i tr� l�i k�a, �� suy ngh� k� l� mu�n c�ng v�i anh ta �i su�t cu�c ��i hay ch�a?"
		tbDailog:AddOptEntry("V�ng, Ta nguy�n su�t ��i n�ng kh�n s�a �o cho anh ta, c�ng nhau �i h�t cu�c ��i.", female_yes)
		tbDailog:AddOptEntry("Kh�ng! Ta kh�ng mu�n trong l�c b�ng b�t ��a ra quy�t ��nh c� ��i ng��i m�nh.", female_cancel)
	else
		tbDailog.szTitleMsg = "<#><npc>Th�c ra l�o gi� n�y su�t ng�y b�n r�n, nh�ng c� th� xem v� gi�i quy�t ���c t�nh duy�n c�a ng��i tr� tu�i."
		tbDailog:AddOptEntry("Ta �� c� � trung nh�n, mu�n c�u h�n v�i c� �y", Qmarry)
		tbDailog:AddOptEntry("T�nh c�a ch�ng ta kh�ng h�p nhau, mu�n li h�n cho r�i.", divorce)
		tbDailog:AddOptEntry("Phu Th� ch�ng t�i c�i v� su�t ng�y, xin Nguy�t L�o gi�p t�i v�i l�i khuy�n.", fix_marry)
		tbDailog:AddOptEntry("Xin ��n ph��ng ly h�n", singlediv_apply)
		tbDailog:AddOptEntry("Th� t�c x�t x� ��n ph��ng ly h�n.", sure_process_dinglediv)
		tbDailog:AddOptEntry("Kh�ng c� g�, ta ch� qua ���ng m� th�i.", no)
	end
	
	tbDailog:Show()
end
-----------���������----------------
--���뵥�������
function singlediv_apply()
	if (check_marrystate() == 0) then
		return
	end;
	
	local nDays = get_passdays();
	local str = "Th�i gian xin ly h�n ch�a �� <color=yellow>1 ng�y<color>, ";
	if (nDays > 0) then
		str = format("Ng��i xin ly h�n �� ���c <color=yellow>%d ng�y<color> r�i, ",nDays);
	end;
	if (GetTask(TK_DATE_APPLYDIV) ~= 0) then
		Say(format("Nguy�t L�o: %s kh�ng c�n ph�i xin ly h�n n�a.", str), 0);
		return
	end;
	
	Say(format("Tr�m n�m tu m�i c� th� c�ng thuy�n, ng�n ki�p tu m�i c� th� n�n duy�n.Trong bi�n ng��i m�nh m�ng, g�p nhau, th��ng y�u nhau h� ph�i chuy�n d� d�ng! ��n ph��ng ly h�n c�n n�p ph�  <color=yellow>%d l��ng<color>. Ng��i th�t s� mu�n �o�n tuy�t m�i duy�n n�y ch�?",COSTOFSIMGLEDIV), 2,
		"Xin ly h�n ��n ph��ng/makesure_apply",
		"�� ta xem l�i/no");
end;

--ȷ�����룺���������
function makesure_apply()
	local nDate = GetCurServerTime();
	SetTask(TK_DATE_APPLYDIV, nDate);
	
	WriteLog(format("%s\tAccount:%s[Name:%s] �� xin ly h�n ��n ph��ng.",
				GetLocalDate("%Y-%m-%d %H:%M:%S"),
				GetAccount(),
				GetName() ));	
	Say("Nguy�t L�o: Tuy ng��i �� quy�t, nh�ng ch� e sau n�y l�i h�i h�n, ta s� cho ng��i th�i gian �� suy ngh� l�i, m�t tu�n sau h�y ��n g�p ta.", 0);
	informother(Say, format("Ph�i ng�u %s �� ��n g�p Nguy�t L�o xin ��n ph��ng ly h�n, 1 tu�n sau s� t� ��ng <color=yellow>�o�n tuy�t quan h� ph�i ng�u<color>.",GetName()), 0);
end;

--֪ͨ��ż
function informother(proc, ...)
	local Lover = GetMateName();
	if (Lover == "") then 
		return 1
	end;
	
	local nOldPlayer = PlayerIndex
	local nIdx = SearchPlayer(Lover);
	if (nIdx <= 0) then
		return 1;
	end;
	
	if (not proc or type(proc) ~= "function") then
		return 1;
	end;
	PlayerIndex = nIdx;
	call(proc, arg);
	
	PlayerIndex = nOldPlayer;
end;


--���뵥�������
function sure_process_dinglediv()
	if (check_marrystate() == 0) then
		return
	end;
	
	if (GetTask(TK_DATE_APPLYDIV) == 0) then
		Say("Nguy�t L�o: Ng��i mu�n xin ��n ph��ng �o�n tuy�t quan h� ph�i ng�u?", 2,
			"Xin ly h�n ��n ph��ng/singlediv_apply",
			"Nh�n ti�n gh� qua th�i/no");
		return
	end;
	
	local nDays = get_passdays();
	local str = "Th�i gian xin ly h�n ch�a �� <color=yellow>1 ng�y<color>, ";
	if (nDays > 0) then
		str = format("ng��i xin ly h�n ch� m�i <color=yellow>%d ng�y<color>, ",nDays);
	end;
	if (nDays < 7) then
		Say(format("Nguy�t L�o: Ng��i n�ng l�ng qu� r�i, %s v�n ch�a �� 1 tu�n, h�y quay v� suy ngh� cho k�.",str), 0);
		return 0;
	end;
	
	Say(format("Tr�m n�m tu m�i c� th� c�ng thuy�n, ng�n ki�p tu m�i c� th� n�n duy�n.Trong bi�n ng��i m�nh m�ng, g�p nhau, th��ng y�u nhau h� ph�i chuy�n d� d�ng! ��n ph��ng ly h�n c�n n�p ph�  <color=yellow>%d l��ng<color>. Ng��i th�t s� mu�n �o�n tuy�t m�i duy�n n�y ch�?", COSTOFSIMGLEDIV), 2,
		"L�m th� t�c ly h�n ��n ph��ng/process_dinglediv",
		"�� ta xem l�i/no");
end;

--���е��������
function process_dinglediv()
	if (GetCash() < COSTOFSIMGLEDIV) then
		Say(format("Nguy�t L�o: ��n ph��ng ly h�n c�n n�p <color=yellow>%d<color> l��ng, ti�n ng��i mang theo ch�a ��!",COSTOFSIMGLEDIV), 0);
		return 0;
	end;
	
	if (Pay(COSTOFSIMGLEDIV) == 0) then
		return
	end;
	
	divorce_dateproc(PlayerIndex);
	WriteLog(format("%s\tAccount:%s[Name:%s] �� ti�n h�nh ��n ph��ng ly h�n.",
				GetLocalDate("%Y-%m-%d %H:%M:%S"),
				GetAccount(),
				GetName() ));
	Say("Nguy�t L�o: Hi�n gi� ng��i �� ly h�n r�i, ng��i c� th� �i t�m t�nh y�u ��ch th�c �� chung s�ng nh�ng ng�y c�n l�i.", 0);
	
	Msg2Player(format("�� n�p <color=yellow>%d l��ng<color> l� ph� ��n ph��ng ly h�n.", COSTOFSIMGLEDIV));
	Msg2Player("T�nh tr�ng h�n nh�n hi�n t�i l� ��c th�n.");
	informother(divorce_dateproc);
	informother(Say, format("Ph�i ng�u %s �� ��n g�p Nguy�t L�o xin <color=yellow>��n ph��ng ly h�n<color>, �o�n tuy�t quan h� ph�i ng�u v�i b�n.",GetName()), 0);
end;

--��������˶�����
function get_passdays()
	local nApplyDate = GetTask(TK_DATE_APPLYDIV);
	local nDate = GetCurServerTime();
	if (nApplyDate == 0 or nDate < nApplyDate) then
		return -1;
	end;
	
	local nDays = floor((nDate - nApplyDate) / TOTALSEC_OF_DAY);
	return nDays;
end;

--���õ����������
function divorce_dateproc()
	local nWorld67 = GetTask(67);
	nWorld67 = SetBit(nWorld67,24,0);
	SetTask(TK_DATE_APPLYDIV, 0);
	UnMarry();
	
	nRepute = GetRepute();				-- ������ش���
	if (nRepute > 10) then
		nRepute = 10;
	end;
	AddRepute(-1 * nRepute)								-- ����10��(����10����Ϊ0);
	
	nDivorceTimes = GetByte(nWorld67,2) + 1
	if (nDivorceTimes > 100) then
		nDivorceTimes = 100;
	end;
	nWorld67 = SetByte(nWorld67, 2, nDivorceTimes);
	SetTask(67,nWorld67);
end;

--�����������뵥��������״̬
function check_marrystate()
	local nLvl = GetLevel();
	local nSex = GetSex();
	local bMarried = GetBit(GetTask(67),24);
	
	if (nLvl < 20) then
		Say("Nguy�t L�o: ��ng ��a v�i ta, ng��i v�n ch�a ��n tu�i th�nh gia l�p th�t.", 0);
		return 0;
	end;
	
	local str = "C� n��ng";
	if (nSex == 1) then
		str = "ch�ng trai";
	end;
	
	if (bMarried == 0) then
		Say(format("Nguy�t L�o: ��ng ��a v�i ta, ng��i v�n ch�a k�t h�n m� l�i xin ly h�n, h�y mau �i t�m %s �� k�t h�n �i.", str), 0);
		return 0;
	end;
	return 1;
end;
function check_married_team()
	local nOldPlayer = PlayerIndex;
	local nTeamSize = GetTeamSize();
	if (nTeamSize ~= 2) then
		return 1;
	end;
	local mem = {};
	mem[1] = GetTeamMember(1);
	mem[2] = GetTeamMember(2);
	local szName = "";
	for i = 1, nTeamSize do
		PlayerIndex = mem[i];
		if (check_married() == 1) then --��������������
			szName = GetName();
			SetBit(GetTask(67),24,0);
			SetTask(67,1);
		end;
		PlayerIndex = nOldPlayer;
	end;
	if (szName == "") then
		return 1
	end;
	
	local str = format("<color=yellow>Tr�ng th�i h�n nh�n %s �� thay ��i<color>",szName)
	for i = 1, nTeamSize do
		OtherPlayer(mem[i], Msg2Player, str);
	end;
	return 1;
end;


function check_married()
	if (GetMateName() == "" and GetBit(GetTask(67),24) == 1) then
		return 1;
	end;
	return 0;
end;

----------------------- ��Ϧ���9�鰮���ɿ�����ȡ���� ------------------
function chocolate()
	Say("9 mi�ng s� c� la c� th� ��i 999 v�n �i�m kinh nghi�m, c�ng c� th� nh�n l�y nh�ng ph�n th��ng b�t ng�, ng��i ch�n lo�i n�o?",3,"��i 999 v�n �i�m kinh nghi�m/chocolate_exp","��i ph�n th��ng v�t ph�m/chocolate_gift","Kh�ng c� g�, ta ch� �i ngang qua th�i!/no");
end

function chocolate_exp()
	local nNowDate = tonumber(date("%d"));
	if(CalcEquiproomItemCount( 6, 1, 833, 1) < 9) then
		Say("H�nh nh� tr�n ng��i kh�ng c� �� 9 mi�ng s� c� la th� ph�i? Nh� ��y m�t mi�ng c�ng kh�ng th� thi�u ��!",0);
		return
	end
	if(GetTask(1564) == nNowDate) then
		if(GetTask(1565) > 0) then
			Say("N�u l�y s� c� la ��i �i�m kinh nghi�m th� m�t ng�y ch� c� th� ��i m�t l�n th�i, h�n n�a ng��i gi�  ��ng n�n �n nhi�u �� ng�t.",0);
			return
		end
		ConsumeEquiproomItem( 9, 6, 1, 833, 1);
		AddOwnExp(9990000);
		SetTask(1565,GetTask(1565)+1);
	else
		ConsumeEquiproomItem( 9, 6, 1, 833, 1);
		AddOwnExp(9990000);
		SetTask(1565,1);
		SetTask(1564,nNowDate);
	end
end

function chocolate_gift()
	if(CalcEquiproomItemCount( 6, 1, 833, 1) < 9) then
		Say("H�nh nh� tr�n ng��i kh�ng c� �� 9 mi�ng s� c� la th� ph�i? Nh� ��y m�t mi�ng c�ng kh�ng th� thi�u ��!",0);
		return
	end
	ConsumeEquiproomItem( 9, 6, 1, 833, 1);	
	local i = random(1,1000);
	if(i <= 300) then
		AddEventItem(353);
		Msg2Player("B�n nh�n ���c 1 Tinh H�ng B�o Th�ch");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T�i l� h�i th�ng b�y nh�n ���c m�t vi�n Tinh H�ng B�o Th�ch");	
	elseif(i > 300 and i <= 460) then
		AddEventItem(238);
		Msg2Player("B�n nh�n ���c 1 Lam Th�y Tinh");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T�i l� h�i th�ng b�y nh�n ���c m�t vi�n Lam Th�y Tinh");		
	elseif(i > 460 and i <= 620) then
		AddEventItem(240);
		Msg2Player("B�n nh�n ���c 1 L�c Th�y Tinh");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T�i l� h�i th�ng b�y nh�n ���c  m�t vi�n L�c Th�y Tinh");		
	elseif(i > 620 and i <= 800) then
		AddEventItem(239);
		Msg2Player("B�n nh�n ���c 1 T� Th�y Tinh");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T�i l� h�i th�ng b�y nh�n ���c m�t vi�n T� Th�y Tinh");		
	elseif(i > 800 and i <= 949) then
		AddItem(6,1,147,6,0,0);
		Msg2Player("B�n nh�n ���c 1 Huy�n Tinh Kho�ng Th�ch c�p 6");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T�i l� h�i th�ng b�y nh�n ���c m�t vi�n Huy�n Tinh Kho�ng Th�ch c�p 6 ");		
	elseif(i > 949 and i <= 979) then
		AddItem(6,1,147,7,0,0);
		Msg2Player("Ng��i nh�n ���c m�t vi�n Huy�n Tinh Kho�ng Th�ch c�p 7");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T�i l� h�i th�ng b�y nh�n ���c m�t vi�n Huy�n Tinh Kho�ng Th�ch c�p 7");		
	elseif(i > 979 and i <= 989) then
		AddItem(6,1,147,8,0,0);
		Msg2Player("B�n nh�n ���c 1 Huy�n Tinh Kho�ng Th�ch c�p 8");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T�i l� h�i th�ng b�y nh�n ���c m�t vi�n Huy�n Tinh Kho�ng Th�ch c�p 8");		
	elseif(i > 989 and i <= 990) then
		AddItem(6,1,147,9,0,0);
		Msg2Player("B�n nh�n ���c 1 Huy�n Tinh Kho�ng Th�ch c�p 9");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T�i l� h�i th�ng b�y nh�n ���c m�t vi�n Huy�n Tinh Kho�ng Th�ch c�p 9");		
	elseif(i > 990 and i <= 1000) then
		AddItem(6,1,398,9,0,0);
		Msg2Player("B�n nh�n ���c 1 Kho�ng Th�ch Th�n B�.");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T�i l� h�i th�ng b�y nh�n ���c m�t vi�n Kho�ng Th�ch Th�n B� ");		
	else
	end
end
----------------------- ��Ϧ���9�鰮���ɿ�����ȡ���� ------------------

----------------------- ͨ�ù��ܺ��� ------------------
function default_talk()			-- ȱʡ�Ի�
	Talk(1,"","N�u hai b�n �� c� � v�i nhau, ch� c�n �� tr��ng th�nh v� ch�a k�t h�n v�i ai, c�ng nhau ��n ��y ta s� t�c h�p l��ng duy�n. Ng��i h�y n�i � mu�n c�u th�n v�i ta, ta s� thay ng��i chuy�n cho ng��i �y, gi�p ng��i t�c th�nh h�n s�!")
end

function check_team()
	Player1_ID = GetTeamMember(1)
	Player2_ID = GetTeamMember(2)
-- ��ѯ�����е�Ů�Գ�Ա���������¼����ID����ʱ����
	if (OtherPlayer(Player2_ID,GetSex) == 1) then
		His_ID = Player1_ID
		Her_ID = Player2_ID
		Her_world67 = OtherPlayer(Her_ID,GetTask,67)
		His_world67 = OtherPlayer(His_ID,GetTask,67)
	elseif (OtherPlayer(Player1_ID,GetSex) == 1) then
		His_ID = Player2_ID
		Her_ID = Player1_ID
		Her_world67 = OtherPlayer(Her_ID,GetTask,67)
		His_world67 = OtherPlayer(His_ID,GetTask,67)
	else
		His_ID = 0
		Her_ID = 0
	end
	return His_ID,Her_ID,His_world67,Her_world67
end

function do_qmarry_cancel()
	His_ID,Her_ID,His_world67,Her_world67 = check_team()
	if (OtherPlayer(His_ID,GetTaskTemp,0,5) == 1) and (OtherPlayer(Her_ID,GetTaskTemp,0,5) == 1) and (OtherPlayer(Her_ID,GetTaskTemp,0,6) == His_ID) and (OtherPlayer(His_ID,GetTaskTemp,0,7) == Her_ID) then	-- ˫�������ܶ��ϣ�����ɾ��
		OtherPlayer(His_ID,SetTaskTemp,5,0)
		OtherPlayer(His_ID,SetTaskTemp,6,0)
		OtherPlayer(His_ID,SetTaskTemp,7,0)
		OtherPlayer(Her_ID,SetTaskTemp,5,0)
		OtherPlayer(Her_ID,SetTaskTemp,6,0)
		OtherPlayer(Her_ID,SetTaskTemp,7,0)
--		Msg2Player("���ȡ���ɹ���")
--	else
--		Msg2Player("�޷�ȡ����顣")
	end
end

function OtherPlayer_talk(PlayerId, msg)		-- Ϊ���˷���Ϣ
	OldPlayer = PlayerIndex
	PlayerIndex = PlayerId
	Talk(1,"",msg)
	PlayerIndex = OldPlayer
end
----------------------- ������ -----------------------
function Qmarry()			-- ����Լ����Ϸ��Լ��
	if (GetFaction() == "shaolin") or (GetFaction() == "emei") then		-- ������ò�׼���
		Talk(1,"","Ng��i l� ng��i xu�t gia sao d�m ngh� ��n chuy�n h�ng tr�n? Hay �� v�t b� h�t m�n quy?")
	elseif (GetSex() == 1) then											-- ��ͨ�Ķ�Ů�Ե�˵��
		Talk(1,"","Chuy�n th�nh th�n n�y, ���ng ���ng l� m�t c� g�i nh� ng��i sao l�i ch� ��ng th�i qu� v�y? H�y �� t�n lang ��n c�u th�n!")
	elseif (GetTeamSize() ~= 2) or (IsCaptain() ~= 1) then		-- (������Ա����)��(�Լ����Ƕӳ�)��תȱʡ�Ի�
		default_talk()
	else					-- ���������������ҿ�ʼ������
		His_ID,Her_ID,His_world67,Her_world67 = check_team();
--		check_married_team();
		if (Her_ID == 0) then				-- ��������Ů�Գ�Ա��תȱʡ�Ի�
			Talk(1,"","Hai v� ���ng ���ng l� ��i nam nh�n l�i mu�n k�t h�n g� ch�? ��ng �em l�o gi� n�y ra ��a gi�n!")
--			default_talk()
		elseif (OtherPlayer(Her_ID,GetFaction) == "emei") then		-- ��׼Ȣ���
			Talk(1,"","Mu�n c��i ni c� sao? N�u c�c ng��i th�t t�m y�u nhau, t�t nh�t h�y ��n khuy�n c� ta ho�n t�c!")
		elseif (GetBit(His_world67,24) == 1) then				-- �з��ѻ�
			Talk(1,"","Ng��i �� c� th� t� r�i! L� n�o l�i mu�n tam th� t� thi�p!?")
		elseif (GetBit(Her_world67,24) == 1) then		-- Ů���ѻ�
			Talk(1,"","<#> Ng��i ta"..OtherPlayer(Her_ID,GetName).."<#> �� g� qua r�i, sao c� th� m�t v� g� cho hai ch�ng ���c!")
		elseif (GetLevel() < 20) or (OtherPlayer(Her_ID,GetLevel) < 20) then		-- ���˵ȼ�����
			Talk(1,"","Tu�i ng��i c�n nh�, vi�c h�n nh�n ��i s� ��i ��n l�c tr��ng th�nh h�y t�nh!")
		else									-- ������������
			SetTaskTemp(7,Her_ID)
			SetTaskTemp(6,His_ID)
			Say("Ch�ng trai tr�! C� ph�i mu�n k�t duy�n c�ng c� g�i b�n c�nh ng��i?",2,"D�! Con mu�n h�i c��i c� ta/qmarry_get","Kh�ng, ch�ng ta ch� t�nh c� �i ngang qua th�i/qmarry_no")
		end
	end
end

function qmarry_get()			-- �з�����������
	SetTaskTemp(5,1)
	His_ID,Her_ID,His_world67,Her_world67 = check_team()
	if (GetTeamSize() ~= 2) or (GetTaskTemp(7) ~= Her_ID) then			-- ���鷢���˸ı䣬�ܾ�������
		Talk(1,"","Ng��i do d� qu� l�u, c� n��ng �� �� �i m�t r�i!")
	else
		Her_Name = OtherPlayer(Her_ID,GetName)
		Talk(1,"","<#> T�t! Ng��i v� "..Her_Name.."<#> qu� nhi�n tr�i sinh m�t c�p, ta l�p t�c ��n n�i v�i c� �y xem � ki�n th� n�o.")
		Msg2Player("<#> B�n quy�t ��nh c�u h�n "..Her_Name.."<#> �em t�m t� c�a m�nh n�i cho Nguy�t H� L�o Nh�n nghe xong, b�t ��u im l�ng ch� ��i s� ph�n �ng c�a c� ta.")
		OtherPlayer(Her_ID,Msg2Player,GetName().."<#> c�u h�n v�i ng��i, ng��i ��ng � g� cho anh ta kh�ng? Mau �em nh�ng t�m t� trong l�ng n�i  cho Nguy�t H� L�o Nh�n nghe �i.")
		OtherPlayer(Her_ID,SetTaskTemp,5,1)
		OtherPlayer(Her_ID,SetTaskTemp,6,His_ID)
		OtherPlayer(Her_ID,SetTaskTemp,7,Her_ID)
	end
end

function male_cancel()			-- �з���ȡ������
	do_qmarry_cancel()
	Talk(1,"","C��ng �p kh�ng h�nh ph�c, n�u c� ta nh�t th�i ch�a th� quy�t ��nh ���c th� ��nh ph�i ��i 1 th�i gian sau hay t�nh!")
	Msg2Player("Ng��i ��p tr��c m�t ng��i l�i t� v� nh�t nh�t, b� � ni�m c�u h�n v�i c� �y.")
	OtherPlayer(Her_ID,Msg2Player,GetName().."<#> t� ch�i l�i c�u h�n c�a b�n.")		-- ��Ϣ�Ƿ���Ů����ע����Ϣ�������
end

function male_hurry()		-- ��飺�ߴ�
	Her_ID = GetTaskTemp(7)
	OtherPlayer(Her_ID,Msg2Player,GetName().."<#> c�u h�n v�i ng��i, ng��i ��ng � g� cho anh ta kh�ng? Mau �em nh�ng t�m t� trong l�ng n�i  cho Nguy�t H� L�o Nh�n nghe �i!")
end

----------------------- ����顢ȷ�ϻ��� -------------
function female_cancel()		-- Ů�����ܾ�����
	do_qmarry_cancel()
	Talk(1,"","Ng��i kh�ng b�ng l�ng, ta ��nh ph�i b�o tin n�y cho h�n th�i!")
	Msg2Player("Con c�c m� c� t��ng l� Thi�n nga? B�n �� ko do d� c� tuy�t ngay l�i c�u h�n n�y.")
	OtherPlayer(His_ID,Msg2Player,GetName().."<#> �� c� tuy�t l�i c�u h�n c�a ng��i, ti�u t� ti�p t�c c� g�ng l�n!")
end

function female_yes()			-- Ů������������
	His_ID,Her_ID,His_world67,Her_world67 = check_team()
	His_Name	= OtherPlayer(His_ID,GetName)
	Her_Name	= GetName()
	if (GetBit(Her_world67,24) == 1) then				-- �ѻ�
		Talk(1,"","Ng��i �� c� phu qu�n, sao c�n mu�n l�y ng��i kh�c?")
	elseif (GetTeamSize() ~= 2) then		-- ���������Ѹı�
		Talk(1,"","Ta c�n ch�a th�y t�n lang c�a ng��i. N�u ng��i mu�n ta t�c h�p, ph�i c�ng nhau ��n n�i chuy�n v�i ta!")
	elseif (His_ID ~= GetTaskTemp(6)) then			-- �ӳ����������
		Talk(1,"","H�nh nh� ng��i mu�n c�u h�n v�i ng��i kh�c ch�ng? R�t cu�c ng��i mu�n l�y ai ��y? Ta c� ch�t m� h�!")
	else				-- �����Ѿ����ϣ����н�鴦��
		DoMarry(GetTeam())
		
				-- �������жϻ�����ϵ�Ƿ�����ȷ��������ֱ�ӷ��� by zero 2007/06/27
		local szMaleName, szFemaleName = "","";
		local nOldPlayerIndex = PlayerIndex;
		
			PlayerIndex = His_ID;
			szMaleName = GetMateName();
			PlayerIndex = nOldPlayerIndex;
			szFemaleName = GetMateName();
			
		if szMaleName == "" or szFemaleName=="" then
			Msg2Player("<color=yellow>Ch�a t�o ���c quan h� ph�i ng�u, h�y th� l�i sau!<color>");
			OtherPlayer(His_ID, Msg2Player, "<color=yellow>Ch�a t�o ���c quan h� ph�i ng�u, h�y th� l�i sau!<color>");
			return
		end;
		
		
		SetTaskTemp(5,0)		--ȡ�����״̬
		SetTaskTemp(6,0)
		SetTaskTemp(7,0)
		OtherPlayer(His_ID,SetTaskTemp,5,0)
		OtherPlayer(His_ID,SetTaskTemp,6,0)
		OtherPlayer(His_ID,SetTaskTemp,7,0)
		Her_world67 = SetBit(Her_world67,24,1)		-- ���ý�����
		His_world67 = SetBit(His_world67,24,1)
		if (GetBit(Her_world67,2) == 0) and (GetLevel() >= 50) then		-- Ů���ͽ�ָ
			Her_world67 = SetBit(Her_world67,2,1)		-- ���ý����������ͽ�ָ��
			present_ring(Her_ID)
		end
		if (GetBit(His_world67,2) == 0) and (OtherPlayer(His_ID,GetLevel) >= 50) then		-- �з��ͽ�ָ
			His_world67 = SetBit(His_world67,2,1)		-- ���ý����������ͽ�ָ��
			present_ring(His_ID)
		end
		SetTask(67,Her_world67)
		OtherPlayer(His_ID,SetTask,67,His_world67)

		Msg2Player("<#> B�n �� ch�p nh�n l�i c�u h�n c�a "..His_Name.."<#> ch�c m�ng hai  v� b�ch ni�n giai l�o, tr�m n�m h�nh ph�c!")
		OtherPlayer(His_ID, Msg2Player, Her_Name.."<#> �� ti�p nh�n l�i c�u h�n c�a b�n, ch�c m�ng hai v� b�ch ni�n giai l�o, tr�m n�m h�nh ph�c!")
		OtherPlayer_talk(His_ID, "Ch�c m�ng hai v�, d�y t� h�ng �� th�t ch�t m�i l��ng duy�n n�y r�i!")
		OtherPlayer_talk(Her_ID, "Ch�c m�ng hai v�, d�y t� h�ng �� th�t ch�t m�i l��ng duy�n n�y r�i!")
		AddGlobalCountNews("<#> ch�ng ta c�ng ch�c m�ng"..His_Name.."<#> v�i"..GetName().."<#> hai v� t�n nh�n v�nh k�t ��ng t�m, b�ch ni�n giai l�o!",3)
		
	end
end

function present_ring(PlayerId)			-- �ͽ�ָ���жϡ��ñ����������������У�
	OldPlayer = PlayerIndex
	PlayerIndex = PlayerId

	item_level = floor(GetLevel() / 10) + 2
	if (item_level > 10) then
		item_level = 10
	end
--	item_lucky = (item_level - 3) * 5
	p = {0,0,0,0,0,0}
	j = item_level - 6
	if (j > 6) then j = 6 end
	for i=1,j do
		if (item_level - i - 2 < 0) then
			p[i] = 0
		else
			p[i] = item_level - i - 2
		end
	end
	AddItem(0,3,0,item_level,random(0,4),5,p[1],p[2],p[3],p[4],p[5],p[6])
	Msg2Player("Nguy�t L�o t�ng cho b�n m�t chi�c nh�n ")
	PlayerIndex = OldPlayer
end

----------------------- �޸�������ϵ -------------------
function fix_marry()
	if( GetTeamSize() == 2 ) then
		His_ID,Her_ID,His_world67,Her_world67 = check_team()
		His_Name = GetName()
		Her_Name = OtherPlayer(Her_ID,GetName)
		if (His_ID ~= 0) and (Her_ID ~= 0) and (GetBit(His_world67,24) == 1) and (GetBit(Her_world67,24) == 1) and (OtherPlayer(His_ID,GetMateName) == "") and (OtherPlayer(Her_ID,GetMateName) == "") then		-- ���ԡ����˶��顢���ѻ飬����Ϊ�����޸�
			Talk(1,"","V� ch�ng c�i nhau l� chuy�n b�nh th��ng, ch�n trong s�ng c�n khua, ��ng v� chuy�n n�y m� th� h�n nhau. N�o, l�i ��y! N�m tay nhau h�a gi�i!")
			DoMarry(GetTeam())
			Msg2Player("<#> B�n v� "..Her_Name.."<#> �� ph�c h�i quan h� ph�i ng�u")
			OtherPlayer(Her_ID,Msg2Player,"<#> B�n v� "..His_Name.."<#> �� ph�c h�i quan h� ph�i ng�u")
		elseif (GetBit(GetTask(67),24) == 1) and (GetMateName() == "") then			-- �����޸������Է�����������
			if (GetSex() == 0) then
				Talk(1,"","V� ch�ng c�i nhau l� chuy�n b�nh th��ng, ch�n trong s�ng c�n khua. Th� n�y nh�, ng��i d�t v� t�i ��y �� ta khuy�n nh� c� ta!")
			else
				Talk(1,"","V� ch�ng c�i nhau l� chuy�n b�nh th��ng, ch�n trong s�ng c�n khua. Th� n�y nh�, ng��i c�ng ch�ng t�i ��y �� ta khuy�n nh� h�n!")
			end
		else			-- �Լ�����������
			if (GetSex() == 0) then
				Talk(1,"","R� r�ng l� kh�ng c� chuy�n g�, ch�ng trai tr� ��nh tr�u c�t gi� n�y ch�ng?")
			else
				Talk(1,"","R� r�ng l� kh�ng c� chuy�n g�, c� n��ng ��ng n�i d�i!")
			end
		end
	else
		if (GetSex() == 0) then
			Talk(1,"","V� ch�ng c�i nhau l� chuy�n b�nh th��ng, ch�n trong s�ng c�n khua. Th� n�y nh�, ng��i d�t v� t�i ��y �� ta khuy�n nh� c� ta!")
		else
			Talk(1,"","V� ch�ng c�i nhau l� chuy�n b�nh th��ng, ch�n trong s�ng c�n khua. Th� n�y nh�, ng��i c�ng ch�ng t�i ��y �� ta khuy�n nh� h�n!")
		end
	end
end

----------------------- ������ -----------------------
function divorce()
	if (GetTeamSize() == 2) and (IsCaptain() == 1) then		-- ��ӡ�����Ϊ2���Լ��Ƕӳ�
		His_ID,Her_ID,His_world67,Her_world67 = check_team()
		His_Name = OtherPlayer(His_ID,GetName)
		Her_Name = OtherPlayer(Her_ID,GetName)
		if (GetBit(His_world67,24) == 1) and (OtherPlayer(His_ID,GetMateName) == Her_Name) and (GetBit(Her_world67,24) == 1) and (OtherPlayer(Her_ID,GetMateName) == His_Name) then		-- ˫������ϵ��ȷ
			Say("Ly h�n kh�ng ph�i l� tr� ��a, ng��i trong giang h� s� v� chuy�n ly h�n m� ��nh gi� th�p c�c ng��i. C� mu�n suy ngh� l�i kh�ng?",2,"Ch�ng ta �� quy�t ��nh r�i, xin l�m th� t�c ly d� �i!/divorce_yes","�� ta suy ngh� k� l�i xem/no")
		else
			Talk(1,"","R�t cu�c ng��i mu�n ly h�n v�i ai? Ng��i n�y v�n kh�ng ph�i l� ng��i ph�i ng�u c�a ng��i!")
		end
	else
		Talk(1,"","N�u nh�t ��nh mu�n ly h�n, ph�i c�ng v� ng��i ��n l�m th� t�c ly h�n!")
	end
end

function divorce_yes()
	His_ID,Her_ID,His_world67,Her_world67 = check_team()
	if (GetTeamSize() ~= 2) or (His_ID == 0) or (Her_ID == 0) or (OtherPlayer(His_ID,GetMateName) ~= Her_Name) or (OtherPlayer(Her_ID,GetMateName) ~= His_Name) then			-- �������״̬
		Talk(1,"","Ng��i do d� qu� l�u, ph�i ng�u c�a ng��i �� �i r�i!")
	elseif (GetCash() >= 50000) then
		Pay(50000)
		UnMarry(GetTeam())						-- ���������ϵ]
--Msg2Player("His_world67="..His_world67.."  Her_world67="..Her_world67)
		His_repute = OtherPlayer(His_ID,GetRepute)				-- �з���ش���
		if (His_repute > 10) then His_repute = 10 end
		OtherPlayer(His_ID,AddRepute,-1 * His_repute)								-- ���з�����10��(����10����Ϊ0)
		His_DivorceTimes = GetByte(His_world67,2) + 1								-- ����������
		if (His_DivorceTimes > 100) then His_DivorceTimes = 100 end			-- ����100�β��ټ�¼
		His_world67 = SetByte(His_world67,2,His_DivorceTimes)						-- ������д��
		His_world67 = SetBit(His_world67,24,0)											-- ����״̬
--Msg2Player("His_world67="..His_world67)
		OtherPlayer_talk(His_ID,"N�u v�y�Hi�n t�i h�n nh�n c�a hai ng��i �� ���c h�y b�! Ng��i �� kh�i ph�c t� do r�i.")		-- Ϊ˫���������Ϣ
		Her_repute = OtherPlayer(Her_ID,GetRepute)				-- Ů����ش���
		if (Her_repute > 10) then Her_repute = 10 end
		OtherPlayer(Her_ID,AddRepute,-1 * Her_repute)								-- ��Ů������10��(����10����Ϊ0)
		Her_DivorceTimes = GetByte(Her_world67,2) + 1
		if (Her_DivorceTimes > 100) then Her_DivorceTimes = 100 end
		Her_world67 = SetByte(Her_world67,2,Her_DivorceTimes)
		Her_world67 = SetBit(Her_world67,24,0)
--Msg2Player("Her_world67="..Her_world67)

		OtherPlayer(His_ID,SetTask,67,His_world67)
		OtherPlayer(Her_ID,SetTask,67,Her_world67)
		OtherPlayer_talk(Her_ID,"N�u v�y�Hi�n t�i h�n nh�n c�a hai ng��i �� ���c h�y b�! Ng��i �� kh�i ph�c t� do r�i.")
	else
		Talk(1,"","Ng��i ch�a mang �� ph� th� t�c, c�n ph�i c� 5 v�n l��ng l�m th� t�c!")
	end
end

----------------------- �ϻ������ ---------------------
function gather_bonus()
	Say("Kh�ng sai, 3 Bao h�p hoan, 3 kh�n Uy�n ��ng v� 3 N� t�nh � th� c� th� ��i 1 vi�n Th�y Tinh v� 1 T�m T�m T��ng �nh ph�; \n 2 Bao h�p hoan, 2 kh�n Uy�n ��ng v� 2 N� t�nh � c� th� ��i 1 vi�n Ng�n Nguy�n B�o v� 1 T�m T�m T��ng �nh ph�; \n 1 Bao h�p hoan, 1 kh�n Uy�n ��ng v� 1 N�  t�nh � c� th� ��i 1 T�m T�m T��ng �nh ph�. \n ng��i mu�n ��i lo�i n�o?",4,"Ta ��i Th�y Tinh v� T�m T�m T��ng �nh ph� /gather_bonus1","Ta ��i Ng�n Nguy�n B�o v� T�m T�m T��ng �nh ph� /gather_bonus2","Ta ch� ��i T�m T�m T��ng �nh ph� /gather_bonus3","Oh, xin l�i, ta nh� nh�m!/no")
end

function gather_bonus1()
	if (GetItemCount(344) >= 3) then				-- �ϻ���
		if (GetItemCount(345) >= 3) then			-- ԧ����
			if (GetItemCount(346) >= 3) then		-- �����
				for i=1,3 do
					DelItem(346)
					DelItem(345)
					DelItem(344)
				end
				AddItem(6,1,18,1,0,0,0)			-- ������ӡ��
				i = 238 + random(0,2)		-- �����һ�ű�ʯ
				AddEventItem(i)
				Talk(1,"","Hay l�m! Ta t�ng ng��i 1 vi�n th�y tinh v� 1 t�m T�m T�m T��ng �nh Ph�. ��ng th�i ch�c t�nh y�u hai ng��i g�n b� keo s�n!")
			else
				Talk(1,"","Ng��i kh�ng c� 3 c�i N� T�nh �, t�m �� r�i h�y ��i nh�!")
			end
		else
			Talk(1,"","Ng��i kh�ng c� 3 c�i Kh�n Uy�n ��ng, t�m �� r�i h�y ��i nh�!")
		end
	else
		Talk(1,"","Ng��i kh�ng c� 3 c�i Bao h�p hoan, t�m �� r�i h�y ��i nh�!")
	end
end

function gather_bonus2()
	if (GetItemCount(344) >= 2) then				-- �ϻ���
		if (GetItemCount(345) >= 2) then			-- ԧ����
			if (GetItemCount(346) >= 2) then		-- �����
				for i=1,2 do
					DelItem(346)
					DelItem(345)
					DelItem(344)
				end
				AddItem(6,1,18,1,0,0,0)			-- ������ӡ��
				AddEventItem(342)
				Talk(1,"","Hay l�m! Ta t�ng ng��i 1 Ng�n Nguy�n b�o v� 1 t�m T�m T�m T��ng �nh Ph�. ��ng th�i ch�c t�nh y�u hai ng��i g�n b� keo s�n!")
			else
				Talk(1,"","Ng��i kh�ng c� 2 c�i N� T�nh �, t�m �� r�i h�y ��i nh�!")
			end
		else
			Talk(1,"","Ng��i kh�ng c� 2 c�i Kh�n Uy�n ��ng, t�m �� r�i h�y ��i nh�!")
		end
	else
		Talk(1,"","Ng��i kh�ng c� 2 c�i Bao h�p hoan, t�m �� r�i h�y ��i nh�!")
	end
end

function gather_bonus3()
	if (HaveItem(344) == 1) then				-- �ϻ���
		if (HaveItem(345) == 1) then			-- ԧ����
			DelItem(344)
			DelItem(345)
			AddItem(6,1,18,1,0,0,0)			-- ������ӡ��
			Talk(1,"","Hay l�m! Ta t�ng ng��i 1 t�m T�m T�m T��ng �nh Ph�. ��ng th�i ch�c t�nh y�u hai ng��i g�n b� keo s�n!")
		else
			Talk(1,"","Ng��i kh�ng c� Kh�n Uy�n ��ng, t�m �� r�i h�y ��i nh�!")
		end
	else
		Talk(1,"","Ng��i kh�ng c� Bao h�p hoan, t�m �� r�i h�y ��i nh�!")
	end
end

-------------- 2004-8-22 ��Ϧ���� ------------------
function present_QiXi( nPlayerIndex )
	local nPreservedPlayerIndex = PlayerIndex;
	
	PlayerIndex = nPlayerIndex;

	Talk( "H�m nay ��ng v�o r�m th�ng b�y, Nguy�t L�o s� t�ng m�t m�n qu� ��c bi�t! Ch�c ph�c 2 ng��i ��u b�c r�ng long!" );
	-- ��2����������ӡ����
	for i = 1, 2 do
		AddItem( 6, 1, 18, 1, 0, 0 ,0);
	end
	Msg2Player( "B�n nh�n ���c 2 T�m T�m T��ng �nh ph�!" );
	-- ��9�䡰õ�廨��
	for i = 1, 9 do
		AddItem( 6, 0, 20, 1, 0, 0 ,0);
	end	
	Msg2Player( "B�n nh�n ���c  9 b�ng hoa h�ng!" );
	-- 50��������Ҽ���1������ɽ��¶��
	if( GetLevel() >= 50 ) then
		AddItem(6, 1, 72, 1, 0, 0, 0);
		Msg2Player( "B�n nh�n ���c m�t b�nh Thi�n S�n B�o L�!" );
	end
	
	PlayerIndex = nPreservedPlayerIndex;
end

----------------------- end ----------------------------
function no()
end