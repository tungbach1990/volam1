-- �嶾 ·��NPC ����կ���Ʋ�а 40������
-- by��Dan_Deng(2003-08-05)
-- update by: xiaoyang(2004\4\13) ����90����������

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")


Include("\\script\\global\\skills_table.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>Ng� ��c Gi�o ch�ng ta c� v� v�n ��c d��c, c� m�t s� ��c d��c l� d�ng h�ng tr�m lo�i ��c v�t m� luy�n ch�, lo�i ��c b� truy�n n�y, ch� c�n ch�m nh� m�t ch�t th�i, th� s� ch�t kh�ng c� v�t t�ch"
	G_TASK:OnMessage("Ng� ��c", tbDailog, "DialogWithNpc")
	tbDailog:AddOptEntry("Ta ��n t�m �ng c� vi�c kh�c", main2)
	tbDailog:Show() 
end

function main2()
	UTask_wu = GetTask(10)
	Uworld124 = GetTask(124)
	if(GetSeries() == 1) and (GetFaction() == "wudu") then
		if((UTask_wu == 40*256+10) and (HaveItem(143) == 1)) then		-- ���������
			L40_prise()
		elseif((UTask_wu == 40*256) and (GetLevel() >= 40)) then		--40������
			Say("Ng��i h�y �i ��n Kim X� Huy�t tr�ch b�t cho ta m�t con Nh�n K�nh V��ng M�ng X�,ta mu�n u�ng m�u c�a n� �� t�ng c��ng c�ng l�c ",2,"Tu�n l�nh!/L40_get_yes","Thu�c h� v�n c�n m�t chuy�n kh�c. /L40_get_no")
		else							-- ����Ի�
			Skill150Dialog("��y l� m�t th� gi�i c��ng gi� sinh t�n, mu�n ti�p t�c s�ng th� h�y nhanh nhanh m� �i luy�n c�ng �i!")
		end
	elseif (Uworld124 == 10) then
		Talk(9,"Uworld_envelop","V�n B�t T�!","Ai da! Tr�ng th�t l� ��p trai! Ng��i t�m ti�u V�n n�y c� vi�c g�?","Mau ��a thu�c gi�i �m D��ng Ti�u ra ��y!","Th� ra l� ng��i mu�n l� ah h�ng! ���c th�i! Ch� c�n ng��i ch�u � l�i ��y v�i ta th� mu�n g� c�ng ���c"," Ph�! Ng��i l� m�t k� nham hi�m ��c �c, n�u kh�ng ��a thu�c gi�i ra ��y, th� s� kh�ng ai c�n nh�n ra b� d�ng c�a ng��i n�a!","H�! C�i t�n kh�ng bi�t t�t x�u l� g�! ���c! � ��y ta c� m�t b�c th�, ng��i h�y mang gi�p ta ��n ���ng M�n giao cho Tuy�t Xu�n T�u ���ng D�. R�i ng��i s� c� c�i ng��i mu�n. ","Ta d�a v�o ��u �� tin ng��i?","L�o t� ��y m�c d� ti�ng t�m tr�n giang h� c� h�i x�u. Nh�ng m� ng��ih�y c� th� �i h�i xem, c� ph�i ta l� ng��i lu�n bi�t gi� ch� T�n hay kh�ng","T�m th�i tin ng��i m�t l�n")
	elseif (Uworld124 == 20 ) and (HaveItem(385) == 0) then
      Talk(1,"","B�ng h�u! ��ng c� v�i v�ng nh� v�y! Th� ta v�n c�n ch�a ��a,ng��i l�m sao c� th� �i g�p ���ng D� ")
      AddEventItem(385)
      Msg2Player("Ti�p nh�n th� t�n c�a V�n B�t T� ")
	elseif (Uworld124 == 30) and (HaveItem(386) == 1) then
		DelItem(386)
		SetTask(124,35)
      Talk(5,"Uworld124_jump","Sao h�?","�y! �� b� h�n ph�t hi�n ra trong th� c� ��c!","Sao l�i th� ���c! Ta b� ��c r�t b� m�t c�n th�n h�n l�m sao c� th� �i�u tra ra ���c! ��a l�i cho ta!","A!...Tr�n th� n�y l�i c� m�t lo�i k�ch ��c kh�c!","V�n B�t T�! H�i ng��i th� c�ng s� ��n l�c b� ng��i h�i! Ng��i s�ng kh�ng h�t ng�y h�m nay ��u!")        
	elseif (Uworld124 == 35) then
		Talk(1,"Uworld124_jump","Qua ��y! C�ng ch�i v�i ti�u V�n �i!")
	elseif (Uworld124 == 40) and (HaveItem(387) == 0) then
		SetTask(124,35)
		Talk(2,"Uworld124_jump","V�n l�o t�c! Mau ��a m�t ph�n thu�c gi�i ra ��y!","Ph�! L�c n�y ta c� h�i s� su�t n�n m�i tr�ng k� c�a ng��i! ��ng c� qu� v�ng t��ng! Xem ��y! ")
	elseif (Uworld124 >= 40) then			-- �������
		Talk(1,"","Ng��i. Th�t qu� �c ��c! ")
	else
		Skill150Dialog("Ng� ��c Gi�o ch�ng ta c� v� v�n ��c d��c, c� m�t s� ��c d��c l� d�ng h�ng tr�m lo�i ��c v�t m� luy�n ch�, lo�i ��c b� truy�n n�y, ch� c�n ch�m nh� m�t ch�t th�i, th� s� ch�t kh�ng c� v�t t�ch")
	end
end;

function Skill150Dialog(szTitle)
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = format("<npc>%s", szTitle)
	G_TASK:OnMessage("Ng� ��c", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end

function L40_get_yes()
	Talk(1,"","���c r�i! H�y nh� l� ph�i �i t�m m�t mi�ng 'x� h��ng' tr��c, n�u kh�ng ng��i s� kh�ng th� kh�ng ch� ���c r�n")
	SetTask(10,40*256+10)
	AddNote("�i ��n Kim X� huy�t tr�ch �� b�t m�t con Nh�n K�nh v��ng M�ng X� cho V�n B�t T� ")
	Msg2Player("�i ��n Kim X� huy�t tr�ch �� b�t m�t con Nh�n K�nh v��ng M�ng X� cho V�n B�t T� ")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(1,"","Ng��i l� m�t trong s� nh�ng ng��i �� v�o trong Kim X� tr�ch m� c�n s�ng s�t tr� v�. Xem ra th� b�n l�nh c�a ng��i qu� kh�ng t�m th��ng ch�t n�o")
	SetTask(10,50*256)
	DelItem(143)
	SetRank(53)
--	AddMagic(356)
--	AddMagic(73)
	add_wu(50)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng B�n!: �� ���c th�ng l�m: V� ��ng La S�t! H�c ���c v� c�ng: Xuy�n Y Ph� Gi�p, V�n ��c Th�c T�m ")
	AddNote("Ti�n v�o Kim X� tr�ch b�t ���c Nh�n K�nh v��ng M�ng X�, ���c th�ng l� V� �u La S�t ")
end;

function Uworld_envelop()
	AddEventItem(385)
	SetTask(124,20)
	Msg2Player("Ti�p nh�n th� t�n c�a V�n B�t T�. ")
	AddNote("Ti�p nh�n th� t�n c�a V�n B�t T�, �i t�m ���ng D�. ")
end

function Uworld124_jump()
	SetFightState(1)
	NewWorld(234,1616,3195)
end
