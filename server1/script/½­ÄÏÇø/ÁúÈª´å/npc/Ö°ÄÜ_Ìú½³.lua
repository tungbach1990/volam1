--��Ȫ�� ְ�� ����
--��Ȫ�����������޵�
-- By: Dan_Deng(2003-09-03)
Include("\\script\\global\\global_tiejiang.lua")
Include("\\Script\\Global\\TimerHead.lua")

TIEJIANG_DIALOG = "<dec><npc>Mu�n mua lo�i binh kh� n�o? T�i ��y r�t n�i ti�ng v� v� kh�, kh�ng tin ng��i �i h�i thanh danh c�a Long Tuy�n Ho�ng Gia th� xem!"

function main(sel)
	UTask_world19 = GetTask(19)
	if(UTask_world19 == 2) then
		if (HaveItem(229) == 1) then
			tiejiang_village("<dec><npc>C�y �ao n�y h� h�ng n�ng n�, ph�i b� kh�ng �t ti�n �� s �a n�. Ti�n tu s�a 120 ng�n l��ng.", "��a ti�n s�a �ao/W19_repair")
		else
			Talk(2,"","Mu�n s�a c�y �ao? Xin h�y ��a cho ta xem th� ","Th�i r�i! C�y �ao c�a ta �� b� qu�n � ch� B�nh Ph�ng! Ta s� quay v� �� l�y n� ")
		end
	elseif (UTask_world19 == 4) then
		tiejiang_village("<dec><npc>C�y �ao c�a ��i hi�p �ang s�a, xin m�i ��i m�t l�t n�a"..GetRestSec(7).."<#> Gi�y r�i l�i l�y.")
	elseif (UTask_world19 == 6) then
		Talk(2,"","�ao c�a ng��i �� s�a xong r�i","T�t l�m! C�m �n!")
		SetTask(19,8)
		AddEventItem(230)
		AddNote("L�y l�i c�y b�o �ao tr� cho B�nh Ph�ng.")
		Msg2Player("L�y l�i c�y b�o �ao tr� cho B�nh Ph�ng.")
	elseif (UTask_world19 == 8) and (HaveItem(230) == 0) then
		Talk(1,"","Ng��i �� b� qu�n c�y �ao � ch� ta")
		AddEventItem(230)
		Msg2Player("Ta l�y l�i c�y b�o �ao �� �� qu�n � ch� th� r�n.")
	else
		tiejiang_village();
	end
end;

function W19_repair()
	if (GetTimerId() > 0) then		-- ���м�ʱ����������
		Talk(1,"","Ng��i �ang mang nhi�m v� c�p b�ch nh� th�, m� c�n ch�y lung tung �?")
	else
		if (GetCash() < 120) then
			Talk(1,"","Ng��i ��a ch�a �� ti�n")
		else
			Talk(1,"","���c! Hai gi� sau ng��i ��n �� l�y �ao")
			Pay(120)
			SetTask(19,4)
			DelItem(229)
			SetTimer(2 * CTime * FramePerSec, 7)
			AddNote("Giao b�o �ao cho th� r�n s�a, hai gi� sau l�i l�y.")
			Msg2Player("Giao b�o �ao cho th� r�n s�a, hai gi� sau l�i l�y.")
		end
	end
end;

function yes()
Sale(28);  				--�������׿�
end;
