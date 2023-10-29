---��ԭ����\�䵱��\�䵱��\npc\wdnpc06.lua
--description: �䵱������Ȫ���䵱40������
--author: yuanlan	
--date: 2003/5/15
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-17)
-- updage by xiaoyang(2004\4\15) �䵱90������
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>G�n ��y ta c� r�t nhi�u vi�c gi�i quy�t, ng��i ��n ��y c� vi�c g�."
	tbDailog:AddOptEntry("Nhi�m v� k� n�ng c�p 150", dailog150skill)
	tbDailog:AddOptEntry("Mu�n th�nh gi�o vi�c kh�c", org_dailog)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName,tbDailog , nNpcIndex)
	tbDailog:Show()
end

function org_dailog()
	UTask_wd = GetTask(5)
	Uworld129 = GetTask(129)
	if((UTask_wd == 40*256) and (GetLevel() >= 40) and (GetFaction() == "wudang")) then
		Say("Ng��i c� th� gi�p ta kh�ng? Ch��ng m�n mu�n ta �em <color=Red>1 l� th�<color> ��n <color=Red>K� Qu�n ��ng<color> ��a cho <color=Red>Nhu�n N��ng<color>, ��t nhi�n ta �ang c� chuy�n g�p, ng��i thay ta ��a th� ���c kh�ng?", 2, "Kh�ng th�nh v�n ��!/L40_get_yes", "Xin l�i, ta c�n c� vi�c kh�c /L40_get_no")
	elseif (UTask_wd >= 40*256+20) and (UTask_wd <= 40*256+40) and (HaveItem(163) == 0) then		-- ���߶���
		AddEventItem(163)
		Talk(1,"","Ng��i th�t l� m�ng! Th� c�a ch��ng m�n �� kh�ng c�m c�n mu�n ch�y n�a?")
	elseif (UTask_wd == 40*256+60) and (HaveItem(164) == 1) then					--������Ļ���
		Talk(2, "", "Chu s� huynh! Ta �� gi�p huynh ��a th� r�i, ��y l� th� h�i �m c�a Nhu�n N��ng!", "V�t v� cho ng��i qu�! �i giao l� th� h�i �m n�y cho Ch��ng m�n �i! Ch��ng m�n � trong T� Ti�u �i�n.")
		Msg2Player("V� t�i n�i V� �ang t�m Chu V�n Tuy�n, bi�t ���c n�n giao th� cho ch��ng m�n. ")
		AddNote("V� t�i n�i V� �ang t�m Chu V�n Tuy�n, bi�t ���c n�n giao th� cho ch��ng m�n ")
		SetTask(5,40*256+80)
	elseif (UTask_wd == 40*256+80) and (HaveItem(164) == 0) then			-- ���߶���
		AddEventItem(164)
		Talk(1,"","Ng��i �� qu�n th� � ch� ta r�i!")
	elseif (Uworld129 == 10) then
		Talk(12,"Uworld129_admit","��o huynh l� m�t trong 6 v� h�o ki�t V� �ang! T�i h� �� nghe danh t� l�u, h�m nay m�i ���c l�n n�i th�nh gi�o.","T�t!.Chu m� �� l�u ch�a c� ��i th� th�c th�, ch�n tay ng�a ng�y l�m r�i!"," V� �ang ��o gia ti�n h��ng, ti�u t� kh�ng d�m qua m�t. L�m sao ta d�m t� ��u nh� v�y?","Ta v�n kh�ng th�ch ch�n �p k� kh�c, C�c h� l�n ��u l�n V� �ang, c�ch t� th� do ng��i quy�t ��nh."," V� h�c nh�t ��o l�u truy�n ��n ng�y nay, t� c� c� c�c ph�n n�i ngo�i gia. Xin h�i n�n xem tr�ng lo�i n�o?","N�i gia luy�n kh�, ngo�i gia luy�n th�n. Kh�ng c� th�n th� t�t th� l�m sao ��nh th�n? Do �� n�n xem tr�ng ngo�i gia."," Kh�ng ph�i! Thi�n ��a v�n v�t, t�o h�a s� nhi�n. N�u l�y t�m ng� kh�, l�y kh� quan t�c, t�c th�ng t� nhi�n m�i tu luy�n ���c ch�nh ��o.","T�m g�? Kh� g�? N�u m�t ng��i c� 3, 5 b�nh, h�ng ng�y n�n m�a ra m�u, th� c�i g� g�i l� thi�n ��a."," V� c�ng m�nh nh�t bi�u hi�n � b�n ngo�i. Nh�ng.....","���c r�i! Ta c�i kh�ng l�i ng��i. N�u mu�n ch�ng minh nh�ng th� n�y, hay l� ng��i �i t�m S� �� L� Thi�n M�c c�a ta!"," Xin Chu ��i hi�p th� l�i","�i mau! Ng��i l�m ta ch�u h�t n�i r�i!")
   elseif(Uworld129 == 30)then
   	Talk(6,"Uworld129_admit2","B�ng h�u! Mau qua ��y!","Chu huynh c� g� ch� gi�o?","�! Cho ng��i xem th� n�y!",".....Th� nh�? Ch�c m�ng Chu huynh!","Ha ha! Cha m� � nh� ��i ta, ta ph�i l�p t�c xu�ng n�i! Nh� B�ng h�u chuy�n l�i cho S� huynh �� ta gi�m."," � ��i l�y ch� hi�u l�m ��u! Chu huynh y�n t�m!")
   elseif (Uworld129 > 10) and (Uworld129 < 60)then
   	Talk(1,"","V� �ang gi� v� tr� quan tr�ng c�a v� l�m Trung Nguy�n, ��n V� �ang b�n lu�n v� v� c�ng l� ng��i t�m ��ng ch� r�i.")
	elseif (UTask_wd == 40*256+20) then
		Talk(1,"","<color=Red>Nhu�n N��ng<color> � trong <color=Red>K� Qu�n ��ng<color>.")
	elseif (UTask_wd > 40*256+20) and (UTask_wd < 40*256+80) then					--�Ѿ��ӵ�40��������δ���
		Talk(1,"","G�p Nhu�n N��ng ch�a? M�i vi�c th� n�o?")
	elseif (UTask_wd >= 50*256) and (GetFaction() == "wudang") then					--�Ѿ����40��������δ��ʦ
		Talk(1,"","�n o�n gi�a S� ph� v� Nhu�n N��ng, ta c� nghe qua, ch� v� S� ph� h�nh nh� kh�ng mu�n nh�c ��n, ch�ng ta l�m �� t� c�ng kh�ng n�n h�i nhi�u qu�.")
	elseif (UTask_wd >= 70*256) then							--�Ѿ���ʦ
		Talk(1,"","Ch�ng ta ���c l�m ��ng m�n, t�c l� c� duy�n, ng��i h�u duy�n sau n�y s� g�p l�i, xin h�y b�o tr�ng! ")
	else
		dailog150skill()
	end
