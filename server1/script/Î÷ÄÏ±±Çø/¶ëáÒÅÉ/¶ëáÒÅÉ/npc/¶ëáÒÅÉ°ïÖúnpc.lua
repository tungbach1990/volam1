--�����ɰ���NPC

Include("\\script\\global\\map_helper.lua")
Include("\\script\\task\\newtask\\education\\dragonfive.lua")
npc_name = "Tu� Ni"

function main(sel)

UTask_em = GetTask(1)

if (UTask_em < 10*256) then						--δ�Ӷ�������������δ�������
	if (GetFaction() ~= "") then				--�������Ѿ�������һ����
		Say("Th� ch� c� g� ch� gi�o ch�ng?", 3, "T�m hi�u qu� ph�i/org", "T�m hi�u c�c v� n� hi�p/member", "T�m hi�u b� c�c n�i n�y/config")
		return
	else
		Say("Th� ch� mu�n gia nh�p m�n ph�i hay c� g� c�n gi�p ��?", 4, "T�m hi�u qu� ph�i/org", "T�m hi�u c�c v� n� hi�p/member", "T�m hi�u b� c�c n�i n�y/config", "L�m sao �� nh�p m�n?/task1")
		return	
	end
end;
	
if (UTask_em == 70*256) then					--�������Ѿ���ʦ		
	Say("Th� ra l� t� mu�i ��ng m�n! Kh�ng bi�t c� g� ch� gi�o!", 6, "T�m hi�u l�i Nga My Ph�i/org", "T�m hi�u l�i ��ng m�n tr��c kia/member", "T�m hi�u l�i b� c�c n�i n�y/config", "C�n nhi�m v� n�o �� l�m n�a/task3","T�m hi�u s� tr��ng luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help")
	return
end;	

Say("S� mu�i c� g� mu�n h�i?",7,"��i tho�i v�i Long Ng� /Uworld1000_word","T�m hi�u b�n ph�i/org", "T�m hi�u ��ng m�n/member", "T�m hi�u b� c�c n�i n�y/config", "T�m hi�u nhi�m v� /task3","T�m hi�u s� tr��ng luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help")

end;

----------------------------------------------------------------------------------------------

function org()
Say("Mu�n t�m hi�u ph��ng di�n n�o?", 4, "Kh�i nguy�n m�n ph�i/o1", "V� tr� ��a l� /o2", "��a v� giang h� /o3", "��c s�c m�n ph�i/o4")
end;


function member()
Say("Mu�n t�m hi�u ai?", 13, "Ch��ng m�n Thanh Hi�u S� Th�i/m1", "Chi�t Mai Ti�n T� Di�p B�ng Ng�n/m2", "Ph�t V�n Ti�n T� T�n � Phong/m3", "Ho�nh Ba Ti�n T� H� Linh Phi�u/m4", "Di Quang Ti�n T� T� V�n La/m5", "�nh Tuy�t Ti�n T� M�c V�n T� /m6", "B�i Nguy�t Ti�n T� T� T� Hinh/m7", "Ni C� Di�u Tr�n/m8", "Ni C� Di�u �n/m9", "Ni C� Di�u Nh� /m10", "Ni C� Di�u Linh/m11", "Ni C� Di�u T�m/m12", "Ni C� Di�u Khi�t/m13")
end;


function config()
Say("Mu�n t�m hi�u ph��ng di�n n�o?", 4, "C�c v�ng l�n c�n/c1", "Tr��c n�i/c2", "Ki�n tr�c ch�nh/c3", "Sau n�i/c4")
end;


function task1()
Say("B�n ph�i ch� thu nh�n �� t� n�. Mu�n nh�p m�n h�c ngh�, c�n th�ng qua nhi�m v� nh�p m�n.", 1, "T�m hi�u c� th� nhi�m v� nh�p m�n/v1")
end;


function task2()
Say("<#>: Ng��i �� xu�t s�, kh�ng c�n l�m nhi�m v� c�a b�n ph�i, hi�n ��"..UTask_em.."<#>.", 0)
end;


function task3()

UTask_em = GetTask(1)

if (UTask_em < 10*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�,tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng,���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Hi�n"..UTask_em.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Nhi�m v� nh�p m�n/v1")
end;

