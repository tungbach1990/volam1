--description: �����������๫
--author: yuanlan	
--date: 2003/3/4
-- Update: Dan_Deng(2003-08-12)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(207) == 1 then
		allbrother_0801_FindNpcTaskDialog(207)
		return 0;
	end
	UTask_em = GetTask(1);
	if (UTask_em == 10*256+20) then					--�ӵ�10������
		if (HaveItem(19) == 1) then
			Talk(1,"","Ta ch� tin m�ng c�a mu�i! ")
		else
			Talk(3, "L10_step1", "Di�u �n s� t� �� cho mu�i bi�t chuy�n c�a ��i ca, ta s� ngh� c�ch gi�p h�n g��ng l�i. ��i ca h�y ��a n�a m�nh g��ng kia ��a cho ta ���c kh�ng? ", "V�y ta tr�ng ch� v�o mu�i, mu�i d� ��nh l�m g�?", "Mu�i ��n t�m Th� r�n � Th�nh �� xem c� c�ch g� kh�ng?")
		end
	elseif (UTask_em == 10*256+60) then 					--ͭ���Ѳ���
		Talk(2, "", "��i ca! Xem �i! Mu�i �� s�a g��ng ��ng xong! ", "T�t l�m! H�y ��a g��ng ��ng cho n��ng t� c�a ta! ")
	elseif (UTask_em == 10*256+70) and (HaveItem(20) == 1) then		--�������һ��
		Talk(2, "", "��i ca! Di�u �n s� t� nh� mu�i mang m�nh g��ng n�y trao cho huynh. Nh�n nh� huynh c� b�ng l�ng ��i t� 3 n�m kh�ng? 3 n�m sau t� s� tr� v� b�n huynh.", "Phi�n ng��i nh�n v�i n��ng t� ta, d� ph�i ��i bao l�u ta c�ng ��i n�ng v�!")
		DelItem(20)
		SetTask(1, 10*256+80)
		AddNote("Mang g��ng ��ng giao cho t��ng c�ng c�a Di�u �n v� chuy�n nh�ng t�m huy�t c�a huynh �y ��n Di�u �n s� t� ")
		Msg2Player("Mang g��ng ��ng giao cho t��ng c�ng c�a Di�u �n v� chuy�n nh�ng t�m huy�t c�a huynh �y ��n Di�u �n s� t� ")
	elseif (UTask_em >= 10*256+80) then 					--������ɺ�ĶԻ�
		Talk(1,"","Bao l�u ta c�ng ��i n�ng v�!")
	else
		Talk(1,"","V� ch�ng ta ��n bao gi� m�i ���c g�p nhau?")
	end
end;

function L10_step1()
	AddEventItem(19)
--	SetTask(1, 14)
	AddNote("T�m ���c T��ng c�ng c�a Di�u �n � d��i n�i, v� nh�n ���c n�a t�m g��ng ��ng b�n ph�i. ")
	Msg2Player("T�m ���c T��ng c�ng c�a Di�u �n � d��i n�i, v� nh�n ���c n�a t�m g��ng ��ng b�n ph�i. ")
end;
