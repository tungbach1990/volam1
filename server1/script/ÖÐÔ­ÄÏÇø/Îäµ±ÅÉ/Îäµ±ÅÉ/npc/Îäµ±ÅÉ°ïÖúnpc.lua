--�䵱�ɰ���NPC

Include("\\script\\global\\map_helper.lua")
Include("\\script\\task\\newtask\\education\\dragonfive.lua")
npc_name = "Ch��ng Th� "

function main(sel)

UTask_wd = GetTask(5)

if (UTask_wd == 30*256+50) and (HaveMagic(165) ~= -1) and (GetCamp() == 4) then		-- ѧ���ˡ������޽�����������ʦ������ֵΪ30������ʱ�ģ������ݴ�
	SetTask(5,70*256)
	Say("T�nh h�nh nhi�m v� c�a ng��i c� m�t ch�t sai l�m, ta �� gi�p ng��i s�a ch�a!",1,"C�m �n!/no")
	return
end

if (UTask_wd < 10*256) then						--δ���䵱����������δ���䵱��
	if (GetFaction() ~= "") then				--�������Ѿ�������һ����
		Say("B�n ��o c� th� gi�p ���c g�?", 3, "T�m hi�u qu� ph�i/org", "T�m hi�u c�c v�  ��i hi�p/member", "T�m hi�u b� c�c n�i n�y/config")
		return
	else
		Say("B�n ��o c� th� gi�p ���c g�?", 4, "T�m hi�u qu� ph�i/org", "T�m hi�u c�c v�  ��i hi�p/member", "T�m hi�u b� c�c n�i n�y/config", "L�m sao �� nh�p m�n?/task1")
		return
	end
end;
	
if (UTask_wd == 70*256) then					--�䵱���Ѿ���ʦ		
	Say("Th� ra l� ��ng m�n tr��c ��y, B�n ��o c� th� gi�p ���c g�?", 6, "Ti�p t�c t�m hi�u  ph�i V� �ang /org", "T�m hi�u l�i ��ng m�n tr��c kia/member", "T�m hi�u l�i b� c�c n�i n�y/config", "C�n nhi�m v� n�o �� l�m n�a/task3","T�m hi�u s� tr��ng luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help")
	return
end;

Say("B�n ��o c� th� gi�p ���c g�?", 7,"��i tho�i v�i Long Ng� /Uworld1000_word", "T�m hi�u b�n ph�i/org", "T�m hi�u ��ng m�n/member", "T�m hi�u b� c�c n�i n�y/config", "T�m hi�u nhi�m v� /task3","T�m hi�u s� tr��ng luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help")

end;

----------------------------------------------------------------------------------------------

function org()
Say("Mu�n t�m hi�u ph��ng di�n n�o?", 4, "Kh�i nguy�n m�n ph�i/o1", "V� tr� ��a l� /o2", "��a v� giang h� /o3", "��c s�c m�n ph�i/o4")
end;


function member()
Say("Mu�n t�m hi�u ai?", 10, "Ch��ng m�n ��o Nh�t Ch�n Nh�n/m1", "Di�p Ti�p M� /m2", "T� ��i Nh�c/m3", "Chu V�n Tuy�n/m4", "��n T� Nam/m5", "Di�u Th�ch M�n/m6", "Ti�u ��o s� Thanh Phong/m7", "Hoa Ho�nh/m8", "Ng�c Th� /m9", "Ti�u ��o s� Minh Nguy�t/m10")
end;


function config()
Say("Mu�n t�m hi�u ph��ng di�n n�o?", 4, "C�c v�ng l�n c�n/c1",  "Tr��c n�i/c2", "Ki�n tr�c ch�nh/c3", "Sau n�i/c4")
end;


function task1()
Say("B�n m�n ch� nh�n �� t� h� Th�, nam n� ��u ���c. Mu�n nh�p m�n h�c ngh�, c�n ho�n th�nh nhi�m v� nh�p m�n.", 1, "T�m hi�u c� th� nhi�m v� nh�p m�n/v1")
end;


function task2()
Say("<#> Ng��i �� xu�t s�, kh�ng c�n l�m nhi�m v� c�a bang ph�i n�a. Hi�n �� "..UTask_wd.."<#>.", 0)
end;


