--�Ϸ���ż����ջ
--byС�˶��
--2007-04-13
XINGYUNLIBAO = 2556 --Byte:1.�� 2.�� 3.�� 4.����

function nanfangjiefangri_main()
	local aryTalk = {
		"<dec><npc>Nh�ng n�m g�n ��y, chi�n s� T�ng Kim ng�y c�ng k�ch li�t. V� l�m nh�n s� c�c n�i �� h�i t� tham chi�n. H� �� hi sinh th�n m�nh �� ��nh �u�i k� th� b�o v� t� qu�c. �� ca ng�i tinh th�n hi�p ngh�a n�y, V� l�m minh ch� quy�t ��nh t�ng th��ng cho nh�ng anh h�ng l�p ���c nhi�u c�ng tr�ng tr�n chi�n tr��ng T�ng Kim.",
		"Ta mu�n t�m hi�u ho�t ��ng n�y./about",
		"Ta mu�n nh�n C�ng tr�ng l�nh./getGongLaoLin",
		"Ta mu�n nh�n ph�n th��ng anh h�ng chi�n tr��ng./getXingYunLiBao",
		"Th�t ng�i qu�, ta s� quay l�i sau./no",
	}
	CreateTaskSay(aryTalk)
	
end
function getGongLaoLin()
	if (GetCash()<300000) then
		CreateTaskSay({"<dec><npc>C�n ph�i n�p v�o 30 v�n l��ng l� ph� ��ng k�, ��i hi�p kh�ng �� ti�n r�i!","Bi�t r�i/no"});
		return 0;
	end
	if (GetExtPoint(0) == 0) then
		CreateTaskSay({"<dec><npc>Ch� c� ng��i ch�i �� n�p th� m�i c� th� nh�n.","Bi�t r�i/no"});
		return 0;
	end
	if ( GetLevel()< 50 ) then
		CreateTaskSay({"<dec><npc>Ch� c� ng��i ch�i c�p t� 50 tr� l�n m�i c� th� nh�n.","Bi�t r�i/no"});
		return 0;
	end
	if ( CalcFreeItemCellCount() < 1 ) then
		CreateTaskSay({"<dec><npc>H�y chu�n b� 1 � tr�ng �� ��t v�o 1 <color=yellow>C�ng tr�ng l�nh<color>.","Bi�t r�i/no"});
		return 0;
	end
	Pay(300000);
	local nidx = AddItem(6,1,1411,1,0,0);
	WriteLog(format("[GetZhanGongXunZhang]\t date:%s \t Account:%s \t Name:%s \t GetItem:%s\t",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)));
	CreateTaskSay({"<dec><npc>B�n �� nh�n th�nh c�ng 1 <color=yellow>C�ng tr�ng l�nh<color>.","Bi�t r�i/no"});
end

function getXingYunLiBao()
	if (GetExtPoint(0) == 0) then
		CreateTaskSay({"<dec><npc>Ch� c� ng��i ch�i �� n�p th� m�i c� th� nh�n.","Bi�t r�i/no"});
		return 0;
	end
	if ( GetLevel()< 50 ) then
		CreateTaskSay({"<dec><npc>Ch� c� ng��i ch�i c�p t� 50 tr� l�n m�i c� th� nh�n.","Bi�t r�i/no"});
		return 0;
	end
	if ( CalcFreeItemCellCount() < 1 ) then
		CreateTaskSay({"<dec><npc>H�y chu�n b� 1 � tr�ng �� ��t v�o 1 <color=yellow>C�ng tr�ng l�nh<color>.","Bi�t r�i/no"});
		return 0;
	end
	local ndate = tonumber(tonumber(GetLocalDate("%y"))..tonumber(GetLocalDate("%m"))..tonumber(GetLocalDate("%d")));
	local nlibao = GetTask(XINGYUNLIBAO);
	local olddate = tonumber(GetByte(nlibao,1)..GetByte(nlibao,2)..GetByte(nlibao,3));
	local num = GetByte(nlibao,4);
	if num == nil then
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),2,0));
		num = 0;
	end
	if ndate == olddate then 
		CreateTaskSay({"<dec><npc> M�i ng�y ch� c� th� nh�n t�i �a 50 c�i, ng�y mai h�y ��n nh�.","Bi�t r�i/no"});
		return 0;
	end
	local ngonglao = CalcEquiproomItemCount(6,1,1411,-1)
	local nxunzhang = CalcEquiproomItemCount(6,1,1412,-1)
	if ngonglao < 1 then
		CreateTaskSay({"<dec><npc> ��i hi�p kh�ng mang theo <color=yellow>C�ng tr�ng l�nh<color>.","Bi�t r�i/no"});
		return 0;
	end
	if nxunzhang < 1 then
		CreateTaskSay({"<dec><npc> ��i hi�p kh�ng mang theo <color=yellow>Huy ch��ng T�ng Kim<color>. H�y d�ng �i�m t�ch l�y �� ��i l�y Huy ch��ng T�ng Kim ","Bi�t r�i/no"});
		return 0;
	end	
	num = num + 1;
	if num >= 50 then
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),1,tonumber(GetLocalDate("%y"))));
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),2,tonumber(GetLocalDate("%m"))));
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),3,tonumber(GetLocalDate("%d"))));
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),4,0));
	else
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),4,num));
	end
	ConsumeEquiproomItem(1, 6, 1, 1411, -1)
	ConsumeEquiproomItem(1, 6, 1, 1412, -1)
	local nidx = AddItem(6,1,1413,1,0,0);
	WriteLog(format("[XINGYUNLIBAO]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)));
	CreateTaskSay({"<dec><npc>�� nh�n th�nh c�ng 1 <color=yellow>T�i qu� may m�n<color>.","Bi�t r�i/no"});
end

function about()
	CreateTaskSay({"<dec><npc>T� ng�y 28/4/2007 ��n 13/5/2007, ng��i ch�i c�p 50 �� n�p th� c� th� ��n ch� ta d�ng 1 <color=yellow>C�ng tr�ng l�nh<color> (��ng 30 v�n ph� ��ng k� cho ta �� nh�n) v� 1 <color=yellow>Huy ch��ng T�ng Kim<color> (d�ng 500 �i�m t�ch l�y �� ��i t�i Qu�n Nhu Quan) �� ��i l�y ","Bi�t r�i/no"})
end