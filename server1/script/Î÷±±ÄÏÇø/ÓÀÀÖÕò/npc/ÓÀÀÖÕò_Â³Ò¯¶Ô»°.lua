--description: ���ִ�_³ү
--author: wangzg	
--date: 2003/7/21
---70	UTask_world42
--update 2003/7/24 yuanlan
-- Update: Dan_Deng(2003-08-07)
-- Update: Dan_Deng(2003-09-09) �޸�װ���������ɷ�ʽ

Include("\\script\\global\\itemhead.lua")

function main()
	UTask_world42=GetTask(70)
	if (UTask_world42==0) then
		Say("S�ng tr�n ��i, kh�ng c� s�ch hay �� xem th� th�t l� bu�n ch�n! L�o C�t Gia � ph�a nam tr�n c� m�t quy�n s�ch hay, nh�ng ta kh�ng th� m�t d�y m�y d�n ��n m��n h�n ���c", 2, "Ta gi�p �ng �i m��n /yes", "Mu�n xem s�ch c�ng ph�i �i m��n. /no")
	elseif (UTask_world42==2) then
		Talk(1,"","V�y th� c�m t� ng��i tr��c! C�t l�o ��u �ang � ph�a nam tr�n n�y.")
	elseif (UTask_world42==4) then
		Talk(2, "step2", "C�t Gia n�i mu�n d�ng 'Di Ki�n Ch�'��i 'K� Th�n l�c'","L�o h� ly ��, mu�n l�m kh� ta ��y! ���c r�i! Phi�n ng��i mang ��a cho h�n.")
	elseif ((UTask_world42 == 6) and (HaveItem(189) == 0)) then		-- �鶪��
		Talk(1,"","B�n tr�! D�m li�u nh� th�! T�i sao l�i n�m s�ch � ch� ta m� b� ch�y")
		AddEventItem(189)
		Msg2Player("���c Di Ki�n Ch� ")
	elseif ((UTask_world42==8) and  (HaveItem(188) == 1)) then
		Talk(3, "WTask70_prise", "L� ��i gia! ��y l� quy�n s�ch ng�i c�n.", "Th� th� t�t qu�.","��y c� s�i Ng�u b� y�u ��i, ta kh�ng d�ng, t�ng cho ng��i")
	else
		Talk(1,"","B�n tr�! S�ng tr�n ��i c�n ph�i ��c nhi�u s�ch, kh�ng n�n su�t ng�y m�a �ao m�a ki�m")
	end
end;

function yes()
	Talk(1,"","V�y th� c�m t� ng��i tr��c! C�t l�o ��u �ang � ph�a nam tr�n n�y.")
	SetTask(70,2)
	AddNote("Nh�n nhi�m v� gi�p L� gia ��n tr�n nam g�p C�t gia m��n s�ch. ")
	Msg2Player("Nh�n nhi�m v� gi�p L� gia ��n tr�n nam g�p C�t gia m��n s�ch. ")
end

function no()
end

function step2()
	AddEventItem(189)
	Msg2Player("���c Di Ki�n Ch� ")
	SetTask(70,6)
	AddNote("T� ch� L� gia l�y ���c Di Ki�n Ch�. ")
end

function WTask70_prise()
	DelItem(188)
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
	AddItem(0,6,0,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
	SetTask(70,10)
	AddRepute(5)		-- ������5��
	AddNote("Mang K� Th�n L�c ��a cho L� gia, ho�n th�nh nhi�m v�, ���c m�t mi�ng th�t l�ng da tr�u. ")
	Msg2Player("Nh�n ���c mi�ng th�t l�ng da tr�u. ")
	Msg2Player("Danh v�ng c�a b�n t�ng th�m 5 �i�m ")
end
