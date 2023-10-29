-- ؤ�� ��������κ���� 40������
-- by��Dan_Deng(2003-07-28)

Include("\\script\\global\\skills_table.lua")

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	UTask_gb = GetTask(8)
	if (GetSeries() == 3) and (GetFaction() == "gaibang") then
		if (UTask_gb == 40*256+30) then		--40���������
			Talk(2,"L40_prise","�� t� t�ng g�p Tr��ng ��i nh�n v� �� ��a m�t h�m cho �ng ta.","V�y th� ta y�n t�m! Ng��i th�t v�t v�! Chuy�n n�y ta s� b�m r� v�i Bang ch�, phong ng��i l�m ��i �� t� c�p 40 c�a.")
		elseif (UTask_gb == 40*256+10) then		--40��������
			if (HaveItem(236) == 1) then
				Talk(4,"","Ng�y tr��ng l�o! Ta �� gi�t tr� s�t th� Kim Qu�c, ��y l� m�t h�m l�y ���c tr�n ng��i ch�ng.","��a ta xem.....","�! Trong b�c m�t h�m n�y c� vi�t t�n t�t c� nh�ng m�n ph�i v� t�t c� nh�ng ng��i trong tri�u ��nh c�u k�t v�i Kim qu�c. Ph�i giao b�c m�t h�m n�y cho Tr��ng Tu�n ��i nh�n, b�o �ng �y ph�i h�t s�c �� ph�ng.","Ng��i ph�i nhanh ch�ng �i D��ng Ch�u m�t chuy�n!. Tr��ng ��i nh�n hi�n �ang � l� qu�n'H�i h�u'. Ng��i ph�i giao t�n tay b�c m�t h�m n�y cho �ng �y!")
				SetTask(8,40*256+20)
				AddNote("Mang m�t h�m �i giao cho Tr��ng Tu�n ")
				Msg2Player("Mang m�t h�m �i giao cho Tr��ng Tu�n ")
			else
				Talk(1,"","Th�i gian c�p b�ch! Ph�i l�p t�c ti�u tr� ngay nh�ng ch��ng ng�i tr��c m�t Tr��ng ��i nh�n! ")
			end
		elseif ((UTask_gb == 40*256) and (GetLevel() >= 40)) then		--40����������
			Say("Theo tin th�m b�o c�a �� t� � L�m An ��a v�: ph�i ch� h�a trong tri�u ��nh �� li�n k�t v�i b�n s�t th� ng��i Kim. Ch�ng �m m�u s� �m s�t Khu M�t s� Tr��ng Tu�n. Tr��c khi Tr��ng ��i nh�n v� ��n L�m An, ch�ng ta ph�i gi�t s�ch b�n s�t th� ",2,"Xin h�y giao cho �� t�. /L40_get_yes","�� t� c�ng l�c c�n y�u, e kh�ng ���ng n�i tr�ng nhi�m /L40_get_no")
		elseif (UTask_gb == 40*256+20) and (HaveItem(236) == 0) then		-- ��������Ʒ��ʧ����
			AddEventItem(236)
			Talk(1,"","Chuy�n n�y nh�t nh�t ��u kh�ng ���c sai s�t. B�c m�t h�m n�y ng��i nh� ph�i lu�n mang theo b�n ng��i!")
		else
			Skill150Dialog("N�u nh� ��i H� nghi�ng ��, C�i bang ta m�t c�y kh� ch�ng, ch� c� th� c�c cung t�n tu� gi�ng nh� Gia C�t Kh�ng Minh, th� ch�t kh�ng t�.")
		end
	else
		Skill150Dialog("Ng��i ma ta ng��ng m� nh�t l� Gia C�t Kh�ng Minh, ��n ph�t cu�i v�n trung th�nh!")
	end
end;

function Skill150Dialog(szTitle)
	local nNpcIndex = GetLastDiagNpc()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = format("<npc>%s", szTitle)
	G_TASK:OnMessage("C�i Bang", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end


function L40_get_yes()
	Talk(1,"","Ng��i n�n c�n th�n! ")
	SetTask(8,40*256+10)
	AddNote("Nh�n nhi�m v�: Gi�t b�n s�t th� ng��i Kim, b�o v� an to�n cho Tr��ng Tu�n ")
	Msg2Player("Nh�n nhi�m v�: Gi�t b�n s�t th� ng��i Kim, b�o v� an to�n cho Tr��ng Tu�n ")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(3,"","�a t� Ng�y tr��ng l�o! ")
	SetTask(8,50*256)
	SetRank(41)
--	AddMagic(277)
	add_gb(50)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng B�n! �� ���c th�ng l�: C�i Bang Long ��u �� t� ���c h�c Ho�t B�t L�u Th� ")
	AddNote("B�o v� an to�n cho Tr��ng Tu�n, ho�n th�nh nhi�m v� c�p 40, ���c th�ng Long ��u �� t� ")
end;
