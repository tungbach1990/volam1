
Include("\\script\\lib\\pay.lua");	--��ֵ���ж�

function main()
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (nDate >= 70314 and nDate <= 70321) then
		Say("L�o phu �ang thu th�p c�c m�nh m�t �� th�n b�, n�u c�c v� c� th� gi�p ta t�m, l�o phu nh�t ��nh s� tr� c�ng h�u h�", 3,
					"��i10 m�t �� th�n b� l�y R��ng b�c/sure2takeboxaward",
					"��i 10 m�t �� th�n b� v� Kim th�ch l�y R��ng v�ng/sure2takeboxaward",
					"Ta c�n vi�c kh�c ph�i l�m/OnCancel");
	else
		Say("N�u c� th� thu th�p ���c m�nh b�n �� th�n b�, s� ph�t hi�n ra th�m nhi�u ���c kho t�ng b� �n",  0);
	end;
end;

function sure2takeboxaward(nSel)
	local nboxtype = nSel;
	local nmylevel = GetLevel();
	if (nmylevel < 50 or IsCharged() ~= 1) then
		Say("Th�t ng�i qu�! Ch� c� ng��i ch�i <color=yellow>c�p t� 50 tr� l�n<color> �� n�p th� m�i c� th� tham gia ho�t ��ng n�y.", 0);
		return
	end;
	
	local njuanzhou = CalcEquiproomItemCount(6,1,196,-1);
	if (njuanzhou < 10) then
		Say("T�m �� 10 t�m m�t �� th�n b� r�i quay l�i t�m L�o phu nh�!", 0);
		return
	end;
	
	if (CalcFreeItemCellCount() < 6) then
		Say("Xin s�p x�p l�i h�nh trang tr��c ��!", 0);
		return
	end;
	--���ṻ�ˣ���Ҫʲô����
	if (nboxtype == 1) then	--�ƽ�
		if (CalcEquiproomItemCount(6,1,1376,-1) >= 1) then
			ConsumeEquiproomItem(1,6,1,1376,-1);
			ConsumeEquiproomItem(10, 6, 1, 196, -1)	--ɾ�����ӵ����ؾ���count��
			AddItem(6,1,1377,1,0,0);
			Msg2Player("Nh�n ���c <color=yellow>R��ng v�ng");
			WriteLog(format("[Ho�t ��ng thu th�p m�nh m�t �� th�n b�] \t %s\t T�n:%s\t Account: %s\t nh�n ���c m�t r��ng v�ng",
														GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount()));
		else
			Say("Kh�ng c� Kim th�ch ch� c� th� ��i l�y R��ng b�c, ��ng � ch�?", 2, 
						"��i10 m�t �� th�n b� l�y R��ng b�c/sure2takeboxaward", 
						"�� ta s�p l�i h�nh trang ��/OnCancel");
			return
		end;
	else										--����
		ConsumeEquiproomItem(10, 6, 1, 196, -1)	--ɾ�����ӵ����ؾ���count��
		AddItem(6,1,1378,1,0,0);
		Msg2Player("Nh�n ���c <color=yellow>R��ng b�c");
		WriteLog(format("[Ho�t ��ng thu th�p m�nh m�t �� th�n b�]\t %s\t Name: %s\t Account: %s\t nh�n ���c 1 R��ng b�c",
														GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount()));
	end;
	Say("V�t v� qu�! ��y l� ch�t l�ng th�nh c�a l�o phu, xin h�y nh�n l�y!", 0);
end;

function OnCancel()
end;