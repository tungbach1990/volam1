--���������NPC

Include("\\script\\global\\map_helper.lua")
Include("\\script\\task\\newtask\\education\\dragonfive.lua")
npc_name = "V�n th� "

function main(sel)

UTask_tw = GetTask(3)

if (UTask_tw < 10*256) then						--δ����������������δ��������
	if (GetFaction() ~= "") then				--�������Ѿ�������һ����
		Say("C� g� mu�n t�m hi�u c� h�i ta!", 3, "T�m hi�u qu� bang/org", "T�m hi�u c�c v� h�o h�n/member", "T�m hi�u b� c�c n�i n�y/config")
		return
	else
		Say("C� g� mu�n t�m hi�u c� h�i ta!", 4, "T�m hi�u qu� bang/org", "T�m hi�u c�c v� h�o h�n/member", "T�m hi�u b� c�c n�i n�y/config", "L�m sao �� nh�p m�n?/task1")
		return	
	end
end;
	
if (UTask_tw == 70*256) then					--�������Ѿ���ʦ		
	Say("Th� ra l� huynh �� ��ng m�n! Kh�ng bi�t d�o n�y th� n�o!?", 6, "Ti�p t�c t�m hi�u Thi�n V��ng Bang /org", "Ti�p t�c t�m hi�u c�c huynh �� tr��c ��y!/member", "T�m hi�u l�i b� c�c n�i n�y/config", "C�n nhi�m v� n�o �� l�m n�a/task3","T�m hi�u s� tr��ng luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help")
	return
end;	

Say("C� g� mu�n t�m hi�u c� h�i ta!", 7,"��i tho�i v�i Long Ng� /Uworld1000_word","T�m hi�u b�n bang/org", "T�m hi�u ��ng m�n/member", "T�m hi�u b� c�c n�i n�y/config", "T�m hi�u nhi�m v� /task3","T�m hi�u s� tr��ng luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help")

end;

----------------------------------------------------------------------------------------------

function org()
Say("Mu�n t�m hi�u ph��ng di�n n�o?", 4, "Kh�i nguy�n m�n ph�i/o1", "V� tr� ��a l� /o2", "��a v� giang h� /o3", "��c s�c m�n ph�i/o4")
end;


function member()
Say("Mu�n t�m hi�u ai?", 14, "Bang ch� D��ng Anh/m1", "Thi�n H� ph�p L� V�n Vi�n/m2", "��a H� ph�p H� Th�nh/m3", "Ti�n s� V��ng T� /m4", "T� s� C� B�ch/m5", "H�u s� D��ng H� /m6", "T�n ��o L�nh/m7", "M�n �� b�n binh kh� /m8", "M�n �� b�n trang b� /m9", "M�n �� b�n D��c ph�m/m10", "Thuy�n phu b�n ph�a ��ng/m11", "Thuy�n phu b�n ph�a nam/m12", "Thuy�n phu b�n ph�a t�y/m13", "Thuy�n phu b�n ph�a b�c/m14")
end;


function config()
Say("Mu�n t�m hi�u ph��ng di�n n�o?", 6, "C�c v�ng l�n c�n/c1",  "Trung t�m ��o/c2", "Ph�a ��ng ��o/c3", "Ph�a nam ��o/c4", "Ph�a t�y ��o/c5", "Ph�a b�c ��o/c6")
end;


function task1()
Say("B�n m�n ch� thu nh�n �� t� h� Kim. Mu�n nh�p m�n h�c ngh�,ch� c�n th�ng qua ho�n th�nh nhi�m v� nh�p m�n", 1, "T�m hi�u c� th� nhi�m v� nh�p m�n/v1")
end;


function task2()
Say("<#> Ng��i �� xu�t s�,kh�ng c�n l�m nhi�m v� c�a bang ph�i n�a. Hi�n �� "..UTask_tw.."<#>.", 0)
end;


function task3()

UTask_tw = GetTask(3)

