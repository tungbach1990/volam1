--���ϱ��� ����� ·��8���÷�Ի�
--����������������ϵ���ҩ
--suyu
-- Update: Dan_Deng(2003-08-11)
-- Update: Dan_Deng(2003-09-09) �޸�װ���������ɷ�ʽ

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world21 = GetTask(49);
	if (UTask_world21 == 3) then
		Talk(1,"","�a t� ng��i �� h�t thu�c cho cha ta! ��y l� ��i gi�y ta m�i v�a may xong, n�u ng��i kh�ng ch� xin h�y c�m l�y!")
		SetTask(49, 10)
		AddRepute(6)
		AddNote("Ho�n th�nh nhi�m v� gi�p Ng� l�o gia b�c thu�c ")
		Msg2Player("Ho�n th�nh nhi�m v� gi�p Ng� l�o gia b�c thu�c ")
		p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
		if(GetSex() == 0)then
			AddItem(0,5,0,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("Nh�n ���c m�t ��i gi�y c� ")
		else
			AddItem(0,5,2,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("Nh�n ���c m�t ��i gi�y th�u ")
		end
		Msg2Player("Danh v�ng c�a b�n t�ng th�m 6 �i�m ")
	else
		Talk(1,"","M� ta mu�n �n th�t heo lu�c t�i, nh�ng ng��i b�n th�t h�nh nh� ch�a d�n ra, v�y ph�i l�m th� n�o m�i ���c ��y!?")
	end
end;
