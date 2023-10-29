-- �ƺ�« by bel at 20090409 10��04

Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");

function main()
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= jf0904_jiu_expiredtime) then
		Msg2Player("V�t ph�m n�y �� qu� h�n.");
		return 0;
	end
	
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("��i hi�p v�n ch�a �� c�p 50 ho�c v�n ch�a n�p th�, v� v�y kh�ng th� tham gia ho�t ��ng", 0);
		return 1;
	end
	
	if CalcFreeItemCellCount() < 10 then
		Say(format("�� b�o ��m an to�n t�i s�n, xin m�i �� tr�ng %d �.", 10), 0);
		return 1;
	end
	
	jf0904_InitTaskctrl();
	
	if (GetTask(jf0904_TSK_jiuexp) >= GetTask(jf0904_TSK_jiuexplt)) then
		Say("�� ��t ��n kinh nghi�m cao nh�t, kh�ng th� s� d�ng th�m B�u R��u.", 0);
		return 1;
	end
	
	local nAddedExp = 15;
	if (GetTask(jf0904_TSK_jiuexp) + nAddedExp > GetTask(jf0904_TSK_jiuexplt)) then
		nAddedExp = GetTask(jf0904_TSK_jiuexplt) - GetTask(jf0904_TSK_jiuexp);
	end	
	
	AddOwnExp(nAddedExp * 100000);
	SetTask(jf0904_TSK_jiuexp, GetTask(jf0904_TSK_jiuexp) + nAddedExp);
end