function task3()

UTask_wd = GetTask(5)

if (UTask_wd < 10*256) then
Say("<#> Ch��ng Th�: Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Ng��i �ang th�c hi�n nhi�m v� nh�p m�n. Hi�n �� "..UTask_wd.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Nhi�m v� nh�p m�n/v1")
end;

if (UTask_wd == 10*256) then
Say("<#> Ch��ng Th�: Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Ng��i �ang th�c hi�n nhi�m v� nh�p m�n. Hi�n �� "..UTask_wd.."<#>, gi� �� nh�p m�n, ti�p theo c� th� ti�n h�nh:", 1, "Nhi�m v� ��o ��c Kinh/v2")
end;

if (UTask_wd > 10*256) and (UTask_wd < 20*256) then	
Say("<#> Ch��ng Th�: Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Ng��i �ang th�c hi�n nhi�m v� nh�p m�n. Hi�n �� "..UTask_wd.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Nhi�m v� ��o ��c Kinh/v2")
end;

if (UTask_wd == 20*256) then	
Say("<#> Ch��ng Th�: Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Ng��i �ang th�c hi�n nhi�m v� nh�p m�n. Hi�n �� "..UTask_wd.."<#>, ti�p theo c� th� ti�n h�nh:", 1, "Nhi�m v� ��o B�o/v3")
end;

if (UTask_wd > 20*256) and (UTask_wd < 30*256) then	
Say("<#> Ch��ng Th�: Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Ng��i �ang th�c hi�n nhi�m v� nh�p m�n. Hi�n �� "..UTask_wd.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Nhi�m v� ��o B�o/v3")
end;

if (UTask_wd == 30*256) then
Say("<#> Ch��ng Th�: Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Ng��i �ang th�c hi�n nhi�m v� nh�p m�n. Hi�n �� "..UTask_wd.."<#>, ti�p theo c� th� ti�n h�nh:", 1, "Nhi�m v� H�a mi th�o/v4")
end;

if (UTask_wd > 30*256) and (UTask_wd < 40*256) then	
Say("<#> Ch��ng Th�: Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Ng��i �ang th�c hi�n nhi�m v� nh�p m�n. Hi�n �� "..UTask_wd.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Nhi�m v� H�a mi th�o/v4")
end;

if (UTask_wd == 40*256) then
Say("<#> Ch��ng Th�: Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Ng��i �ang th�c hi�n nhi�m v� nh�p m�n. Hi�n �� "..UTask_wd.."<#>, ti�p theo c� th� ti�n h�nh:", 1, "Nhi�m v� Nhu�n N��ng/v5")
end;

if (UTask_wd > 40*256) and (UTask_wd < 50*256) then	
Say("<#> Ch��ng Th�: Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Ng��i �ang th�c hi�n nhi�m v� nh�p m�n. Hi�n �� "..UTask_wd.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Nhi�m v� Nhu�n N��ng/v5")
end;

if (UTask_wd == 50*256) then	
Say("<#> Ch��ng Th�: Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Ng��i �ang th�c hi�n nhi�m v� nh�p m�n. Hi�n �� "..UTask_wd.."<#>, ti�p theo c� th� ti�n h�nh:", 1, "Nhi�m v� h�nh thi�n/v6")
end;

if (UTask_wd > 50*256) and (UTask_wd < 60*256) then	
Say("<#> Ch��ng Th�: Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Ng��i �ang th�c hi�n nhi�m v� nh�p m�n. Hi�n �� "..UTask_wd.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Nhi�m v� h�nh thi�n/v6")
end;

if (UTask_wd == 60*256) then	
Say("<#> Ch��ng Th�: Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Ng��i �ang th�c hi�n nhi�m v� nh�p m�n. Hi�n �� "..UTask_wd.."<#>, ti�p theo c� th� ti�n h�nh:", 1, "Nhi�m v� xu�t s� /v7")
end;

if (UTask_wd > 60*256) and (UTask_wd < 70*256) then	
Say("<#> Ch��ng Th�: Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Ng��i �ang th�c hi�n nhi�m v� nh�p m�n. Hi�n �� "..UTask_wd.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Nhi�m v� xu�t s� /v7")
end;

if (UTask_wd >= 70*256) and (UTask_wd < 80*256) then	
Say("<#> Ch��ng Th�: Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh Nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�. Ng��i �ang th�c hi�n nhi�m v� nh�p m�n. Hi�n �� "..UTask_wd.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Tr�ng ph�n s� m�n/v8")
end;

end;

----------------------------------------------------------------------------------------------

function o1()
Say("B�n ph�i tin quy�n ��o gi�o 'Huy�n thi�n ch�n v� ��i ��'. L�ch s� b�n ph�i c� t� r�t l�u, ���c ng��i ��i g�i l� n�i gia ch� t�ng", 4, "Bi�t r�i/ok", "V� tr� ��a l� /o2", "��a v� giang h� /o3", "��c s�c m�n ph�i/o4")
end;

function o2()
Say("V� �ang s�n c� t�n l� n�i Th�i H�a, n�m � n�i c�nh H� B�c, th� n�i tr�ng �i�p h�ng v�, tr�i d�i ng�n d�m. V� �ang s�n cao s�u, hi�m tr�, ng��i l�n �� s� c� c�m gi�c xu�t th� m�c ni�m.", 4, "Bi�t r�i/ok", "Kh�i nguy�n m�n ph�i/o1", "��a v� giang h� /o3", "��c s�c m�n ph�i/o4")
end;

function o3()
Say("B�n ph�i l� th�nh ��a ��o gi�o v� l�m, c�ng Thi�u L�m t� ph�t gi�o t� danh, thi�n h� v� h�c, trong giang h� c� c�u 'B�c t�n Thi�u L�mn Nam s�ng V� �ang'.", 4, "Bi�t r�i/ok", "Kh�i nguy�n m�n ph�i/o1", "V� tr� ��a l� /o2", "��c s�c m�n ph�i/o4")
end;

function o4()
Say("�� t� b�n ph�i l�m �i�u hi�p ngh�a vang danh thi�n h�, ��i x� gi�a c�c ��ng m�n th� ��y t�nh ngh�a. V� ngh� b�n ph�i ch� tr�ng ��n tu luy�n v� c�ng, l�y t�nh ch� ��ng, l�y nhu kh�c c��ng, l�y v� h�nh th�ng h�u h�nh", 4, "Bi�t r�i/ok", "Kh�i nguy�n m�n ph�i/o1", "V� tr� ��a l� /o2", "��a v� giang h� /o3")
end;

--------------------------------

function m1()
Say("V� tr�: <color=blue>T� Ti�u ��i �i�n<color>   T�a ��: <color=blue>200,198<color>   ph� tr�ch <color=blue>nhi�m v�<color><enter> ��c ��o cao nh�n, c� tr�i tim ��n h�u, y�u qu� nh�ng ng��i trong giang h� tr�ng ngh�a kh�.Lu�n tr�n ��y s� l�c quan", 10, "Bi�t r�i/ok", "Di�p Ti�p M� /m2", "T� ��i Nh�c/m3", "Chu V�n Tuy�n/m4", "��n T� Nam/m5", "Di�u Th�ch M�n/m6", "Ti�u ��o s� Thanh Phong/m7", "Hoa Ho�nh/m8", "Ng�c Th� /m9", "Ti�u ��o s� Minh Nguy�t/m10")
end;

function m2()
Say("V� tr�: <color=blue>h� Thanh Th�y<color>   T�a ��: <color=blue>213,190<color>   ph� tr�ch <color=blue>nhi�m v�<color><enter> V� �ang ��i hi�p! Lu�n khi�m t�n, c� ch� c�u ti�n", 10, "Bi�t r�i/ok", "Ch��ng m�n ��o Nh�t Ch�n Nh�n/m1", "T� ��i Nh�c/m3", "Chu V�n Tuy�n/m4", "��n T� Nam/m5", "Di�u Th�ch M�n/m6", "Ti�u ��o s� Thanh Phong/m7", "Hoa Ho�nh/m8", "Ng�c Th� /m9", "Ti�u ��o s� Minh Nguy�t/m10")
end;

function m3()
Say("V� tr�: <color=blue>Th�p Ph��ng �i�n<color>   T�a ��: <color=blue>200,199<color>   ph� tr�ch <color=blue>nhi�m v�<color><enter>V� �ang ��i hi�p! R�t hi�u ��ng! Si m� v� h�c!", 10, "Bi�t r�i/ok", "Ch��ng m�n ��o Nh�t Ch�n Nh�n/m1", "Di�p Ti�p M� /m2", "Chu V�n Tuy�n/m4", "��n T� Nam/m5", "Di�u Th�ch M�n/m6", "Ti�u ��o s� Thanh Phong/m7", "Hoa Ho�nh/m8", "Ng�c Th� /m9", "Ti�u ��o s� Minh Nguy�t/m10")
end;

function m4()
Say("V� tr�: <color=blue>ph�a ��ng h� Thanh Th�y<color>   T�a ��: <color=blue>219,192<color>   ph� tr�ch <color=blue>nhi�m v�<color><enter>V� �ang ��i hi�p! T�nh t�nh c�n th�n,xem x�t v�n �� chu to�n,b�t c� chuy�n nh� n�o c�ng kh�ng qua m�t �ng", 10, "Bi�t r�i/ok", "Ch��ng m�n ��o Nh�t Ch�n Nh�n/m1", "Di�p Ti�p M� /m2", "T� ��i Nh�c/m3", "��n T� Nam/m5", "Di�u Th�ch M�n/m6", "Ti�u ��o s� Thanh Phong/m7", "Hoa Ho�nh/m8", "Ng�c Th� /m9", "Ti�u ��o s� Minh Nguy�t/m10")
end;

function m5()
Say("V� tr�: <color=blue>Long H� �i�n<color>   T�a ��: <color=blue>200,199<color>   ph� tr�ch <color=blue>nhi�m v�<color><enter>V� �ang ��i hi�p! Tu�i tr� anh h�ng, ch� t�nh ch� ngh�a, v�n v� song to�n.", 10, "Bi�t r�i/ok", "Ch��ng m�n ��o Nh�t Ch�n Nh�n/m1", "Di�p Ti�p M� /m2", "T� ��i Nh�c/m3", "Chu V�n Tuy�n/m4", "Di�u Th�ch M�n/m6", "Ti�u ��o s� Thanh Phong/m7", "Hoa Ho�nh/m8", "Ng�c Th� /m9", "Ti�u ��o s� Minh Nguy�t/m10")
end;

function m6()
Say("V� tr�: <color=blue>Ph� M�u �i�n<color>   T�a ��: <color=blue>200,199<color>   ph� tr�ch <color=blue>nhi�m v�<color><enter>V� �ang ��i hi�p! T�nh t�nh thu�n l��ng, ��i l�c nh� tr� con", 10, "Bi�t r�i/ok", "Ch��ng m�n ��o Nh�t Ch�n Nh�n/m1", "Di�p Ti�p M� /m2", "T� ��i Nh�c/m3", "Chu V�n Tuy�n/m4", "��n T� Nam/m5", "Ti�u ��o s� Thanh Phong/m7", "Hoa Ho�nh/m8", "Ng�c Th� /m9", "Ti�u ��o s� Minh Nguy�t/m10")
end;

function m7()
Say("V� tr�: <color=blue>gi�ng Ma Ch�m<color>   T�a ��: <color=blue>196,212<color>   ph� tr�ch <color=blue>nhi�m v�<color><enter>V� �ang th� ��ng, thu�n l��ng kh� �i.", 10, "Bi�t r�i/ok", "Ch��ng m�n ��o Nh�t Ch�n Nh�n/m1", "Di�p Ti�p M� /m2", "T� ��i Nh�c/m3", "Chu V�n Tuy�n/m4", "��n T� Nam/m5", "Di�u Th�ch M�n/m6", "Hoa Ho�nh/m8", "Ng�c Th� /m9", "Ti�u ��o s� Minh Nguy�t/m10")
end;

function m8()
Say("V� tr�: <color=blue>Qu�ng tr��ng<color>   T�a ��: <color=blue>210,195<color>   ph� tr�ch <color=blue>Giao d�ch binh kh�<color>", 10, "Bi�t r�i/ok", "Ch��ng m�n ��o Nh�t Ch�n Nh�n/m1", "Di�p Ti�p M� /m2", "T� ��i Nh�c/m3", "Chu V�n Tuy�n/m4", "��n T� Nam/m5", "Di�u Th�ch M�n/m6", "Ti�u ��o s� Thanh Phong/m7", "Ng�c Th� /m9", "Ti�u ��o s� Minh Nguy�t/m10")
end;

function m9()
Say("V� tr�: <color=blue>Qu�ng tr��ng<color>   T�a ��: <color=blue>207,194<color>   ph� tr�ch <color=blue>Giao d�ch trang b�<color>", 10, "Bi�t r�i/ok", "Ch��ng m�n ��o Nh�t Ch�n Nh�n/m1", "Di�p Ti�p M� /m2", "T� ��i Nh�c/m3", "Chu V�n Tuy�n/m4", "��n T� Nam/m5", "Di�u Th�ch M�n/m6", "Ti�u ��o s� Thanh Phong/m7", "Hoa Ho�nh/m8", "Ti�u ��o s� Minh Nguy�t/m10")
end;

function m10()
Say("V� tr�: <color=blue>Qu�ng tr��ng<color>   T�a ��: <color=blue>209,197<color>   ph� tr�ch <color=blue>Giao d�ch d��c ph�m<color>", 10, "Bi�t r�i/ok", "Ch��ng m�n ��o Nh�t Ch�n Nh�n/m1", "Di�p Ti�p M� /m2", "T� ��i Nh�c/m3", "Chu V�n Tuy�n/m4", "��n T� Nam/m5", "Di�u Th�ch M�n/m6", "Ti�u ��o s� Thanh Phong/m7", "Hoa Ho�nh/m8", "Ng�c Th� /m9")
end;

--------------------------------

function c1()
Say("Ph�a ��ng c� th� �i ��n T��ng D��ng.", 4, "Bi�t r�i/ok", "Tr��c n�i/c2", "Ki�n tr�c ch�nh/c3", "Sau n�i/c4")
end;

function c2()
Say("Ph�a ��ng ���ng l�n n�i c� Ma Ch�m gi�ng (196,212) v� h� V� T�ch (198,211) .", 4, "Bi�t r�i/ok", "C�c v�ng l�n c�n/c1", "Ki�n tr�c ch�nh/c3", "Sau n�i/c4")
end;

function c3()
Say("C� Th�p Ph��ng �i�n (203,198) , Ph� M�u �i�n (203,194) , Long H� �i�n (213,196) , T� Ti�u ��i �i�n (212,193) ", 4, "Bi�t r�i/ok", "C�c v�ng l�n c�n/c1", "Tr��c n�i/c2", "Sau n�i/c4")
end;

function c4()
Say("H�u s�n c� H�a Lang ��ng (240,187) v� Th�i T� Nham (232,183) .", 4, "Bi�t r�i/ok", "C�c v�ng l�n c�n/c1", "Tr��c n�i/c2", "Ki�n tr�c ch�nh/c3")
end;

--------------------------------

function v1()							
Talk(3, "", "Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i c� th� gia nh�p V� �ang ph�i, tr� th�nh <color=blue>��o ��ng<color>, h�c ���c v� c�ng <color=blue>N� L�i Ch�, Th��ng H�i Minh nguy�t<color>.<enter>Ti�p nh�n nhi�m v� ph�i �� c�c �i�u ki�n sau: Thu�c t�nh ng� h�nh h� Th�, ��ng c�p tr�n 10","B��c 1: ��n <color=blue>Ma Ch�m gi�ng<color> g�p <color=blue>ti�u ��o s� Thanh Phong <color>, ti�p nh�n nhi�m v�, xu�ng <color=blue>��y gi�ng<color> t�m <color=red>th�ng g�<color>.", "B��c 2: Xu�ng <color=blue>��y gi�ng<color>, ��nh b�i <color=blue>��i Th�o M�ng, C� s�u to<color> ho�c <color=blue>C�c to<color>, l�y ���c <color=red>Th�ng g�<color>.", "B��c 3: ��a <color=red>th�ng g�<color> cho <color=blue>ti�u ��o s� Thanh Phong <color>, ho�n th�nh nhi�m v�.")
end;


function v2()
Talk(4, "", "Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>Nh�n T�n ��o nh�n<color>, h�c ���c v� c�ng <color=blue>V� �ang Ki�m ph�p,V� �ang Quy�n Ph�p<color>.<enter>Ti�p nh�n nhi�m v� n�y ph�i l� �� t� tr�n c�p 10","B��c 1: ��n <color=blue>T� Ti�u ��i �i�n<color> g�p <color=blue>��o Nh�t Ch�n Nh�n<color>, ti�p nh�n nhi�m v�, ��n ch� <color=blue>Di�p Ti�p M�<color> h�c <color=blue>'��o ��c Kinh'<color>.", "B��c 2: T�i T� Ti�u ��i �i�n <color=blue>ph�a T�y h� Thanh Th�y<color> g�p <color=blue>Di�p Ti�p M�<color> h�c <color=blue>'��o ��c Kinh'<color>.", "B��c 3: Tr� v� <color=blue>T� Ti�u ��i �i�n<color>, tr� l�i ��ng c�u h�i c�a <color=blue>��o Nh�t Ch�n Nh�n<color>, ho�n th�nh nhi�m v�.")
end;


function v3()
Talk(8, "", "Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>Thanh Tu ��o nh�n<color>, h�c ���c v� c�ng <color=blue>Th�t Tinh tr�n<color>.<enter> Ti�p nhi�m v� n�y ��ng c�p ph�i tr�n 20 v� �� ho�n th�nh nhi�m v� ��o ��c Kinh.","B��c 1: ��n <color=blue>Ph� M�u �i�n<color> g�p <color=blue> ��o Th�ch M�n<color>, ti�p nh�n nhi�m v�, v�o <color=blue>H�a Lang ��ng<color> t�m <color=red>Thi�n T�m ��o B�o<color>.", "B��c 2: ��n <color=blue>H�a Lang ��ng<color>, ��nh b�i <color=blue>S�i ��<color>, l�y ���c <color=red>Thi�n T�m ��o B�o<color>b� r�ch.", "B��c 3: Tr� v� <color=blue>Ph� M�u �i�n<color>t�m <color=blue> ��o Th�ch M�n<color>, ti�p nh�n nhi�m v�, ��n <color=blue>T��ng D��ng<color> t�m <color=blue>ch� ti�m t�p h�a<color> ngh� c�ch.", "B��c 4: ��n <color=blue>T��ng D��ng<color> t�m <color=blue>ch� ti�m t�p h�a (203,203)<color>, bi�t ���c con c�a b� ta b� <color=blue>S�i hoang<color> trong <color=blue>H�a Lang ��ng<color> tha m�t.", "B��c 5: V�o<color=blue>H�a Lang ��ng<color>, ��nh b�i <color=blue>S�i hoang<color>, c�u ��a b�, l�y ���c ��u <color=red>Thi�n T�m<color>.", "B��c 6: Tr� v� <color=blue>T��ng D��ng ti�m t�p h�a<color>, l�y ���c <color=red>Thi�n T�m ��o B�o<color> �� s�a xong.", "B��c 7: V� <color=blue>Ph� M�u �i�n<color>, giao <color=red>Thi�n T�m ��o B�o<color> �� s�a xong cho <color=blue> ��o Th�ch M�n<color>, ho�n th�nh nhi�m v�. N�u Thi�n T�m ��o B�o b� m�t, ph�i th�c hi�n nhi�m v� l�i t� ��u.")
end;


function v4()
Talk(4, "", "Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>Tu�n S�n ��o nh�n<color>, h�c ���c v� c�ng <color=blue>Ki�m Phi Kinh Thi�n, B�c C�p Nhi Ph�c<color>.<enter>Ti�p nh�n nhi�m v� n�y ��ng c�p ph�i tr�n 30 v� �� ho�n th�nh nhi�m v� Thi�n T�m ��o B�o.","B��c 1: ��n <color=blue>Th�p Ph��ng �i�n<color> g�p <color=blue>T� ��i Nh�c<color>, ti�p nh�n nhi�m v�, trong v�ng <color=blue>72 gi�<color> ��n <color=blue>Ph�c Ng�u s�n ��ng<color> l�y <color=red>5 c�y H�a Mi th�o<color>.", "B��c 2: ��n <color=blue>Ph�c Ng�u s�n ��ng <color>, ��nh b�i <color=blue>��i H�a h�, ��i Tuy�t lang<color> ho�c <color=blue>��i Thanh Lang<color>, l�y ���c <color=red>H�a Mi th�o<color>.", "B��c 3: V� <color=blue>Th�p Ph��ng �i�n<color>, giao <color=red>5 c�y H�a Mi th�o<color> cho <color=blue>T� ��i Nh�c<color>, n�u th�i h�n quy ��nh ch�a ��n, nhi�m v� ho�n th�nh. N�u qu� th�i gian, ph�i l�m l�i nhi�m v� ")
end;


function v5()
Talk(5, "", "Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>Nh�p Quan ��o Nh�n<color>, h�c ���c v� c�ng <color=blue>Th� V�n Tung<color>.<enter>Nh�n nhi�m v� n�y ph�i l� �� t� t� c�p 40 v� �� ho�n th�nh nhi�m v� H�a Mi th�o","B��c 1: ��n <color=blue>ph�a ��ng h� Thanh Th�y<color> g�p <color=blue>Chu V�n Tuy�n<color>, ti�p nh�n nhi�m v�, ��n <color=blue>K� Qu�n ��ng<color> giao <color=red>th� c�a Ch��ng m�n<color> cho <color=blue>Nhu�n N��ng<color>.", "B��c 2: ��n <color=blue>K� Qu�n ��ng<color> g�p <color=blue>Nhu�n N��ng (202,184)<color>, ��nh b�i 5 con <color=blue>B�ch Ng�c H�<color>, sau �� ti�p nh�n nhi�m v�, v�o s�n ��ng t�m th� c�a <color=red>Nhu�n N��ng<color>.", "B��c 3: ��nh b�i <color=blue>Nhu�n N��ng Gia H�<color> ho�c <color=blue>Nhu�n N��ng Gia B�o<color>, l�y ���c th� tr� l�i c�a <color=red>Nhu�n N��ng<color>.", "B��c 4: V� <color=blue>T� Ti�u ��i �i�n<color>, giao th� c�a <color=red>Nhu�n N��ng<color> cho <color=blue>��o Nh�t Ch�n Nh�n<color>, ho�n th�nh nhi�m v�. N�u l�m m�t th� th� c�a Nhu�n N��ng, ph�i th�c hi�n nhi�m v� l�i t� ��u.")
end;


function v6()
Talk(6, "", "Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>Ch��ng Kinh ��o nh�n<color>, h�c ���c v� c�ng<color=blue>T�a V�ng V� Ng�<color>. <enter>nh�n nhi�m v� n�y ��ng c�p ph�i tr�n 50,��ng th�i ph�i ho�n th�nh nhi�m v� Nhu�n N��ng.","B��c 1: ��n <color=blue>Long H� �i�n<color> g�p <color=blue>��n T� Nam<color>, ti�p nh�n nhi�m v�, ��n <color=blue>Thi�n T�m ��ng<color> v� d�n tr� h�i.", "B��c 2: ��n <color=blue>Thi�n T�m ��ng<color>, ��nh b�i th� ph� ��u m�c <color=blue>Thi�t C�c<color>, l�y ���c <color=blue>10000 l��ng<color>.", "B��c 3: V� <color=blue>Long H� �i�n<color>, ti�p nh�n nhi�m v�, �em to�n b� ng�n l��ng t�ng cho <color=blue>ch� d�u ��ng gia<color> � <color=blue>T��ng D��ng<color>. ", "B��c 4: ��n <color=blue>T��ng D��ng<color> g�p <color=blue>ch� d�u ��ng gia (205,204)<color>, t�ng 10000 l��ng", "B��c 5: V� <color=blue>Long H� �i�n<color>, g�p <color=blue>��n T� Nam<color> ph�c m�nh, ho�n th�nh nhi�m v�.")
end;


function v7()
Talk(10, "", "Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>Huy�n V� Th�n Th�<color>, thu�n l�i xu�t s�.<enter>Ti�p nh�n nhi�m v� n�y ��ng c�p ph�i tr�n c�p 50 v� �� ho�n th�nh nhi�m v� Nh�t H�nh Nh�t Thi�n.","B��c 1: ��n <color=blue>T� Ti�u ��i �i�n<color> g�p <color=blue>��o Nh�t Ch�n Nh�n<color>, ti�p nh�n nhi�m v�, ��n <color=blue>Th�i T� Nham<color> t�m <color=blue>3 B�o r��ng<color>, l�y b�o v�t trong r��ng.", "B��c 2: ��n <color=blue>Th�i T� Nham<color> t�m 3 B�o r��ng: nh�n chu�t v�o <color=blue>B�o r��ng 1 (237,181)<color>, ti�p nh�n nhi�m v�, ��n <color=blue>T��ng D��ng<color> g�p <color=blue>Ch� d��c �i�m<color> t�m c�ch ng�n ch�n s� lan tr�n c�a b�nh d�ch", "Nh�n v�o <color=blue>B�o r��ng 2 (237,179)<color>, ti�p nh�n nhi�m v�, ��n <color=blue>T��ng D��ng<color> t�m <color=blue>Th� r�n<color> ngh� c�ch gi�i quy�t v�n �� ch�ng quan binh nh� Kim.", "Nh�n v�o <color=blue>B�o r��ng 3 (233,177)<color>, ti�p nh�n nhi�m v�, di�t tr� <color=blue>T��ng D��ng Th� t��ng<color>.", "B��c 3: ��n <color=blue>T��ng D��ng<color> t�m <color=blue>Ch� d��c �i�m (201,202)<color>, ti�p nh�n nhi�m v�, ��n <color=blue>Ph�c Ng�u s�n ��ng<color> t�m 5 lo�i d��c li�u: <color=red>H�p hoan, Huy�n S�m, ���ng quy, Ph�ng K�, Chu Sa<color>. ", "��n <color=blue>T��ng D��ng<color> g�p <color=blue>th� r�n (193,201)<color>, ti�p nh�n nhi�m v�, ��n <color=blue>T�y Nam T��ng D��ng<color> t�m 3 lo�i kho�ng th�ch: <color=red>X�ch ��ng kho�ng, T� Thi�t kho�ng, L��ng Ng�n kho�ng<color>.", "��n <color=blue>T��ng D��ng<color> ��i tho�i v�i <color=blue>V� binh Nha m�n<color> bi�t ���c <color=blue>T��ng D��ng Th� T��ng<color> tr�n � <color=blue>M�t ��o Nha m�n<color>, v�o m�t ��o, ��nh b�i Th� t��ng, ho�n th�nh nhi�m v�.", "B��c 4: V� <color=blue>Th�i T� Nham<color>, nh�n v�o <color=blue>3 c�i B�o r��ng <color>, l�y ���c <color=red>'Ng�c Thanh Ch�n Kinh', 'Th��ng Thanh Ch�n Kinh', 'Th�i Thanh Ch�n Kinh'<color>.", "B��c 5: Tr� v� <color=blue>T� Ti�u ��i �i�n<color>, giao 3 quy�n ch�n kinh cho <color=blue>��o Nh�t Ch�n Nh�n<color>, ho�n th�nh nhi�m v�.")
end;

function v8()
Talk(3,"","Sau khi tr�ng ph�n s� m�n, ng��i ���c phong l� <color=blue>Huy�n V� Ch�n Qu�n<color>, h�c ���c tuy�t h�c tr�n ph�i<color=blue>Th�i C�c Th�n C�ng, V� Ng� V� Ki�m, Tam Ho�n Thao Nguy�t<color>.","B��c 1: Sau khi ��ng c�p ��t ��n 60, ��n <color=blue>T� Ti�u ��i �i�n<color> g�p <color=blue>��o Nh�t Ch�n Nh�n<color>, xin tr�ng ph�n V� �ang Ph�i.","B��c 2: Giao n�p <color=red>50000 ng�n l��ng<color>, tr�ng ph�n V� �ang Ph�i.")
end;

--------------------------------

function ok()
end;
