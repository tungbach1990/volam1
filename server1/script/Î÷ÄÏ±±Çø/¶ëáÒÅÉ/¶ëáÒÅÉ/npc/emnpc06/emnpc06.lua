--description: �������
--author: yuanlan	
--date: 2003/3/4
-- Update: Dan_Deng(2003-08-12)

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_em = GetTask(1);
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld36 == 70) then		-- �������������
		if (HaveItem(17) == 0) then		--�õ���������֮ǰ
			Talk(1,"","Mu�i ch�a l�y ���c <color=Red>B�ch Ng�c Nh� �<color>!")
		else									--�õ���������֮��
			Uworld36_prise()
		end
--	elseif (UTask_em < 6) then 							--��δ���ǰ����
--		Talk(1,"","���Ҫ����뱾�ɣ�������ͨ��������Ŀ��飬�㶼��������")
--	elseif (UTask_em == 6) then 							--��δ���ǰ����
--		Talk(1,"","�������ͨ��������Ŀ��飬��������ȥ��<color=Red>л����<color>ʦ�ðɣ������ڰ�ɽ����<color=Red>���������<color>����")
	elseif (GetFaction() == "emei") then   				--�Ѿ����ţ���δ��ʦ
		Talk(1,"","S� mu�i c�n th�n! To�n Thi�n Ph� v� c�ng nguy hi�m!")
	elseif (UTask_em == 70) then   						--�Ѿ���ʦ
		Talk(1,"","S� mu�i, ph�i h� s�n sao? T� mu�i ta s� r�t nh� mu�i!")
	else
		Talk(1,"","To�n Thi�n Ph� l� n�i nguy hi�m, xin th� ch� ��ng m�o hi�m!")
	end
end;

function Uworld36_prise()
	DelItem(17)
	Uworld36 = SetByte(GetTask(36),1,127)
	i = ReturnRepute(30,19,3)		-- ȱʡ�������������ĵȼ���ÿ���ݼ�
	SetTask(36,Uworld36)
	AddRepute(i)		-- ������
	AddNote("��a cho Di�u Tr�n B�ch Ng�c nh� �, ho�n th�nh nhi�m v�, tr� th�nh K� Danh �� t� c�a Nga Mi ph�i ")
	Msg2Player("��a cho Di�u Tr�n B�ch Ng�c nh� �, ho�n th�nh nhi�m v�, tr� th�nh K� Danh �� t� c�a Nga Mi ph�i, thanh th� giang h� ���c t�ng "..i.."�i�m.")
	Talk(1,"","Ch�c m�ng mu�i nh�n ���c B�ch Ng�c Nh� �, thu�n l�i qua ���c 4 �i th� th�ch c�a t� mu�i ta. T� nay mu�i �� l� �� t� c�a b�n ph�i! V� sau hoan ngh�nh mu�i ��n Nga Mi du ngo�n!")
end
