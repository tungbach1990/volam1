--������\�ٰ�\�ٰ�\npc\·��_��СȪ.lua 
--by xiaoyang (2004\4\20)

Include("\\script\\global\\repute_head.lua")

function main()
	Uworld121 = GetTask(121)
	Uworld38 = GetByte(GetTask(38),1)
	if (Uworld121 < 10) and (GetLevel() >= 90) and (GetReputeLevel(GetRepute()) >= 5) and (Uworld38 == 127) and (GetFaction() ~= "tianwang") then
		Talk(3,"Uworld121_get","Xin ch�o v� b�ng h�u!","T�i h� ng��ng m� t�i ngh� l�m k�o c�a Tr��ng gia �� l�u, h�m nay t��ng ki�n, qu� l� ti�ng ��n kh�ng sai","Kh�ng bi�t c�c h� c� th� gi�p cho m�t vi�c kh�ng?","S�n s�ng!")
	elseif (Uworld121 == 10) and (HaveItem(373) == 0) then
		Talk(1,"","Ta c�ng r�t ph�c c�c h�! K�o ch�a l�y �� v�i �i! G�p th�n ti�n c�ng ch�a ch�c �� v�i nh� v�y!")
		AddEventItem(373)
		Msg2Player("Ti�p nh�n l�y k�o c�a Tr��ng Ti�u Tuy�n ")
	else
		if (random(0,1) == 0) then
			Talk(1,"","Nh� ta 3 ��i ��u r�n k�o, v�n c�ng c� ch�t ti�ng t�m � v�ng n�y. Cha ta mu�n ta k� th�a t� nghi�p, sau n�y s� m� th�m m�t x��ng r�n k�o, nh�ng ta kh�ng ��ng � ")
		else
			Talk(1,"","Nh�ng ng��i trong h� t�c ��u kh�ng hi�u ch�t g� v� ch� h��ng c�a ta. Ta mu�n �i kh�o th� t�m ch�t c�ng danh,Sau n�y c� th� l�m ���c quan to. Ta kh�ng mu�n su�t ��i n�y ��u b� ng��i ta coi khinh ch� l� m�t anh th� r�n k�o")
		end
	end
end

function Uworld121_get()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- ����δѧҰ��ȭ�ģ������������
		Talk(1,"","Kh�ng ���c! Xem c�i b� d�ng kh�ng c�n ���c gi� c�a ng��i th� ch�c kh�ng l�m ���c chuy�n n�y")
	else
		Say("� ��y c� m�t c�y k�o �� ���c tinh luy�n. Mong nh� c�c h� chuy�n gi�p ��n cho S� gi� H� M� Tuy�t ��i nh�n � Th�y Y�n m�n",2,"S�m �� nghe Danh ti�ng c�a H� Ti�nT�. L�n n�y th�t l�m c� h�i ng�n v�ng �� ���c t��ng ki�n /Uworld121_getjd","Nh�ng ta v� c�i g� m� ph�i �i xa nh� v�y? Hu�ng h� ta v� c�c h� l�i ch�a t�ng quen bi�t! Xin l�i! Ta th�t kh�ng th� gi�p ���c! /Uworld121_no") --��������
	end
end

function Uworld121_getjd()
	AddEventItem(373)
	Msg2Player("Nh�n l�y k�o c�a Tr��ng Ti�u Tuy�n ")
	AddNote("Nh�n l�y k�o sau �� �i th�ng v� h��ng Th�y Y�n m�n ")
	SetTask(121,10) --�����������Ϊ10
end

function Uworld121_no()
end