if (UTask_em == 10*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�,tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng,���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Hi�n"..UTask_em.."<#>, gi� �� nh�p m�n, ti�p theo c� th� ti�n h�nh:", 1, "Nhi�m v� g��ng ��ng/v2")
end;

if (UTask_em > 10*256) and (UTask_em < 20*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�,tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng,���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Hi�n"..UTask_em.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Nhi�m v� g��ng ��ng/v2")
end;

if (UTask_em == 20*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�,tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng,���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Hi�n"..UTask_em.."<#>, ti�p theo c� th� ti�n h�nh:", 1, "Nhi�m v� thu ph�c m�nh h� /v3")
end;

if (UTask_em > 20*256) and (UTask_em < 30*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�,tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng,���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Hi�n"..UTask_em.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Nhi�m v� thu ph�c m�nh h� /v3")
end;

if (UTask_em == 30*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�,tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng,���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Hi�n"..UTask_em.."<#>, ti�p theo c� th� ti�n h�nh:", 1, "Nhi�m v� H�a H� /v4")
end;

if (UTask_em > 30*256) and (UTask_em < 40*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�,tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng,���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Hi�n"..UTask_em.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Nhi�m v� H�a H� /v4")
end;

if (UTask_em == 40*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�,tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng,���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Hi�n"..UTask_em.."<#>, ti�p theo c� th� ti�n h�nh:", 1, "Nhi�m v� Kh�c ph� /v5")
end;

if (UTask_em > 40*256) and (UTask_em < 50*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�,tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng,���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Hi�n"..UTask_em.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Nhi�m v� Kh�c ph� /v5")
end;

if (UTask_em == 50*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�,tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng,���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Hi�n"..UTask_em.."<#>, ti�p theo c� th� ti�n h�nh:", 1, "Nhi�m v� T�n T��ng T� /v6")
end;

if (UTask_em > 50*256) and (UTask_em < 60*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�,tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng,���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Hi�n"..UTask_em.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Nhi�m v� T�n T��ng T� /v6")
end;

if (UTask_em == 60*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�,tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng,���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Hi�n"..UTask_em.."<#>, ti�p theo c� th� ti�n h�nh:", 1, "Nhi�m v� xu�t s� /v7")
end;

if (UTask_em > 60*256) and (UTask_em < 70*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�,tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng,���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Hi�n"..UTask_em.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Nhi�m v� xu�t s� /v7")
end;

if (UTask_em >= 70*256) and (UTask_em < 80*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�,tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng,���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Hi�n"..UTask_em.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Nhi�m v� xu�t s� /v8")
end;

end;

----------------------------------------------------------------------------------------------

function o1()
Say(" Nga Mi l� m�n ph�i do n� nhi s�ng l�p.'Nga Mi' v�a l� t�n g�i c�a v� s� t� s�ng l�p m�n ph�i v�a l� th�nh ��a n�i Nga Mi ", 4, "Bi�t r�i/ok", "V� tr� ��a l� /o2", "��a v� giang h� /o3", "��c s�c m�n ph�i/o4")
end;

function o2()
Say("Nga Mi s�n thu�c v�ng T�y Nam, th� n�i quanh co u�n l��n, tr�ng tr�ng �i�p �i�p", 4, "Bi�t r�i/ok", "Kh�i nguy�n m�n ph�i/o1", "��a v� giang h� /o3", "��c s�c m�n ph�i/o4")
end;

function o3()
Say("c�ng v�i  Thi�u L�m v� V� �ang h�p th�nh 3 danh m�n ch�nh ph�i l�n � Trung Nguy�n. C�c m�n ph�i trong thi�n h� do n� nhi s�ng l�p th� b�n m�n ��ng ��u", 4, "Bi�t r�i/ok", "Kh�i nguy�n m�n ph�i/o1", "V� tr� ��a l� /o2", "��c s�c m�n ph�i/o4")
end;

function o4()
Say("Nga Mi ph�i quy lu�t nghi�m kh�c. C�c �� t� ��u ph�i gi� m�nh trong s�ch. Kh�ng nh�ng v� ngh� cao c��ng m� c�m k� thi h�a c�ng tinh th�ng", 4, "Bi�t r�i/ok", "Kh�i nguy�n m�n ph�i/o1", "V� tr� ��a l� /o2", "��a v� giang h� /o3")
end;

--------------------------------

function m1()
Say("V� tr�: <color=blue>Ch�nh �i�n<color>  T�a ��: <color=blue>199,200<color>  ph� tr�ch <color=blue>nhi�m v�<color><enter>Tr�m m�c �t n�i nh�ng r�t khoan dung �� l��ng. Quy�t t�m ph�t d��ng quang ��i Nga Mi ph�i.V� nhi�m v� s�n s�ngth� hy sinh c� b�n th�n", 13, "Bi�t r�i/ok", "Chi�t Mai Ti�n T� Di�p B�ng Ng�n/m2", "Ph�t V�n Ti�n T� T�n � Phong/m3", "Ho�nh Ba Ti�n T� H� Linh Phi�u/m4", "Di Quang Ti�n T� T� V�n La/m5", "�nh Tuy�t Ti�n T� M�c V�n T� /m6", "B�i Nguy�t Ti�n T� T� T� Hinh/m7", "Ni C� Di�u Tr�n/m8", "Ni C� Di�u �n/m9", "Ni C� Di�u Nh� /m10", "Ni C� Di�u Linh/m11", "Ni C� Di�u T�m/m12", "Ni C� Di�u Khi�t/m13")
end;

function m2()
Say("V� tr�: <color=blue>Thanh �m ��nh<color>  T�a ��: <color=blue>239,332<color>  ph� tr�ch <color=blue>nhi�m v�<color><enter>tinh th�ng tr� ��o nh�ng t�nh c�ch ki�u c�ng. Bi�t bao trang nam t� �� �� l� v� c� ta", 13, "Bi�t r�i/ok", "Ch��ng m�n Thanh Hi�u S� Th�i/m1", "Ph�t V�n Ti�n T� T�n � Phong/m3", "Ho�nh Ba Ti�n T� H� Linh Phi�u/m4", "Di Quang Ti�n T� T� V�n La/m5", "�nh Tuy�t Ti�n T� M�c V�n T� /m6", "B�i Nguy�t Ti�n T� T� T� Hinh/m7", "Ni C� Di�u Tr�n/m8", "Ni C� Di�u �n/m9", "Ni C� Di�u Nh� /m10", "Ni C� Di�u Linh/m11", "Ni C� Di�u T�m/m12", "Ni C� Di�u Khi�t/m13")
end;

function m3()
Say("V� tr�: <color=blue>Ngh�nh Kh�ch Th�ch<color>  T�a ��: <color=blue>227,322<color>  ph� tr�ch <color=blue>nhi�m v�<color><enter>tinh th�ng �m lu�t, th�ng minh lanh l�i, s�ng n�i t�m", 13, "Bi�t r�i/ok", "Ch��ng m�n Thanh Hi�u S� Th�i/m1", "Chi�t Mai Ti�n T� Di�p B�ng Ng�n/m2", "Ho�nh Ba Ti�n T� H� Linh Phi�u/m4", "Di Quang Ti�n T� T� V�n La/m5", "�nh Tuy�t Ti�n T� M�c V�n T� /m6", "B�i Nguy�t Ti�n T� T� T� Hinh/m7", "Ni C� Di�u Tr�n/m8", "Ni C� Di�u �n/m9", "Ni C� Di�u Nh� /m10", "Ni C� Di�u Linh/m11", "Ni C� Di�u T�m/m12", "Ni C� Di�u Khi�t/m13")
end;

function m4()
Say("V� tr�: <color=blue>B�n S�n Ph�<color>  T�a ��: <color=blue>229,320<color>  ph� tr�ch <color=blue>nhi�m v�<color><enter> b�n ngo�i �a s�u �a c�m nh�ng b�n trong c�ng r�n ��i khic� ch�p. M�t khi �� quy�t ��nh chuy�n g� th� kh� ai ng�n c�n ���c", 13, "Bi�t r�i/ok", "Ch��ng m�n Thanh Hi�u S� Th�i/m1", "Chi�t Mai Ti�n T� Di�p B�ng Ng�n/m2", "Ph�t V�n Ti�n T� T�n � Phong/m3", "Di Quang Ti�n T� T� V�n La/m5", "�nh Tuy�t Ti�n T� M�c V�n T� /m6", "B�i Nguy�t Ti�n T� T� T� Hinh/m7", "Ni C� Di�u Tr�n/m8", "Ni C� Di�u �n/m9", "Ni C� Di�u Nh� /m10", "Ni C� Di�u Linh/m11", "Ni C� Di�u T�m/m12", "Ni C� Di�u Khi�t/m13")
end;

function m5()
Say("V� tr�: <color=blue>To�n Thi�n Ph�<color>  T�a ��: <color=blue>221,321<color>  ph� tr�ch <color=blue>nhi�m v�<color><enter> l� ng��i ho�t b�t vui v�, nh�n h�u ��ng y�u!", 13, "Bi�t r�i/ok", "Ch��ng m�n Thanh Hi�u S� Th�i/m1", "Chi�t Mai Ti�n T� Di�p B�ng Ng�n/m2", "Ph�t V�n Ti�n T� T�n � Phong/m3", "Ho�nh Ba Ti�n T� H� Linh Phi�u/m4", "�nh Tuy�t Ti�n T� M�c V�n T� /m6", "B�i Nguy�t Ti�n T� T� T� Hinh/m7", "Ni C� Di�u Tr�n/m8", "Ni C� Di�u �n/m9", "Ni C� Di�u Nh� /m10", "Ni C� Di�u Linh/m11", "Ni C� Di�u T�m/m12", "Ni C� Di�u Khi�t/m13")
end;

function m6()
Say("V� tr�: <color=blue>H�u ���ng<color>  T�a ��: <color=blue>242,305<color>  ph� tr�ch <color=blue>nhi�m v�<color><enter> th�n thi�n d� g�n, y�u th��ng s�c v�t, ��i l�c r�t nhu nh��c", 13, "Bi�t r�i/ok", "Ch��ng m�n Thanh Hi�u S� Th�i/m1", "Chi�t Mai Ti�n T� Di�p B�ng Ng�n/m2", "Ph�t V�n Ti�n T� T�n � Phong/m3", "Ho�nh Ba Ti�n T� H� Linh Phi�u/m4", "Di Quang Ti�n T� T� V�n La/m5", "B�i Nguy�t Ti�n T� T� T� Hinh/m7", "Ni C� Di�u Tr�n/m8", "Ni C� Di�u �n/m9", "Ni C� Di�u Nh� /m10", "Ni C� Di�u Linh/m11", "Ni C� Di�u T�m/m12", "Ni C� Di�u Khi�t/m13")
end;

function m7()
Say("V� tr�: <color=blue>T� Bi�n �i�n<color>  T�a ��: <color=blue>201,199<color>  ph� tr�ch <color=blue>nhi�m v�<color><enter>t�nh t�nh ph�ng kho�ng, h�nh x� th�n tr�ng, r�t y�u qu�  T�n � Phong", 13, "Bi�t r�i/ok", "Ch��ng m�n Thanh Hi�u S� Th�i/m1", "Chi�t Mai Ti�n T� Di�p B�ng Ng�n/m2", "Ph�t V�n Ti�n T� T�n � Phong/m3", "Ho�nh Ba Ti�n T� H� Linh Phi�u/m4", "Di Quang Ti�n T� T� V�n La/m5", "�nh Tuy�t Ti�n T� M�c V�n T� /m6", "Ni C� Di�u Tr�n/m8", "Ni C� Di�u �n/m9", "Ni C� Di�u Nh� /m10", "Ni C� Di�u Linh/m11", "Ni C� Di�u T�m/m12", "Ni C� Di�u Khi�t/m13")
end;

function m8()
Say("V� tr�: <color=blue>To�n Thi�n Ph�<color>  T�a ��: <color=blue>231,313<color>  ph� tr�ch <color=blue>nhi�m v�<color><enter> l� ng��i s�ng n�i t�m, tr�m t�nh �t n�i!", 13, "Bi�t r�i/ok", "Ch��ng m�n Thanh Hi�u S� Th�i/m1", "Chi�t Mai Ti�n T� Di�p B�ng Ng�n/m2", "Ph�t V�n Ti�n T� T�n � Phong/m3", "Ho�nh Ba Ti�n T� H� Linh Phi�u/m4", "Di Quang Ti�n T� T� V�n La/m5", "�nh Tuy�t Ti�n T� M�c V�n T� /m6", "B�i Nguy�t Ti�n T� T� T� Hinh/m7", "Ni C� Di�u �n/m9", "Ni C� Di�u Nh� /m10", "Ni C� Di�u Linh/m11", "Ni C� Di�u T�m/m12", "Ni C� Di�u Khi�t/m13")
end;

function m9()
Say("V� tr�: <color=blue>Ti�n �i�n<color>  T�a ��: <color=blue>200,198<color>  ph� tr�ch <color=blue>nhi�m v�<color><enter> l� ng��i nhu nh��c, lu�n l��ng l� gi�a h�ng tr�n v� c�i ph�t. Nhi�u l�c t� l�m kh� m�nh v� kh� c� ng��i kh�c!", 13, "Bi�t r�i/ok", "Ch��ng m�n Thanh Hi�u S� Th�i/m1", "Chi�t Mai Ti�n T� Di�p B�ng Ng�n/m2", "Ph�t V�n Ti�n T� T�n � Phong/m3", "Ho�nh Ba Ti�n T� H� Linh Phi�u/m4", "Di Quang Ti�n T� T� V�n La/m5", "�nh Tuy�t Ti�n T� M�c V�n T� /m6", "B�i Nguy�t Ti�n T� T� T� Hinh/m7", "Ni C� Di�u Tr�n/m8", "Ni C� Di�u Nh� /m10", "Ni C� Di�u Linh/m11", "Ni C� Di�u T�m/m12", "Ni C� Di�u Khi�t/m13")
end;

function m10()
Say("V� tr�: <color=blue>Gi�ng Kinh ���ng <color>  T�a ��: <color=blue>197,200<color>  ph� tr�ch <color=blue>nhi�m v�<color><enter> l� ng��i quy�t �o�n, y�u gh�t r� r�ng", 13, "Bi�t r�i/ok", "Ch��ng m�n Thanh Hi�u S� Th�i/m1", "Chi�t Mai Ti�n T� Di�p B�ng Ng�n/m2", "Ph�t V�n Ti�n T� T�n � Phong/m3", "Ho�nh Ba Ti�n T� H� Linh Phi�u/m4", "Di Quang Ti�n T� T� V�n La/m5", "�nh Tuy�t Ti�n T� M�c V�n T� /m6", "B�i Nguy�t Ti�n T� T� T� Hinh/m7", "Ni C� Di�u Tr�n/m8", "Ni C� Di�u �n/m9", "Ni C� Di�u Linh/m11", "Ni C� Di�u T�m/m12", "Ni C� Di�u Khi�t/m13")
end;

function m11()
Say("V� tr�: <color=blue>Qu�ng tr��ng<color>  T�a ��: <color=blue>247,305<color>  ph� tr�ch <color=blue>Giao d�ch binh kh�<color>", 13, "Bi�t r�i/ok", "Ch��ng m�n Thanh Hi�u S� Th�i/m1", "Chi�t Mai Ti�n T� Di�p B�ng Ng�n/m2", "Ph�t V�n Ti�n T� T�n � Phong/m3", "Ho�nh Ba Ti�n T� H� Linh Phi�u/m4", "Di Quang Ti�n T� T� V�n La/m5", "�nh Tuy�t Ti�n T� M�c V�n T� /m6", "B�i Nguy�t Ti�n T� T� T� Hinh/m7", "Ni C� Di�u Tr�n/m8", "Ni C� Di�u �n/m9", "Ni C� Di�u Nh� /m10", "Ni C� Di�u T�m/m12", "Ni C� Di�u Khi�t/m13")
end;

function m12()
Say("V� tr�: <color=blue>Qu�ng tr��ng<color>  T�a ��: <color=blue>246,307<color>  ph� tr�ch <color=blue>Giao d�ch trang b�<color>", 13, "Bi�t r�i/ok", "Ch��ng m�n Thanh Hi�u S� Th�i/m1", "Chi�t Mai Ti�n T� Di�p B�ng Ng�n/m2", "Ph�t V�n Ti�n T� T�n � Phong/m3", "Ho�nh Ba Ti�n T� H� Linh Phi�u/m4", "Di Quang Ti�n T� T� V�n La/m5", "�nh Tuy�t Ti�n T� M�c V�n T� /m6", "B�i Nguy�t Ti�n T� T� T� Hinh/m7", "Ni C� Di�u Tr�n/m8", "Ni C� Di�u �n/m9", "Ni C� Di�u Nh� /m10", "Ni C� Di�u Linh/m11", "Ni C� Di�u Khi�t/m13")
end;

function m13()
Say("V� tr�: <color=blue>Qu�ng tr��ng<color>  T�a ��: <color=blue>244,306<color>  ph� tr�ch <color=blue>Giao d�ch d��c ph�m<color>", 13, "Bi�t r�i/ok", "Ch��ng m�n Thanh Hi�u S� Th�i/m1", "Chi�t Mai Ti�n T� Di�p B�ng Ng�n/m2", "Ph�t V�n Ti�n T� T�n � Phong/m3", "Ho�nh Ba Ti�n T� H� Linh Phi�u/m4", "Di Quang Ti�n T� T� V�n La/m5", "�nh Tuy�t Ti�n T� M�c V�n T� /m6", "B�i Nguy�t Ti�n T� T� T� Hinh/m7", "Ni C� Di�u Tr�n/m8", "Ni C� Di�u �n/m9", "Ni C� Di�u Nh� /m10", "Ni C� Di�u Linh/m11", "Ni C� Di�u T�m/m12")
end;

--------------------------------

function c1()
Say("D��i ch�n n�i c� 2 h��ng �i. ��ng  �i Th�nh ��, Nam �i Tr��ng Giang Nguy�n ��u.", 4, "Bi�t r�i/ok", "Tr��c n�i/c2", "Ki�n tr�c ch�nh/c3", "Sau n�i/c4")
end;

function c2()
Say("Tr�n n�i g�m c�: Thanh �m ��nh (239,331) , To�n Thi�n Ph� (221,321) , Ngh�nh Kh�ch Th�ch (227,322) , B�n S�n Ph� (229,320) ", 4, "Bi�t r�i/ok", "C�c v�ng l�n c�n/c1", "Ki�n tr�c ch�nh/c3", "Sau n�i/c4")
end;

function c3()
Say("tr��c n�i c� Ti�n �i�n (237,311) , Gi�ng Kinh ���ng (240,308) , Ch�nh �i�n (248,304) , T� Bi�n �i�n (246,304) ", 4, "Bi�t r�i/ok", "C�c v�ng l�n c�n/c1", "Tr��c n�i/c2", "Sau n�i/c4")
end;

function c4()
Say("Sau n�i c� M�nh H� ��ng (281,297) v� Ng�c Ng� h� (303,308) .", 4, "Bi�t r�i/ok", "C�c v�ng l�n c�n/c1", "Tr��c n�i/c2", "Ki�n tr�c ch�nh/c3")
end;

--------------------------------

function v1()							
Talk(6, "", "Th�ng qua ho�n th�nh nhi�m v� n�y, c� th� gia nh�p Nga Mi ph�i, tr� th�nh <color=blue>B� Y Ni<color>, h�c ���c v� c�ng <color=blue>Phi�u Tuy�t Xuy�n V�n<color>.<enter>Ti�p nh�n nhi�m v�, c�n ph�i ��t �i�u ki�n sau: Ng� h�nh thu�c t�nh: h� Th�y, ��ng c�p ��t ��n 10, kh�ng l�m nhi�m v� nh�p m�n c�a b�t k� m�n ph�i n�o","B��c 1: ��n <color=blue>Thanh �m ��nh<color> g�p <color=blue>Di�p B�ng H�n<color>, ti�p nh�n nhi�m v�, qua 'Tr� quan'", "B��c 2: ��n <color=blue>Ngh�nh Kh�ch Th�ch<color> g�p <color=blue>T�n � Phong <color>, qua 'C�m quan'", "B��c 3: ��n <color=blue>B�n S�n Ph�<color> g�p <color=blue>H� Linh Phi�u<color>, qua 'V�n quan'", "B��c 4: ��n <color=blue>To�n Thi�n Ph�<color> g�p <color=blue>T� V�n L�u <color>,x�ng To�n Thi�n Ph�, ��nh b�i <color=blue>V� Y Ni<color>, l�y ���c <color=red>B�ch Ng�c Nh� �<color>.", "B��c 5: V� <color=blue>Ch�nh �i�n<color> giao <color=red>B�ch Ng�c Nh� �<color> cho <color=blue>Ch��ng m�n Thanh Hi�u S� Th�i<color>, ho�n th�nh nhi�m v�.")
end;


function v2()
Talk(9, "", "Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>V� Y Ni<color>, h�c ���c v� c�ng <color=blue>Nga Mi Ki�m ph�p,Nga Mi Ch��ng ph�p,Thu Phong Di�p<color>.<enter>Ti�p nh�n nhi�m v� n�y c�n ph�i l� �� t� tr�n c�p 10","B��c 1: ��n <color=blue>Ti�n �i�n<color> g�p <color=blue>Ni C� Di�u �n<color>, ti�p nh�n nhi�m v�,  �i l�y <color=red>n�a m�nh g��ng tr�i<color>.", "B��c 2: ��n <color=blue>D��i n�i<color> t�m <color=blue>Di�u �n t��ng c�ng (240,328)<color>, l�y ���c <color=red>n�a m�nh g��ng ph�i<color>.", "B��c 3: ��n <color=blue>Th�nh ��<color> t�m <color=blue>th� r�n <color>, ti�p nh�n nhi�m v� �i t�m <color=red>L��ng Ng�n Kho�ng<color>.", "B��c 4: Ra <color=blue>c�ng ph�a t�y Th�nh ��<color> �� t�m <color=red>L��ng Ng�n Kho�ng<color>.", "B��c 5: giao L��ng Ng�n Kho�ng cho <color=blue>th� r�n <color>, nh�n ���c <color=red>t�m g��ng ho�n ch�nh<color>.", "B��c 6: Tr� v� <color=blue>Ti�n �i�n<color>,��i tho�i v�i <color=blue>Di�u �n<color>, sau �� mang <color=red>g��ng ��ng<color> cho <color=blue>Di�u �n t��ng c�ng<color>. N�u g��ng ��ng b� m�t, ph�i th�c hi�n nhi�m v� l�i t� ��u.", "B��c 7: L�i xu�ng <color=blue>ch�n n�i<color>, giao <color=red>g��ng ��ng<color> cho <color=blue>Di�u �n t��ng c�ng<color>.", "B��c 8: Tr� v� <color=blue>Ti�n �i�n<color>, g�p <color=blue>Ni C� Di�u �n<color>, ho�n th�nh nhi�m v�.")
end;


function v3()
Talk(4, "", "Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>C�m Y Ni<color>, h�c ���c v� c�ng <color=blue>T� T��ng ��ng Quy,V�ng Nguy�t,Phong V� Phi�u H��ng<color>.<enter>Ti�p nh�n nhi�m v� c�n ph�i l� �� t� c�p 20 v� �� ho�n th�nh nhi�m v� g��ng ��ng.","B��c 1: ��n <color=blue>Gi�ng Kinh ���ng <color> g�p <color=blue>Ni C� Di�u Nh�<color>, ti�p nh�n nhi�m v�, ��n <color=blue>M�nh H� ��ng<color> thu ph�c m�nh h� ", "B��c 2: ��n <color=blue>M�nh H� ��ng<color>,li�n t�c ��nh b�i <color=blue>B�ch h� tinh (221,202)<color> 3 l�n", "B��c 3: Tr� v� <color=blue>Gi�ng Kinh ���ng <color>, b�o tin cho <color=blue>Ni C� Di�u Nh�<color>, ho�n th�nh nhi�m v�.")
end;


function v4()
Talk(5, "", "Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>B�ch Li�n Ti�n t�<color>, h�c ���c v� c�ng <color=blue>Nh�t Di�p Tri Thu, L�u Th�y, B�ng T�m Quy�t<color>.<enter>Ti�p nh�n nhi�m v� c�n ph�i l� �� t� c�p 30 v� �� ho�n th�nh nhi�m v� thu ph�c m�nh h� ","B��c 1: ��n <color=blue>h�u ���ng <color> g�p <color=blue>M�c V�n T�<color>, ti�p nh�n nhi�m v�, ��n <color=blue>Ng�c Ng� h�<color> t�m <color=red>H�a h�<color>.", "B��c 2: Tr��c khi �i t�m H�a h�, c�n ��n <color=blue>Th�nh ��<color> mua <color=red> ��i g�<color>.", "B��c 3: ��n <color=blue>Ng�c Ng� h�<color> ��nh b�i <color=blue>Th�n l�n ch�a<color>, t�m ���c <color=red>H�a h�<color>.", "B��c 4: Tr� v� <color=blue>h�u ���ng<color>, giao <color=red>H�a h�<color> cho <color=blue>M�c V�n T�<color>, ho�n th�nh nhi�m v�. N�u H�a h� b� m�t, ph�i th�c hi�n nhi�m v� l�i t� ��u.")
end;


function v5()
Talk(8, "", "Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>Thanh Li�n Ti�n t�<color>, h�c ���c v� c�ng <color=blue>B�t Di�t B�t Tuy�t, M�ng �i�p<color>.<enter>Ti�p nh�n nhi�m v� c�n ph�i l� �� t� c�p 40 v� �� ho�n th�nh nhi�m v� H�a h� ","B��c 1: ��n <color=blue>T� Bi�n �i�n<color> g�p <color=blue>T� T� Hinh<color>, ti�p nh�n nhi�m v�, �i t�m <color=red>kh�c ph� 'B�ch �i�u Tri�u Ph�ng'<color>.", "B��c 2: ��n <color=blue>Th�n Ti�n ��ng<color> t�m <color=blue>Cao nh�n (234,204)<color>, tr��c ti�n ��nh b�i <color=blue>Linh th�<color>, sau �� nh�n nhi�m v� �i t�m <color=red>'Ph� Dung C�m K� ��'<color>.", "B��c 3: Tr� v� <color=blue>Th�nh �� t�m Th�i B�nh Ti�u C�c<color>, g�p <color=blue>ch� Ti�u c�c (377,316)<color>, ti�p nh�n nhi�m v�, �i t�m <color=red>Linh X� H��ng Nang, �ng T�nh H� Th�n ph�<color> v� <color=red>B�ch T� Gi�i Ch�<color>.", "B��c 4: �i t�m <color=blue>Ti�t Ti�u Mu�i (383,315)<color> �� l�y <color=red>Linh X� H��ng Nang<color>?��n  T�n T��ng t� t�m <color=blue>T� V�n Ph�p s� (402,319)<color> �� l�y <color=red>�ng T�nh H� Th�n ph�<color>?t�m <color=blue>T�n Vi�n ngo�i (400,309)<color> �� l�y <color=red>B�ch T� Gi�i Ch�<color>.", "B��c 5: Tr� v� g�p <color=blue>Ch� Ti�u C�c<color>, giao <color=blue>3 th� �ng ta c�n<color>, l�y ���c <color=red>'Ph� Dung C�m K� ��'<color>.", "B��c 6: Tr� l�i <color=blue>Th�n Ti�n ��ng<color>, giao 'Ph� Dung C�m K� ��' cho <color=blue>Cao nh�n<color> ��i l�y <color=red>'B�ch �i�u Tri�u Ph�ng'<color>.", "B��c 7: Tr� v� <color=blue>T� Bi�n �i�n<color>, giao <color=red>'B�ch �i�u Tri�u Ph�ng'<color> cho <color=blue>T� T� Hinh<color>, ho�n th�nh nhi�m v�. N�u 'B�ch �i�u Tri�u Ph�ng' b� m�t, ph�i th�c hi�n nhi�m v� l�i t� ��u.")
end;


function v6()
Talk(5, "", "Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>T�n Hoa Thi�n N�<color>, h�c ���c v� c�ng <color=blue>Ph�t Quang Ph� Chi�u, T� H�ng Ph� ��<color>.<enter>Ti�p nh�n nhi�m v� c�n ph�i l� �� t� c�p 50 v� �� ho�n th�nh nhi�m v� Kh�c ph� ","B��c 1: ��n <color=blue>Ch�nh �i�n<color> g�p <color=blue>Ch��ng m�n Thanh Hi�u S� Th�i<color>, ti�p nh�n nhi�m v�, giao <color=red>'Kim Tuy�n T� T��ng Kim Cang Kinh'<color> ��n <color=blue>T�n T��ng t�<color>.", "B��c 2: ��n <color=blue>T�n T��ng t�<color>, g�p <color=blue>T� V�n Ph�p s�<color>,bi�t ���c ph��ng tr��ng T� H�i ��i s� �� ��n <color=blue> ��a ��o h�u vi�n<color>.", "B��c 3: �i v�o <color=blue> ��a ��o h�u vi�n<color>, ��nh b�i <color=blue>Ph�n t�ng ��u m�c<color>, c�u ���c T� H�i ��i s�, giao <color=red>'Kim Tuy�n T� T��ng Kim Cang Kinh'<color>.N�u 'Kim Tuy�n T� T��ng Kim Cang Kinh' b� m�t, ph�i th�c hi�n nhi�m v� l�i t� ��u.", "B��c 4: Tr� v� <color=blue>Ch�nh �i�n<color>, g�p <color=blue>Ch��ng m�n<color> ph�c m�nh, ho�n th�nh nhi�m v�.")
end;


function v7()
Talk(4, "", "Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>Th�nh N�<color>, thu�n l�i xu�t s�.<enter>Ti�p nh�n nhi�m v� c�n ph�i l� �� t� c�p 50 v� �� ho�n th�nh nhi�m v� T�n T��ng t� ","B��c 1: ��n <color=blue>Ch�nh �i�n<color> g�p <color=blue>Ch��ng m�n Thanh Hi�u S� Th�i<color>, ti�p nh�n nhi�m v�, �o�t l�i t�n v�t <color=red>Y�n Ng�c Ch� ho�n<color>.", "B��c 2: ��n <color=blue>Tr��ng Giang nguy�n ��u<color> ��nh b�i ph�n �� <color=blue>Thanh H�a<color>, l�y ���c <color=red>Y�n Ng�c Ch� ho�n<color>.", "B��c 3: Tr� v� <color=blue>Ch�nh �i�n<color>, giao <color=red>Y�n Ng�c Ch� ho�n<color> cho <color=blue>Ch��ng m�n<color>, ho�n th�nh nhi�m v�. N�u Y�n Ng�c Ch� ho�n b� m�t, ph�i th�c hi�n nhi�m v� l�i t� ��u.")
end;

function v8()
Talk(3,"","Th�ng qua nhi�m v� tr�ng ph�n s� m�n, ng��i ���c phong l�<color=blue> Kim ��nh Th�nh N�<color>, h�c ���c tuy�t h�c tr�n ph�i<color=blue> B�t Di�t B�t Tuy�t, Ph�t Quang Ph� Chi�u, Thanh �m Ph�n X��ng<color>.","B��c 1: Sau khi ��ng c�p c�a b�n v��t qua c�p 60 t�i<color=blue> Ch�nh �i�n <color>g�p <color=blue>Ch��ng m�n Thanh Hi�u S� Th�i<color>, th�nh c�u tr�ng ph�n Nga My Ph�i.","B��c 2: Th�ng qua giao n�p <color=red>50000 l��ng<color>, tr�ng ph�n Nga My Ph�i.")
end;

--------------------------------

function ok()
end;
