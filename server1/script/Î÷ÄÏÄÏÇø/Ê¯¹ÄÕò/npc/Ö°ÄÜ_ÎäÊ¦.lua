--ʯ���� ��ʦ ���������ͷ������Ṧ
-- By: Dan_Deng(2003-09-04)
-- Update: Dan_Deng(2003-11-04)��Ϊģ�巽ʽ��ȫ��ͳһ����һ������������ά������չ

Include("\\script\\global\\itemhead.lua")
Include("\\script\\global\\���ɽ�������\\�Ṧ_��ʦģ��.lua")

function main(sel)
	UTask_world22 = GetTask(22)		-- �ͷ�����
	if (UTask_world22 == 5) and (HaveItem(233) == 1) then			-- �ͷ��������
		Talk(4,"W22_prise","Li�u Di�p Nhi nh� ng��i �em c�m cho ta? N� nh� tu�i th� m� ph�i lo nhi�u vi�c, ta kh�ng ph�i l� �ng n�i t�t. Nh� n�m x�a l�c n� 3 tu�i.....sau ��.....l�i c�n.....","�ng �n c�m �i!","C�m �n! Ta c�n nhi�u chuy�n ng��i mu�n nghe kh�ng?",".....Kh�ng c�n!")
	else
		learn()
	end
end;

function W22_prise()
	Talk(1,"","Th�.....c�m �n ng��i! H�y gi� l�y v� kh� ph�ng th�n.")
	DelItem(233)
	SetTask(22,10)
	AddNote("��a c�m cho v� s�, nhi�m v� ho�n th�nh ")
	Msg2Player("��a c�m cho v� s�, nhi�m v� ho�n th�nh ")
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,7)
	i = random(0,8)
	if(i <= 5) then
		AddItem(0, 0, i, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
	else
		i = i - 6
		AddItem(0, 0, i, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
	end
	Msg2Player("Nh�n ���c m�t m�n binh kh� ")
	AddRepute(3)
	Msg2Player("Danh v�ng c�a b�n t�ng th�m 3 �i�m ")
end;