if (UTask_tw < 10*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Ng��i �ang th�c hi�n nhi�m v� nh�p m�n. Hi�n �� "..UTask_tw.."<#>.", 1, "Nhi�m v� nh�p m�n/v1")
end;

if (UTask_tw == 10*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Ng��i hi�n �� nh�p m�n,ti�p theo c� th� nh�n Nhi�m v� K� Huy�t Th�ch. Hi�n �� "..UTask_tw.."<#>.", 1, "Nhi�m v� K� Huy�t Th�ch/v2")
end;

if (UTask_tw > 10*256) and (UTask_tw < 20*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Hi�n ng��i �ang ti�n h�nh l� Nhi�m v� K� Huy�t Th�ch. Hi�n �� "..UTask_tw.."<#>.", 1, "Nhi�m v� K� Huy�t Th�ch/v2")
end;

if (UTask_tw == 20*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Ti�p theo c� th� nh�n Nhi�m v� B�ch Th�y ��ng. Hi�n �� "..UTask_tw.."<#>.", 1, "Nhi�m v� B�ch Th�y ��ng/v3")
end;

if (UTask_tw > 20*256) and (UTask_tw < 30*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Hi�n ng��i �ang ti�n h�nh l� Nhi�m v� B�ch Th�y ��ng. Hi�n �� "..UTask_tw.."<#>.", 1, "Nhi�m v� B�ch Th�y ��ng/v3")
end;

if (UTask_tw == 30*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Ti�p theo c� th� nh�n Nhi�m v� Thi�n V��ng l�nh. Hi�n �� "..UTask_tw.."<#>.", 1, "Nhi�m v� Thi�n V��ng l�nh/v4")
end;

if (UTask_tw > 30*256) and (UTask_tw < 40*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Hi�n ng��i �ang ti�n h�nh l� Nhi�m v� Thi�n V��ng l�nh. Hi�n �� "..UTask_tw.."<#>.", 1, "Nhi�m v� Thi�n V��ng l�nh/v4")
end;

if (UTask_tw == 40*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Ti�p theo c� th� nh�n Nhi�m v� thu�c gi�i ��c. Hi�n �� "..UTask_tw.."<#>.", 1, "Nhi�m v� thu�c gi�i ��c/v5")
end;

if (UTask_tw > 40*256) and (UTask_tw < 50*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Hi�n ng��i �ang ti�n h�nh l� Nhi�m v� thu�c gi�i ��c. Hi�n �� "..UTask_tw.."<#>.", 1, "Nhi�m v� thu�c gi�i ��c/v5")
end;

if (UTask_tw == 50*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Ti�p theo c� th� nh�n Nhi�m v� Th�y qu�i. Hi�n �� "..UTask_tw.."<#>.", 1, "Nhi�m v� Th�y qu�i/v6")
end;

if (UTask_tw > 50*256) and (UTask_tw < 60*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Hi�n ng��i �ang ti�n h�nh l� Nhi�m v� Th�y qu�i. Hi�n �� "..UTask_tw.."<#>.", 1, "Nhi�m v� Th�y qu�i/v6")
end;

if (UTask_tw == 60*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Ti�p theo c� th� nh�n Nhi�m v� xu�t s�. Hi�n �� "..UTask_tw.."<#>.", 1, "Nhi�m v� xu�t s� /v7")
end;

if (UTask_tw > 60*256) and (UTask_tw < 70*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Hi�n ng��i �ang ti�n h�nh l� Nhi�m v� xu�t s�. Hi�n �� "..UTask_tw.."<#>.", 1, "Nhi�m v� xu�t s� /v7")
end;

if (UTask_tw >= 70*256) and (UTask_tw < 80*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Hi�n ng��i �ang ti�n h�nh l� Nhi�m v� Tr�ng ph�n s� m�n. Hi�n �� "..UTask_tw.."<#>.", 1, "Tr�ng ph�n s� m�n/v8")
end;

end;

----------------------------------------------------------------------------------------------

function o1()
Say("Ng�y tr��c S� V��ng Chung T��ng kh�i binh t�i ��ng ��nh h�, kh�ng Kim ch�ng T�ng! V� sau S� V��ng b� s�t h�i,ngh�a qu�n t�n D��ng Y�u l�m th� l�nh,x�ng l� ��i Th�nh Thi�n V��ng! Ngh�a qu�n ph�t tri�n th�n t�c. V� sau b� Nh�c Phi ti�u di�t. Sau n�y con g�i D��ng y�u l� D��ng Anh tr� l�i n�i ��y, chi�u t�p ngh�a qu�n, n�i ti�p nghi�p l�n!", 4, "Bi�t r�i/ok", "V� tr� ��a l� /o2", "��a v� giang h� /o3", "��c s�c m�n ph�i/o4")
end;

function o2()
Say("Thi�n V��ng ��o l� m�t c� ��o thu�c khu v�c ��ng ��nh h�, l� c�n c� ��a v� c�ng l� T�ng ��n c�a ngh�a qu�n", 4, "Bi�t r�i/ok", "Kh�i nguy�n m�n ph�i/o1", "��a v� giang h� /o3", "��c s�c m�n ph�i/o4")
end;

function o3()
Say("B�n bang b�n b� s�ng h�. C� bi tr�ng, c� h�o h�ng,bang ch�ng an c� l�c nghi�p! Kh�ng Kim ch�ng T�ng! Thi�n h� vang danh!", 4, "Bi�t r�i/ok", "Kh�i nguy�n m�n ph�i/o1", "V� tr� ��a l� /o2", "��c s�c m�n ph�i/o4")
end;

function o4()
Say("�� t� b�n bang r�t �o�n k�t! H�o kh� xung thi�n! Xem tr�ng ngh�a kh�! Ai ai c�ng l� H�o h�n!", 4, "Bi�t r�i/ok", "Kh�i nguy�n m�n ph�i/o1", "V� tr� ��a l� /o2", "��a v� giang h� /o3")
end;

--------------------------------

function m1()
Say("V� tr�: <color=blue>T�m cung<color>   T�a ��: <color=blue>201,199<color>   Ph� tr�ch: <color=blue>nhi�m v�<color><enter>T�nh t�nh c��ng ng�nh, ch� c�ng v� t�,v� ngh� cao c��ng, gan d� h�n ng��i, kh�ng k�m g� tu mi nam t�!", 14, "Bi�t r�i/ok", "Thi�n H� ph�p L� V�n Vi�n/m2", "��a H� ph�p H� Th�nh/m3", "Ti�n s� V��ng T� /m4", "T� s� C� B�ch/m5", "H�u s� D��ng H� /m6", "T�n ��o L�nh/m7", "M�n �� b�n binh kh� /m8", "M�n �� b�n trang b� /m9", "M�n �� b�n D��c ph�m/m10", "Thuy�n phu b�n ph�a ��ng/m11", "Thuy�n phu b�n ph�a nam/m12", "Thuy�n phu b�n ph�a t�y/m13", "Thuy�n phu b�n ph�a b�c/m14")
end;

function m2()
Say("V� tr�: <color=blue>��i �i�n<color>   T�a ��: <color=blue>200,199<color>   Ph� tr�ch: <color=blue>nhi�m v�<color><enter> M�t ng��i c�c tr�ng ngh�a kh�, r�t trung th�nh v�i bang ch� D��ng Anh, ���c ��ng m�n n� ph�c!", 14, "Bi�t r�i/ok", "Bang ch� D��ng Anh/m1", "��a H� ph�p H� Th�nh/m3", "Ti�n s� V��ng T� /m4", "T� s� C� B�ch/m5", "H�u s� D��ng H� /m6", "T�n ��o L�nh/m7", "M�n �� b�n binh kh� /m8", "M�n �� b�n trang b� /m9", "M�n �� b�n D��c ph�m/m10", "Thuy�n phu b�n ph�a ��ng/m11", "Thuy�n phu b�n ph�a nam/m12", "Thuy�n phu b�n ph�a t�y/m13", "Thuy�n phu b�n ph�a b�c/m14")
end;

function m3()
Say("V� tr�: <color=blue>ph�a ��ng Hi�u l�nh ��i<color>   T�a ��: <color=blue>209,196<color>   Ph� tr�ch: <color=blue>nhi�m v�<color><enter> l�m vi�c lu�n c�n th�n, ���c ��ng m�n tin y�u.", 14, "Bi�t r�i/ok", "Bang ch� D��ng Anh/m1", "Thi�n H� ph�p L� V�n Vi�n/m2", "Ti�n s� V��ng T� /m4", "T� s� C� B�ch/m5", "H�u s� D��ng H� /m6", "T�n ��o L�nh/m7", "M�n �� b�n binh kh� /m8", "M�n �� b�n trang b� /m9", "M�n �� b�n D��c ph�m/m10", "Thuy�n phu b�n ph�a ��ng/m11", "Thuy�n phu b�n ph�a nam/m12", "Thuy�n phu b�n ph�a t�y/m13", "Thuy�n phu b�n ph�a b�c/m14")
end;

function m4()
Say("V� tr�: <color=blue>Ti�n �i�n<color>   T�a ��: <color=blue>200,199<color>   Ph� tr�ch: <color=blue>nhi�m v�<color><enter>Nh�n x�ng: 'Ngh�a C�ng minh'. L� ng��i r�t tr�ng ngh�a kh�, quang minh l�i l�c. R�t trung th�nh v�i bang ch� ", 14, "Bi�t r�i/ok", "Bang ch� D��ng Anh/m1", "Thi�n H� ph�p L� V�n Vi�n/m2", "��a H� ph�p H� Th�nh/m3", "T� s� C� B�ch/m5", "H�u s� D��ng H� /m6", "T�n ��o L�nh/m7", "M�n �� b�n binh kh� /m8", "M�n �� b�n trang b� /m9", "M�n �� b�n D��c ph�m/m10", "Thuy�n phu b�n ph�a ��ng/m11", "Thuy�n phu b�n ph�a nam/m12", "Thuy�n phu b�n ph�a t�y/m13", "Thuy�n phu b�n ph�a b�c/m14")
end;

function m5()
Say("V� tr�: <color=blue>t�y Bi�n �i�n<color>   T�a ��: <color=blue>202,193<color>   Ph� tr�ch: <color=blue>nhi�m v�<color><enter>Nh�n x�ng 'B�t Di�n Th�n'. T�nh t�nh n�ng n�y, c�c k� h�o th�ng!", 14, "Bi�t r�i/ok", "Bang ch� D��ng Anh/m1", "Thi�n H� ph�p L� V�n Vi�n/m2", "��a H� ph�p H� Th�nh/m3", "Ti�n s� V��ng T� /m4", "H�u s� D��ng H� /m6", "T�n ��o L�nh/m7", "M�n �� b�n binh kh� /m8", "M�n �� b�n trang b� /m9", "M�n �� b�n D��c ph�m/m10", "Thuy�n phu b�n ph�a ��ng/m11", "Thuy�n phu b�n ph�a nam/m12", "Thuy�n phu b�n ph�a t�y/m13", "Thuy�n phu b�n ph�a b�c/m14")
end;

function m6()
Say("V� tr�: <color=blue>��ng Bi�n �i�n<color>   T�a ��: <color=blue>218,198<color>   Ph� tr�ch: <color=blue>nhi�m v�<color><enter>Nh�n x�ng: 'C�u Khi�u Linh H�', anh h�ng tu�n ki�t, th�ng minh h�n ng��i!", 14, "Bi�t r�i/ok", "Bang ch� D��ng Anh/m1", "Thi�n H� ph�p L� V�n Vi�n/m2", "��a H� ph�p H� Th�nh/m3", "Ti�n s� V��ng T� /m4", "T� s� C� B�ch/m5", "T�n ��o L�nh/m7", "M�n �� b�n binh kh� /m8", "M�n �� b�n trang b� /m9", "M�n �� b�n D��c ph�m/m10", "Thuy�n phu b�n ph�a ��ng/m11", "Thuy�n phu b�n ph�a nam/m12", "Thuy�n phu b�n ph�a t�y/m13", "Thuy�n phu b�n ph�a b�c/m14")
end;

function m7()
Say("V� tr�: <color=blue>L�i v�o Th�y tr�i<color>   T�a ��: <color=blue>191,210<color>   Ph� tr�ch: <color=blue>nhi�m v�<color><enter>l� ng��i n�ng n�y nh�ng r�t trung ngh�a", 14, "Bi�t r�i/ok", "Bang ch� D��ng Anh/m1", "Thi�n H� ph�p L� V�n Vi�n/m2", "��a H� ph�p H� Th�nh/m3", "Ti�n s� V��ng T� /m4", "T� s� C� B�ch/m5", "H�u s� D��ng H� /m6", "M�n �� b�n binh kh� /m8", "M�n �� b�n trang b� /m9", "M�n �� b�n D��c ph�m/m10", "Thuy�n phu b�n ph�a ��ng/m11", "Thuy�n phu b�n ph�a nam/m12", "Thuy�n phu b�n ph�a t�y/m13", "Thuy�n phu b�n ph�a b�c/m14")
end;

function m8()
Say("V� tr�: <color=blue>Qu�ng tr��ng Hi�u l�nh ��i<color>   T�a ��: <color=blue>207,193<color>   Ph� tr�ch: <color=blue>Giao d�ch binh kh�<color>", 14, "Bi�t r�i/ok", "Bang ch� D��ng Anh/m1", "Thi�n H� ph�p L� V�n Vi�n/m2", "��a H� ph�p H� Th�nh/m3", "Ti�n s� V��ng T� /m4", "T� s� C� B�ch/m5", "H�u s� D��ng H� /m6", "T�n ��o L�nh/m7", "M�n �� b�n trang b� /m9", "M�n �� b�n D��c ph�m/m10", "Thuy�n phu b�n ph�a ��ng/m11", "Thuy�n phu b�n ph�a nam/m12", "Thuy�n phu b�n ph�a t�y/m13", "Thuy�n phu b�n ph�a b�c/m14")
end;

function m9()
Say("V� tr�: <color=blue>Qu�ng tr��ng Hi�u l�nh ��i<color>   T�a ��: <color=blue>205,194<color>   Ph� tr�ch: <color=blue>Giao d�ch trang b�<color>", 14, "Bi�t r�i/ok", "Bang ch� D��ng Anh/m1", "Thi�n H� ph�p L� V�n Vi�n/m2", "��a H� ph�p H� Th�nh/m3", "Ti�n s� V��ng T� /m4", "T� s� C� B�ch/m5", "H�u s� D��ng H� /m6", "T�n ��o L�nh/m7", "M�n �� b�n binh kh� /m8", "M�n �� b�n D��c ph�m/m10", "Thuy�n phu b�n ph�a ��ng/m11", "Thuy�n phu b�n ph�a nam/m12", "Thuy�n phu b�n ph�a t�y/m13", "Thuy�n phu b�n ph�a b�c/m14")
end;

function m10()
Say("V� tr�: <color=blue>Qu�ng tr��ng Hi�u l�nh ��i<color>   T�a ��: <color=blue>212,195<color>   Ph� tr�ch: <color=blue>Giao d�ch D��c ph�m<color>", 14, "Bi�t r�i/ok", "Bang ch� D��ng Anh/m1", "Thi�n H� ph�p L� V�n Vi�n/m2", "��a H� ph�p H� Th�nh/m3", "Ti�n s� V��ng T� /m4", "T� s� C� B�ch/m5", "H�u s� D��ng H� /m6", "T�n ��o L�nh/m7", "M�n �� b�n binh kh� /m8", "M�n �� b�n trang b� /m9", "Thuy�n phu b�n ph�a ��ng/m11", "Thuy�n phu b�n ph�a nam/m12", "Thuy�n phu b�n ph�a t�y/m13", "Thuy�n phu b�n ph�a b�c/m14")
end;

function m11()
Say("V� tr�: <color=blue>b�n t�u ph�a ��ng<color>   T�a ��: <color=blue>218,210<color>   Ph� tr�ch: <color=blue>giao th�ng<color>", 14, "Bi�t r�i/ok", "Bang ch� D��ng Anh/m1", "Thi�n H� ph�p L� V�n Vi�n/m2", "��a H� ph�p H� Th�nh/m3", "Ti�n s� V��ng T� /m4", "T� s� C� B�ch/m5", "H�u s� D��ng H� /m6", "T�n ��o L�nh/m7", "M�n �� b�n binh kh� /m8", "M�n �� b�n trang b� /m9", "M�n �� b�n D��c ph�m/m10", "Thuy�n phu b�n ph�a nam/m12", "Thuy�n phu b�n ph�a t�y/m13", "Thuy�n phu b�n ph�a b�c/m14")
end;

function m12()
Say("V� tr�: <color=blue>b�n t�u ph�a nam<color>   T�a ��: <color=blue>176,216<color>   Ph� tr�ch: <color=blue>giao th�ng<color>", 14, "Bi�t r�i/ok", "Bang ch� D��ng Anh/m1", "Thi�n H� ph�p L� V�n Vi�n/m2", "��a H� ph�p H� Th�nh/m3", "Ti�n s� V��ng T� /m4", "T� s� C� B�ch/m5", "H�u s� D��ng H� /m6", "T�n ��o L�nh/m7", "M�n �� b�n binh kh� /m8", "M�n �� b�n trang b� /m9", "M�n �� b�n D��c ph�m/m10", "Thuy�n phu b�n ph�a ��ng/m11", "Thuy�n phu b�n ph�a t�y/m13", "Thuy�n phu b�n ph�a b�c/m14")
end;

function m13()
Say("V� tr�: <color=blue>b�n t�u ph�a t�y<color>   T�a ��: <color=blue>183,189<color>   Ph� tr�ch: <color=blue>giao th�ng<color>", 14, "Bi�t r�i/ok", "Bang ch� D��ng Anh/m1", "Thi�n H� ph�p L� V�n Vi�n/m2", "��a H� ph�p H� Th�nh/m3", "Ti�n s� V��ng T� /m4", "T� s� C� B�ch/m5", "H�u s� D��ng H� /m6", "T�n ��o L�nh/m7", "M�n �� b�n binh kh� /m8", "M�n �� b�n trang b� /m9", "M�n �� b�n D��c ph�m/m10", "Thuy�n phu b�n ph�a ��ng/m11", "Thuy�n phu b�n ph�a nam/m12", "Thuy�n phu b�n ph�a b�c/m14")
end;

function m14()
Say("V� tr�: <color=blue>b�n t�u ph�a b�c<color>   T�a ��: <color=blue>241,181<color>   Ph� tr�ch: <color=blue>giao th�ng<color>", 14, "Bi�t r�i/ok", "Bang ch� D��ng Anh/m1", "Thi�n H� ph�p L� V�n Vi�n/m2", "��a H� ph�p H� Th�nh/m3", "Ti�n s� V��ng T� /m4", "T� s� C� B�ch/m5", "H�u s� D��ng H� /m6", "T�n ��o L�nh/m7", "M�n �� b�n binh kh� /m8", "M�n �� b�n trang b� /m9", "M�n �� b�n D��c ph�m/m10", "Thuy�n phu b�n ph�a ��ng/m11", "Thuy�n phu b�n ph�a nam/m12", "Thuy�n phu b�n ph�a t�y/m13")
end;

--------------------------------

function c1()
Say("Kh�ng c� ���ng n�i ��t li�n. Ng�i thuy�n c� th� ��n Ba L�ng huy�n", 6, "Bi�t r�i/ok", "Trung t�m ��o/c2", "Ph�a ��ng ��o/c3", "Ph�a nam ��o/c4", "Ph�a t�y ��o/c5", "Ph�a b�c ��o/c6")
end;

function c2()
Say("T�ng ��n th� t� c�: Ti�n �i�n (201,198) ; Hi�u l�nh ��i (210,194) ; ��i �i�n (214,192) ; T�m cung (223,196) ", 6, "Bi�t r�i/ok", "C�c v�ng l�n c�n/c1", "Ph�a ��ng ��o/c3", "Ph�a nam ��o/c4", "Ph�a t�y ��o/c5", "Ph�a b�c ��o/c6")
end;

function c3()
Say("C� b�n t�u v� ��y ��ng ��nh h� (216,205) .", 6, "Bi�t r�i/ok", "C�c v�ng l�n c�n/c1", "Trung t�m ��o/c2", "Ph�a nam ��o/c4", "Ph�a t�y ��o/c5", "Ph�a b�c ��o/c6")
end;

function c4()
Say("C� b�n t�u v� Th�y tr�i", 6, "Bi�t r�i/ok", "C�c v�ng l�n c�n/c1", "Trung t�m ��o/c2", "Ph�a ��ng ��o/c3", "Ph�a t�y ��o/c5", "Ph�a b�c ��o/c6")
end;

function c5()
Say("C� b�n t�u.", 6, "Bi�t r�i/ok", "C�c v�ng l�n c�n/c1", "Trung t�m ��o/c2", "Ph�a ��ng ��o/c3", "Ph�a nam ��o/c4", "Ph�a b�c ��o/c6")
end;

function c6()
Say("C� b�n t�u v� Thi�n V��ng ��o s�n ��ng (226,186)?.", 6, "Bi�t r�i/ok", "C�c v�ng l�n c�n/c1", "Trung t�m ��o/c2", "Ph�a ��ng ��o/c3", "Ph�a nam ��o/c4", "Ph�a t�y ��o/c5")
end;

--------------------------------

function v1()							
Talk(6, "", "Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i c� th� gia nh�p Thi�n V��ng Bang, tr� th�nh <color=blue>Th� V�<color>, h�c ���c v� c�ng <color=blue>Kinh L�i Tr�m, H�i Phong L�c Nh�n, Tr�m Long Quy�t<color>.<enter>Ti�p nh�n nhi�m v�, c�n ph�i ��t �i�u ki�n sau: Ng� h�nh thu�c t�nh: h� Kim, ��ng c�p ��t ��n 10, kh�ng l�m nhi�m v� nh�p m�n c�a b�t k� m�n ph�i n�o","B��c 1: ��n <color=blue>l�i v�o Th�y tr�i ph� Nam<color> g�p <color=blue>T�n ��o L�nh<color>. Ti�p nh�n nhi�m v�, di9 <color=blue>Ba L�ng huy�n<color> mua r��u <color=red>B�ng Lai Xu�n<color>.", "B��c 2: ��n <color=blue>T�u qu�n � Ba L�ng huy�n<color> ti�p nh�n nhi�m v� �i t�m 3 lo�i d��c li�u �� c�t r��u, g�m: <color=red>Linh Chi, Huy�n S�m, H� Th� �<color>.", "B��c 3: ��n <color=blue>ph�a ��ng V� L�ng s�n<color> t�m <color=red>Linh Chi, Huy�n S�m. H� Th� �<color>.", "B��c 4: Mang d��c li�u tr� l�i <color=blue>T�u qu�n<color> bi�t ���c c�n ph�i ��i <color=blue>1 gi�<color>. 1 gi� sau quay l�i �� l�y r��u <color=red>B�ng Lai Xu�n<color>.", "B��c 5: Tr� v� <color=blue>Thi�n V��ng ��o<color>, giao <color=red>B�ng Lai Xu�n<color> cho <color=blue>T�n ��o L�nh<color>, nhi�m v� ho�n th�nh. N�u 'B�ng Lai Xu�n' b� m�t, ph�i th�c hi�n l�i t� ��u")
end;


function v2()
Talk(4, "", "Sau khi ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>Th� V� tr��ng<color>, h�c ���c v� c�ng <color=blue>Thi�n V��ng Ch�y ph�p#Thi�n V��ng Th��ng ph�p#Thi�n V��ng �ao ph�p<color>.<enter>Ti�p nh�n nhi�m v� n�y c�n ph�i l� �� t� tr�n c�p 10","B��c 1: ��n <color=blue>Ti�n �i�n<color> g�p <color=blue>V��ng T�<color>. Ti�p nh�n nhi�m v�, ��n <color=blue>Thi�n V��ng ��o S�n ��ng<color> t�m <color=red>3 vi�n K� Huy�t Th�ch<color>.", "B��c 2: ��n <color=blue>Thi�n V��ng ��o S�n ��ng<color> ��nh 3 con <color=blue>Kim Mi�u V��ng, X� L� tinh, ��i Ho�n H�ng<color> s� c� th� l�y ���c <color=red>K� Huy�t Th�ch<color>.", "B��c 3: Tr� v� <color=blue>Ti�n �i�n<color> giao <color=red>3 vi�n K� Huy�t Th�ch<color> cho <color=blue>V��ng T�<color>, nhi�m v� ho�n th�nh. ")
end;


function v3()
Talk(4, "", "Sau khi ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>Th� Tr�i H�n T��ng<color>, h�c ���c v� c�ng <color=blue>T�nh T�m Quy�t<color>.<enter>Ti�p nh�n nhi�m v� c�n ph�i l� �� t� c�p 20 v� �� ho�n th�nh nhi�m v� K� Huy�t Th�ch.","B��c 1: ��n <color=blue>��ng Bi�n �i�n<color> g�p <color=blue>D��ng H�<color>. Ti�p nh�n nhi�m v�, ��n <color=blue>B�ch Th�y ��ng<color> ��nh th� ph� ", "B��c 2: ��n <color=blue>B�ch Th�y ��ng<color>, l�n l��t ��nh b�i <color=blue>3 t�n Th� Ph� ��u m�c<color>, nh�n ���c <color=red>1 l� c� G�m<color>.", "B��c 3: Tr� v� <color=blue>Thi�n V��ng ��o<color> giao <color=red>c� G�m<color> cho <color=blue>D��ng H�<color>, nhi�m v� ho�n th�nh. N�u c� G�m m�t �i, c�n ph�i th�c hi�n nhi�m v� l�i t� ��u!")
end;


function v4()
Talk(4, "", "Sau khi ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>Ch��ng �� ��u l�nh<color>, h�c ���c v� c�ng <color=blue>B�t Phong Tr�m, D��ng Quan Tam �i�p, H�ng V�n Quy�t<color>.<enter>Ti�p nh�n nhi�m v� c�n ph�i l� �� t� c�p 30 v� �� ho�n th�nh Nhi�m v� B�ch Th�y ��ng.","B��c 1: ��n <color=blue>t�y Bi�n �i�n<color> g�p <color=blue>C� B�ch<color>. Ti�p nh�n nhi�m v�, ��n <color=blue>Y�n T� ��ng<color> t�m <color=red>Thi�n V��ng l�nh<color>.", "B��c 2: ��n <color=blue>Y�n T� ��ng<color> ��nh b�i t�n ��u l�nh <color=blue>B�o T� ��u<color> s� l�y ���c <color=red>Thi�n V��ng l�nh<color>.", "B��c 3: Tr� v� <color=blue>Thi�n V��ng ��o<color> giao <color=red>Thi�n V��ng l�nh<color> cho <color=blue>C� B�ch<color>, nhi�m v� ho�n th�nh. N�u Thi�n V��ng l�nh m�t �i, c�n ph�i th�c hi�n nhi�m v� l�i t� ��u!")
end;


function v5()
Talk(7, "", "Sau khi ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>Th�y ��o Th�ng L�nh<color>, h�c ���c v� c�ng <color=blue>�o�n H�n Th�ch<color>.<enter>Ti�p nh�n nhi�m v� c�n ph�i l� �� t� c�p 40 v� �� ho�n th�nh Nhi�m v� Thi�n V��ng l�nh.","B��c 1: ��n <color=blue>��i �i�n<color> g�p <color=blue>L� V�n Vi�n<color>. Ti�p nh�n nhi�m v�, ��n <color=blue>Ba L�ng huy�n<color> t�m <color=blue>Ng� Th�n y<color> xin thu�c gi�i n�c r�n", "B��c 2: �i <color=blue>Ba L�ng huy�n<color> t�m <color=blue>Ng� Th�n y (199,200)<color>. Ti�p nh�n nhi�m v�, �i t�m 2 lo�i D��c li�u: <color=red>Da th�n l�n<color> v� <color=red>ch�n L�c Th� Quy<color>.", "B��c 3: �i <color=blue>Ph�c L�u ��ng<color>, ��nh b�i <color=blue>Th�n l�n ��<color> c� th� l�y ���c <color=red>Da Th�n l�n<color>.", "V� l�i <color=blue>Th�y tr�i<color> t�m <color=blue> Ng� �ng (179,210)<color>, bi�t ���c c�n ph�i c� tr�ng �� m�i l�y ���c chan r�a xanh. H�y di t�m <color=blue>Th�y Sinh<color>,��a b� y�u c�u d�ng tr�ng g� ��i l�y tr�ng ��. L�i t�m <color=blue>H� T�u (190,213)<color>, ti�p nh�n nhi�m v� ��n <color=blue>Ba L�ng huy�n<color> mua <color=red> h�t sen <color>.","Mang h�t sen v� cho H� T�u, nh�n ���c <color=red>3 qu� tr�ng g�<color>, mang tr�ng g� giao cho <color=blue>Th�y Sinh (184,212)<color>, nh�n ���c <color=red>5 con tr�ng ��<color>,mang tr�n v� cho <color=blue>Ng� �ng (179,210)<color>,nh�n ���c <color=red>L�c Th� Quy<color>.", "B��c 4: Tr� v� <color=blue>��i �i�n<color>, giao 2 D��c li�u cho <color=blue>L� V�n Vi�n<color>, nhi�m v� ho�n th�nh. ")
end;


function v6()
Talk(4, "", "Sau khi ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>H� ��o T��ng qu�n<color>, h�c ���c v� c�ng <color=blue>Kim Chung Tr�o<color>.<enter>Ti�p nh�n nhi�m v� c�n ph�i l� �� t� c�p 50 v� �� ho�n th�nh Nhi�m v� thu�c gi�i ��c.","B��c 1: ��n <color=blue>ph�a ��ng Hi�u l�nh ��i<color> g�p <color=blue>H� Th�nh<color>. Ti�p nh�n nhi�m v�, xu�ng ��y ��ng ��nh h� �i�u tra Th�y qu�i", "B��c 2: �i xu�ng <color=blue>��y ��ng ��nh h�<color>, xu�ng <color=blue>t�ng 2<color> t�m th�y <color=blue>Th�y qu�i<color>,��nh b�i Th�y qu�i s� l�y ���c <color=red>Ng� S�c th�ch<color>.", "B��c 3: Tr� v� <color=blue>Thi�n V��ng Bang <color> giao <color=red>Ng� S�c th�ch<color> cho <color=blue>H� Th�nh<color>, nhi�m v� ho�n th�nh. N�u Ng� S�c Th�ch m�t �i, c�n ph�i th�c hi�n nhi�m v� l�i t� ��u!")
end;


function v7()
Talk(5, "", "Sau khi ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>Tr�n Bang Nguy�n so�i<color>, thu�n l�i xu�t s�.<enter>Ti�p nh�n nhi�m v� c�n ph�i l� �� t� c�p 50 v� �� ho�n th�nh Nhi�m v� Th�y qu�i.","B��c 1: ��n <color=blue>T�m cung<color> g�p <color=blue>Bang ch� D��ng Anh<color>. Ti�p nh�n nhi�m v�, ��n <color=blue>Thanh Loa ��o <color> l�y l�i <color=red>Thi�n V��ng Di Th�<color>.", "B��c 2: Ng�i thuy�n ��n <color=blue>Thanh Loa ��o <color>, ��nh b�i <color=blue>C�c tinh, c� s�u tinh<color> ho�c <color=blue>Th�n l�n tinh<color> s� l�y ���c 1 chi�c <color=red>Ch�a kh�a<color>. ��n ph�i b�c h� m� <color=blue>B�o r��ng (205,186)<color>,ph�t hi�n Thi�n V��ng Di Th� �� b� b�n ng��i Kim l�y �i!", "B��c 3: �i v�o <color=blue>Thanh Loa ��o S�n ��ng<color>, ��nh b�i t�n th� l�nh <color=blue>�� Nh�n<color>, l�y l�i <color=red>Thi�n V��ng Di Th�<color>.", "B��c 4: Tr� v� <color=blue>T�m cung<color> giao <color=red>Thi�n V��ng Di Th�<color> cho <color=blue>Bang ch� D��ng Anh<color>, nhi�m v� ho�n th�nh. N�u Thi�n V��ng Di Th� m�t �i,c�n ph�i th�c hi�n nhi�m v� l�i t� ��u!")
end;

function v8()
Talk(3,"","Th�ng qua Tr�ng ph�n s� m�n, ng��i ���c phong l� <color=blue>K�nh Thi�n Nguy�n So�i<color>, h�c ���c tuy�t h�c tr�n ph�i <color=blue>Thi�n V��ng Chi�n �, v� c�ng: V� T�m Tr�m, Huy�t Chi�n B�t Ph��ng, Th�a Long Quy�t<color>.","B��c 1: Sau khi ��t ��n c�p 60, ��n <color=blue>T�m cung<color> g�p <color=blue>Bang ch� D��ng Anh<color>, xin ���c tr�ng ph�n Thi�n V��ng Bang.","B��c 2: T�ng cho m�n ph�i <color=red>50000 ng�n l��ng<color> tr�ng ph�n Thi�n V��ng Bang.")
end;

--------------------------------

function ok()
end;
