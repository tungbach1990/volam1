--������ ·�� ��ջ�ϰ��� �������񣺽��ܹ���
-- By: Dan_Deng(2003-09-04)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world25 = GetTask(25)
	UTask_world27 = GetTask(27)
	if (UTask_world25 == 3) then		-- ���񡰽��ܹ�����������
		Talk(5,"W25_step","B� ch�! C� c�n th�m ng��i gi�p vi�c kh�ng?","Gi�p vi�c? Hi�n c�n �ang thi�u m�t ch�n ti�u nh� �� d�n b�n","C� ng��i mu�n d� tuy�n, v�y nh�n kh�ng?","C�n xem kh� n�ng!","T� trung Nguy�n ��n ��y, t�m m�t b�a c�m th�t kh�ng d� d�ng")
	elseif (UTask_world27 == 0) and (GetLevel() >= 5) then
		Say("�i! T�m cho ta 3 mi�ng th�t heo r�ng, v� ��y cho ta ��i kh�ch!",2,"Bi�t r�i/W27_get_yes","Phi�n ch�t ���c! �i t�m ng��i kh�c �i! /W27_get_no")
	elseif (UTask_world27 == 5) then
		i = GetItemCount(228)
		if (i >= 3) then
			for j = 1,i do DelItem(228) end
			Talk(1,"","�! ��ng t�c c�c k� nhanh! N�y! C�i m� n�y ta kh�ng c�n d�ng ��n n�a! T�ng cho ng��i ��!")
			SetTask(27,10)
			AddRepute(9)
			AddNote("H�y mau �em th�t heo r�ng v� giao cho b� ch�, ho�n th�nh nhi�m v�! ")
			Msg2Player("H�y mau �em th�t heo r�ng v� giao cho b� ch�, ho�n th�nh nhi�m v�! ")
			p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
			if(GetSex() == 0) then
				AddItem(0, 7, 6, 2, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("Nh�n ���c m�t t�m kh�n v�i ")
			else
				AddItem(0, 7, 10, 2, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("S� ���c m�t mi�ng s�t h�nh tr�n ")
			end
			Msg2Player("Danh v�ng c�a b�n t�ng th�m 9 �i�m ")
		else
			Talk(1,"","L�m g� m� c� ��ng th�n ng��i ra v�y? Xem b� d�ng c�a ng��i k�a! C�n ch�a ch�u �i?!")
		end
	elseif (UTask_world25 == 6) then
		Talk(1,"","�! Ng��i n�i c�i ng��i t�n l� Th��ng Quan Thu g� ��G�i h�n ��n ��y! S� tr� th� c�a ta v�n c�n thi�u!")
	else				-- ������Ի�
		Talk(1,"","Oa Oa! Kh�ch quan kh�ng tr� � L� qu�n n�y �? 100 d�m xung quanh 'Long m�n tr�n' n�y kh�ng ai h�n ���c L� qu�n c�a ta! Kh�ng tin th� ng��i s� h�i h�n ��!")
	end
end;

function W25_step()
	Talk(1,"","���c r�i! V�y h�y mau g�i y ��n ��y gi�p ta!")
	SetTask(25,6)
	AddNote("B� ch� �� ��ng � m�i Th��ng Quan Thu ��n ��y gi�p v�c! H�y mau mang tin vui n�y ��n cho h�n! ")
	Msg2Player("B� ch� �� ��ng � m�i Th��ng Quan Thu ��n ��y gi�p v�c! H�y mau mang tin vui n�y ��n cho h�n! ")
end

function W27_get_yes()
	SetTask(27,5)
	AddNote("Nh�n nhi�m v�! V�o r�ng l�y 3 mi�ng th�t heo r�ng v� giao cho b� ch�! ")
	Msg2Player("Nh�n nhi�m v�! V�o r�ng l�y 3 mi�ng th�t heo r�ng v� giao cho b� ch�! ")
end

function W27_get_no()
end
