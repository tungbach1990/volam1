-- �ٰ���·�ˡ����ι�Ա (�ٰ���183/182)(NewWorld(176,1465,2927))
-- by��Dan_Deng(2003-09-16)
-- Update: Dan_Deng(2004-07-19) ����������90�������޷��õ����ܵ�BUG�Ĳ���

Include("\\script\\global\\skills_table.lua")

function main()
	faction_task = {7,3,2,10,1,6,8,4,5,9}
	faction_name = {"shaolin","tianwang","tangmen","wudu","emei","cuiyan","gaibang","tianren","wudang","kunlun"}
	quest_task = {122,121,123,124,125,126,128,127,129,130}
	LastFactionNo = GetLastFactionNumber()
	if (LastFactionNo < 0) then					-- û�����ɵĲ���������޸����̣�����������
		if (GetFaction() ~= "") then
			WriteLog("Ng��i ch�i' "..GetAccount().."'nh�n v�t'"..GetName().."': m�n ph�i xu�t hi�n l�i, kh�ng th� th�c luy�n k� n�ng c�p 90")
			Say("Ng��i l� ngu�i c�a m�n ph�i n�o? Sao ta c�ng nh�n l�i c�ng kh�ng gi�ng ",0)
		else
			Talk(1,"","Ta v�a m�i tr�nh t�u v�i Ho�ng th��ng c�o l�o v� qu�. Ta d� ��nh s� x�y m�t khu hoa vi�n � L�m An �� t�n h��ng nh�ng ng�y thanh nh�n cu�i ��i. ")
		end
		return
	end

	if (GetFaction() == "wudang") and (GetSeries() == 4) then	-- ֻҪ���䵱�ɾ�������м�飬����������ֱ���޸��˳���û������ļ������������
		MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - 1		-- Ӧ�е���
		GetMagic_total = 	GetTotalSkill() + GetMagicPoint()												-- ʵ�е���
		if (HaveMagic(210) == 1) then GetMagic_total = GetMagic_total - 1 end		-- �������ж����ų���δѧ���Ṧ���˷���-1�Ӷ����µ�������������
		if (HaveMagic(400) == 1) then GetMagic_total = GetMagic_total - 1 end
		n = MagicPoint_total - GetMagic_total
		if (n > 0) then						--��ʵ�е���<Ӧ�е����������ܵ㶪ʧ
			SetTask(137,0)
			Say("Ch�ng trai tr�! ��ng c� n�ng v�i! H�y t�m c�ch ti�u gi�i nh�ng �u phi�n �� �i. Ta �� gi�p ng��i s�a ch�a nh�ng sai l�m �� r�i ",1,"Bi�t r�i/KickOutSelf")
			return
		end
	end

	i = faction_task[LastFactionNo + 1]
	j = quest_task[LastFactionNo + 1]
	k = floor(LastFactionNo/2)
	if (GetTask(2) == 80*256) and (GetSeries() == 1) and (HaveMagic(302) == 0) then
		AddMagic(302,1)				-- �޸�����õ������滨���ܵȼ�Ϊ0���Ĵ���
		Say("Ch�ng trai tr� ��ng v� m�t chuy�n nh� nh� v�y m� bu�n r�u. B� c�c th�i lai. Chuy�n g� r�i c�ng c� th� gi�i quy�t ���c! C� l�n! C� l�n! Kh� kh�! ",0)
	elseif (GetTask(i) == 80*256) and (GetFaction() == faction_name[LastFactionNo+1]) and (GetSeries() == k) and (GetTask(j) == 245) then
		SetTaskTemp(20,0)		-- �����ʱ������׼��ʹ��
		repair90(i)			-- 90�������޸�
		SetTask(j,255)			-- ����״̬�޸�
		WriteLog("Ng��i ch�i' "..GetAccount().."'nh�n v�t'"..GetName().."': k� n�ng c�p 90 �� c�n c� theo m�n ph�i"..i..", s� nhi�m v� "..j.." ho�n th�nh s�a ch�a! ")
		Say("Ch�ng trai tr� ��ng v� m�t chuy�n nh� nh� v�y m� bu�n r�u. B� c�c th�i lai. Chuy�n g� r�i c�ng c� th� gi�i quy�t ���c! C� l�n! C� l�n! Kh� kh�! ",0)
		SetTaskTemp(20,0)		-- �����ʱ�������Ա��´�
	else
		Talk(1,"","Ta v�a m�i tr�nh t�u v�i Ho�ng th��ng c�o l�o v� qu�. Ta d� ��nh s� x�y m�t khu hoa vi�n � L�m An �� t�n h��ng nh�ng ng�y thanh nh�n cu�i ��i. ")
	end
end;

function repair90(x)
	if (x == 1) then
		SetTaskTemp(20,332)
		add_em(90)
	elseif (x == 2) then
		SetTaskTemp(20,351)
		add_tm(90)
	elseif (x == 3) then
		add_tw(90)
	elseif (x == 4) then
		SetTaskTemp(20,391)
		add_tr(90)
	elseif (x == 5) then
		add_wd(90)
	elseif (x == 6) then
		add_cy(90)
	elseif (x == 7) then
		add_sl(90)
	elseif (x == 8) then
		add_gb(90)
	elseif (x == 9) then
		SetTaskTemp(20,394)
		add_kl(90)
	elseif (x == 10) then
		SetTaskTemp(20,390)
		add_wu(90)
	end
end