end

function dailog150skill()
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
		local tbDailog = DailogClass:new(szNpcName)
		tbDailog.szTitleMsg = "<#><npc>Ta lu�n t� khuy�n m�nh t�i V� �ang S�n ch�m ch� luy�n v� c�ng, �em t�t c� tinh l�c ��a v�o tu luy�n v� h�c, t� tr��c ��n gi� kh�ng c� ngh� ��n vi�c l�y v� sinh con, cho ��n b�y gi� th� �� qua c�i th�i xu�n �y r�i, trong l�ng c�ng c� ch�t u s�u."
	G_TASK:OnMessage("Th�y Y�n", tbDailog, "DialogWithNpc")
	tbDailog:Show() 
end

function L40_get_yes()
	Talk(1,"","�a t�! <color=Red>Nhu�n N��ng<color> � trong <color=Red>K� Qu�n ��ng<color>, h�y mang b�c th� n�y �i!")
	Msg2Player("���c ch��ng m�n giao l� th� �� ��a cho Nhu�n N��ng. ")
	AddEventItem(163)
	SetTask(5, 40*256+20)
	AddNote("T�i b� h� Thanh Thu� g�p Chu V�n Tuy�n, nh�n nhi�m v� Nhu�n N��ng, ��n ��ng K� Qu�n Ph�c Ng�u s�n ��a th� cho m�t ng��i g�i l� Nhu�n N��ng. ")
	Msg2Player("T�i b� h� Thanh Thu� g�p Chu V�n Tuy�n, nh�n nhi�m v� Nhu�n N��ng, ��n ��ng K� Qu�n Ph�c Ng�u s�n ��a th� cho m�t ng��i g�i l� Nhu�n N��ng. ")
end;

function L40_get_no()
	Say("V�y ta t�m ng��i kh�c gi�p. ")
end;

function Uworld129_admit()
	SetTask(129,20)  --�����������20
	Msg2Player("Sau khi n�i chuy�n v�i Chu V�n Tuy�n, quay l�i t�m L� Thi�n M�c. ")
	AddNote("Sau khi n�i chuy�n v�i Chu V�n Tuy�n, quay l�i t�m L� Thi�n M�c. ")
end

function Uworld129_admit2()
	SetTask(129,40)
	Msg2Player("Sau khi n�i chuy�n v�i Chu V�n Tuy�n, quay l�i t�m L� Thi�n M�c. ")
	AddNote("Chu V�n Tuy�n nh�n th� gia ��nh, ng��i vui m�ng cho h�n, ��p �ng thay h�n n�i v�i L� Thi�n M�c. ")
end
