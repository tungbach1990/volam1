--���꿨����
Include([[\script\event\teachersday06_v\head.lua]]);

--�������
function vt06_prizeenter()
	if (vt06_isactive() == 0) then
		return 0;
	end;
	
	Describe("Trong d�p l� �n S� n�y, c�c hi�p kh�ch <color=yellow>d��i c�p 80<color> ho�n th�nh nhi�m v� Ho�ng Kim, Boss s�t th� v� gi�t Boss xanh, c� c� h�i nh�n �u�c 4 ch� �Nh�t�,�T��,�Vi�,S��. D�ng t�ng 4 ch� cho s� ph�, �� t� s� nh�n ���c �Th� Cao ��, s� ph� s� nh�n ���c �Th� �n S��. Ta c� th� ��i 2 th� n�y th�nh qu� th��ng. Ng��i mu�n ��i th� n�o?", 3, "Ta mu�n ��i �Th� �n S��/#vt06_sendgift(1)", 
		"Ta mu�n ��i �Th� Cao ��/#vt06_sendgift(2)", "R�i kh�i/no");
end;

tab_Goods = {{"Th� �n S�", 1293}, {"Th� Cao ��", 1295}};
tab_Idx = {1, 2, 3, 4, 5, 6}

function vt06_sendgift(nIdx)
	Say("Thu th�p ���c nhi�u th�, ph�n th��ng �i�m kinh nghi�m c�ng nhi�u! <color=yellow>1<color>"..tab_Goods[nIdx][1].." ���c <color=yellow>40 v�n �i�m<color>, <color=yellow>2<color>"..tab_Goods[nIdx][1].." ���c <color=yellow>100 v�n �i�m<color>, <color=yellow>5<color>"..tab_Goods[nIdx][1].." ���c <color=yellow>300 v�n �i�m<color>.", 4,
	"Ta mu�n ��i 1 "..tab_Goods[nIdx][1].." l�y 40 v�n �i�m/#vt06_giveprize("..nIdx..", 1, 400000)",
	"Ta mu�n ��i 2 "..tab_Goods[nIdx][1].." l�y 100 v�n �i�m/#vt06_giveprize("..nIdx..", 2, 1000000)",
	"Ta mu�n ��i 5 "..tab_Goods[nIdx][1].." l�y 300 v�n �i�m/#vt06_giveprize("..nIdx..", 5, 3000000)",
	"R�i kh�i/no");
end;

function vt06_giveprize(nIdx, nCount, nExp)
	local nOwnedExp = GetTask(TK_EXPLIMIT);
	
	if (nOwnedExp >= VT06_EXPLIMIT) then
		Say("B�n �� nh�n ���c <color=yellow>"..VT06_EXPLIMIT.."<color> �i�m kinh nghi�m, kh�ng th� nh�n th�m!", 0);
		return
	end;
	
	if (CalcEquiproomItemCount(6,1,tab_Goods[nIdx][2],-1) < nCount) then
		Say("Ng��i h�nh nh� kh�ng �� <color=yellow>"..nCount.."<color>"..tab_Goods[nIdx][1].."! Ti�p t�c n� l�c nh�!", 0);
		return
	end;
	
	--ɾ��Ʒ
	if (ConsumeEquiproomItem(nCount,6,1,tab_Goods[nIdx][2],-1) == 0) then
		return
	end;

	--�Ӿ���
	nOwnedExp = nOwnedExp + nExp;
	SetTask(TK_EXPLIMIT, nOwnedExp);
	AddOwnExp(nExp);
	Say("B�n nh�n ���c<color=yellow>"..nExp.."<color> �i�m kinh nghi�m.", 0);
end;