-- ������ ����ɽ ·��_�Ʋ�ӥ��.lua ������ɻ�������
-- By: Dan_Deng(2004-05-28)

function main(sel)
	Uworld43 = GetTask(43)
	if (Uworld43 == 50) then
		Talk(5,"U43_50","Ng��i �� c� ���c ch�a kh�a r�i. C�n mu�n h�i ta g� n�a?","Gi�p cho k� �c, s� b� thi�n h� nguy�n r�a!","N�i x�m! C�i g� ch�nh? C�i g� t�?! Ta th�ch l�m �i�u �c ��! Ng��i l�m g� ta n�o?","V�y ta xin ��c t�i!","H�m! Ng��i ch�a c� t� c�ch �� ��u v�i ta! �� ta cho b�n �� t� S�n �ng ��a v�i ng��i m�t ch�t")
	elseif (Uworld43 == 70) then						-- ����ɽӥ������Կ��
		Talk(2,"U43_70","H�y mau giao ch�a kh�a ra ��y!","H�o ti�u t�! Ng��i ��i ��y! Ch� nh�n nh�t ��nh s� b�o th� cho L�i V�n nh� b� ")
	elseif (Uworld43 >= 80) and (Uworld43 < 100) and (HaveItem(382) == 0) then				-- ��֮�����һ������Կ�׶�ʧ
		AddEventItem(382)
		Msg2Player("Ti�p t�c l�y ���c V�n th��c. ")
		Talk(1,"","H�ng ti�u t�t nh� ng��i th� xem c� th� l�m ���c c�i g�. Ch�a kh�a �ang � ��y, n�u nh� ng��i c� th� ti�p ���c ta 3 chi�u, th� s� giao cho ng��i")
	elseif (Uworld43 >= 80) and (Uworld43 < 255) and (HaveItem(382) == 1) then
		Talk(1,"","Ng��i �� c� ���c ch�a kh�a r�i. C�n mu�n h�i ta g� n�a?")
	elseif (Uworld43 == 60) then		-- �Ի���ɣ������δ���
		Talk(1,"","H�m! Ng��i ch�a c� t� c�ch �� ��u v�i ta! �� ta cho b�n �� t� S�n �ng ��a v�i ng��i m�t ch�t")
	elseif (Uworld43 >= 255) then
		Talk(1,"","Ng��i�Ng��i th�t s� �� gi�t thi�u ch�?")
	else
		Talk(1,"","��ng c� l�m nh�m n�a! Ch�a th�y b� d�ng n�y bao gi� sao?")
	end
end;

function U43_50()
	SetTask(43,60)
	Msg2Player("Ng��i th�t s� �� gi�t ch�t thi�u ch�? ")
end

function U43_70()
	SetTask(43,80)
	AddEventItem(382)
	Msg2Player("�� l�y ���c V�n th��c, tr� v� L�m An giao cho C�ng Sai ��i ca, b�n b�n k� ho�ch ti�p theo ")
end
