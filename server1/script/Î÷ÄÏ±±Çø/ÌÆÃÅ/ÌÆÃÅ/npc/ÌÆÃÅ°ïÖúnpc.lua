--���Ű���NPC

Include("\\script\\global\\map_helper.lua")
Include("\\script\\task\\newtask\\education\\dragonfive.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")
Include("\\script\\dailogsys\\dailog.lua")
npc_name = "Qu�n Gia"

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName,tbDailog , nNpcIndex)
	if getn(tbDailog.tbOptionList) > 0 then
		tbDailog:AddOptEntry("Ta ��n t�m �ng c� vi�c kh�c", old_main)
		tbDailog:Show()
	else
		old_main()
	end
end

function old_main()
UTask_tm = GetTask(2)

if (UTask_tm < 10*256) then						--δ��������������δ������
	if (GetFaction() ~= "") then				--�������Ѿ�������һ����
		Say("Ta �� � ���ng m�n m��i m�y n�m nay, kh�ng chuy�n g� kh�ng bi�t! Ng��i mu�n h�i g�?", 3, "T�m hi�u qu� ph�i/org", "T�m hi�u c�c v� cao th� ���ng M�n/member", "T�m hi�u b� c�c n�i n�y/config")
		return
	else
		Say("Ta �� � ���ng m�n m��i m�y n�m nay, kh�ng chuy�n g� kh�ng bi�t! Ng��i mu�n h�i g�?", 4, "T�m hi�u qu� ph�i/org", "T�m hi�u c�c v� cao th� ���ng M�n/member", "T�m hi�u b� c�c n�i n�y/config", "L�m sao �� nh�p m�n?/task1")
		return	
	end
end;
	
if (UTask_tm == 70*256) then					--�����Ѿ���ʦ		
	Say("Th� ra l� ��ng m�n tr��c ��y, c� chuy�n g� th�?", 6, "T�m hi�u l�i ���ng M�n/org", "T�m hi�u l�i ��ng m�n tr��c kia/member", "T�m hi�u l�i b� c�c n�i n�y/config", "C�n nhi�m v� n�o �� l�m n�a/task3","T�m hi�u s� tr��ng luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help")
	return
end;	

Say("Ta �� � ���ng m�n m��i m�y n�m nay, kh�ng chuy�n g� kh�ng bi�t! Ng��i mu�n h�i g�?", 7, "��i tho�i v�i Long Ng� /Uworld1000_word","T�m hi�u b�n m�n/org", "T�m hi�u ��ng m�n/member", "T�m hi�u b� c�c n�i n�y/config", "T�m hi�u nhi�m v� /task3","T�m hi�u s� tr��ng luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help")

end;

----------------------------------------------------------------------------------------------

function org()
Say("Mu�n t�m hi�u ph��ng di�n n�o?", 4, "Kh�i nguy�n m�n ph�i/o1", "V� tr� ��a l� /o2", "��a v� giang h� /o3", "��c s�c m�n ph�i/o4")
end;


function member()
Say("Mu�n t�m hi�u ai?", 10, "Ch��ng m�n ���ng C�u/m1", "Truy H�n T�u ���ng Nh�n/m2", "Ti�u Nhi�m T�u ���ng V�n/m3", "Tuy�t Xu�n T�u ���ng D� /m4", "B�ch B�o T�u ���ng H�c/m5", "���ng Nh�t Tr�n/m6", "���ng B�t Nhi�m/m7", "���ng Khuy�t /m8", "���ng Khinh/m9", "���ng ��c/m10")
end;


function config()
Say("Mu�n t�m hi�u ph��ng di�n n�o?", 3, "C�c v�ng l�n c�n/c1",  "���ng Gia B�o/c2", "Xung quanh ���ng Gia B�o/c3")
end;


function task1()
Say("B�n m�n ch� thu nh�n �� t� h� M�c, kh�ng ph�n nam n�. Mu�n nh�p m�n h�c ngh�, c�n th�ng qua nhi�m v� nh�p m�n.", 1, "T�m hi�u c� th� nhi�m v� nh�p m�n/v1")
end;


function task2()
Say("<#> Ng��i �� xu�t s�, kh�ng c�n l�m nhi�m v� b�n m�n n�a,  k� hi�u nhi�m v� l� "..UTask_tm.."<#>.", 0)
end;


function task3()

UTask_tm = GetTask(2)

if (UTask_tm < 10*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, ph�i ho�n th�nh nhi�m v� nh�p m�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh 5 nhi�m v� c�a m�n ph�i, s� h�c ���c v� c�ng, ���c phong danh hi�u. Ho�n th�nh nhi�m v� xu�t s� th� c� th� xu�t s�. Hi�n ��"..UTask_tm.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Nhi�m v� nh�p m�n/v1")
end;

if (UTask_tm == 10*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, ph�i ho�n th�nh nhi�m v� nh�p m�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh 5 nhi�m v� c�a m�n ph�i, s� h�c ���c v� c�ng, ���c phong danh hi�u. Ho�n th�nh nhi�m v� xu�t s� th� c� th� xu�t s�. Hi�n ��"..UTask_tm.."<#>, gi� �� nh�p m�n, ti�p theo c� th� ti�n h�nh:", 1, "Nhi�m v� Ma V� Ch�m/v2")
end;

if (UTask_tm > 10*256) and (UTask_tm < 20*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, ph�i ho�n th�nh nhi�m v� nh�p m�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh 5 nhi�m v� c�a m�n ph�i, s� h�c ���c v� c�ng, ���c phong danh hi�u. Ho�n th�nh nhi�m v� xu�t s� th� c� th� xu�t s�. Hi�n ��"..UTask_tm.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Nhi�m v� Ma V� Ch�m/v2")
end;

if (UTask_tm == 20*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, ph�i ho�n th�nh nhi�m v� nh�p m�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh 5 nhi�m v� c�a m�n ph�i, s� h�c ���c v� c�ng, ���c phong danh hi�u. Ho�n th�nh nhi�m v� xu�t s� th� c� th� xu�t s�. Hi�n ��"..UTask_tm.."<#>, ti�p theo c� th� ti�n h�nh:", 1, "Nhi�m v� ���ng U/v3")
end;

if (UTask_tm > 20*256) and (UTask_tm < 30*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, ph�i ho�n th�nh nhi�m v� nh�p m�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh 5 nhi�m v� c�a m�n ph�i, s� h�c ���c v� c�ng, ���c phong danh hi�u. Ho�n th�nh nhi�m v� xu�t s� th� c� th� xu�t s�. Hi�n ��"..UTask_tm.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Nhi�m v� ���ng U/v3")
end;

if (UTask_tm == 30*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, ph�i ho�n th�nh nhi�m v� nh�p m�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh 5 nhi�m v� c�a m�n ph�i, s� h�c ���c v� c�ng, ���c phong danh hi�u. Ho�n th�nh nhi�m v� xu�t s� th� c� th� xu�t s�. Hi�n ��"..UTask_tm.."<#>, ti�p theo c� th� ti�n h�nh:", 1, "Nhi�m v� H�a Kh� Ph� /v4")
end;

if (UTask_tm > 30*256) and (UTask_tm < 40*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, ph�i ho�n th�nh nhi�m v� nh�p m�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh 5 nhi�m v� c�a m�n ph�i, s� h�c ���c v� c�ng, ���c phong danh hi�u. Ho�n th�nh nhi�m v� xu�t s� th� c� th� xu�t s�. Hi�n ��"..UTask_tm.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Nhi�m v� H�a Kh� Ph� /v4")
end;

if (UTask_tm == 40*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, ph�i ho�n th�nh nhi�m v� nh�p m�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh 5 nhi�m v� c�a m�n ph�i, s� h�c ���c v� c�ng, ���c phong danh hi�u. Ho�n th�nh nhi�m v� xu�t s� th� c� th� xu�t s�. Hi�n ��"..UTask_tm.."<#>, ti�p theo c� th� ti�n h�nh:", 1, "Nhi�m v� C�nh T� K� /v5")
end;

if (UTask_tm > 40*256) and (UTask_tm < 50*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, ph�i ho�n th�nh nhi�m v� nh�p m�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh 5 nhi�m v� c�a m�n ph�i, s� h�c ���c v� c�ng, ���c phong danh hi�u. Ho�n th�nh nhi�m v� xu�t s� th� c� th� xu�t s�. Hi�n ��"..UTask_tm.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Nhi�m v� C�nh T� K� /v5")
end;

if (UTask_tm == 50*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, ph�i ho�n th�nh nhi�m v� nh�p m�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh 5 nhi�m v� c�a m�n ph�i, s� h�c ���c v� c�ng, ���c phong danh hi�u. Ho�n th�nh nhi�m v� xu�t s� th� c� th� xu�t s�. Hi�n ��"..UTask_tm.."<#>, ti�p theo c� th� ti�n h�nh:", 1, "Nhi�m v� �m Kh� Ph� /v6")
end;

if (UTask_tm > 50*256) and (UTask_tm < 60*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, ph�i ho�n th�nh nhi�m v� nh�p m�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh 5 nhi�m v� c�a m�n ph�i, s� h�c ���c v� c�ng, ���c phong danh hi�u. Ho�n th�nh nhi�m v� xu�t s� th� c� th� xu�t s�. Hi�n ��"..UTask_tm.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Nhi�m v� �m Kh� Ph� /v6")
end;

if (UTask_tm == 60*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, ph�i ho�n th�nh nhi�m v� nh�p m�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh 5 nhi�m v� c�a m�n ph�i, s� h�c ���c v� c�ng, ���c phong danh hi�u. Ho�n th�nh nhi�m v� xu�t s� th� c� th� xu�t s�. Hi�n ��"..UTask_tm.."<#>, ti�p theo c� th� ti�n h�nh:", 1, "Nhi�m v� xu�t s� /v7")
end;

if (UTask_tm > 60*256) and (UTask_tm < 70*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, ph�i ho�n th�nh nhi�m v� nh�p m�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh 5 nhi�m v� c�a m�n ph�i, s� h�c ���c v� c�ng, ���c phong danh hi�u. Ho�n th�nh nhi�m v� xu�t s� th� c� th� xu�t s�. Hi�n ��"..UTask_tm.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Nhi�m v� xu�t s� /v7")
end;

if (UTask_tm >= 70*256) and (UTask_tm < 80*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, ph�i ho�n th�nh nhi�m v� nh�p m�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh 5 nhi�m v� c�a m�n ph�i, s� h�c ���c v� c�ng, ���c phong danh hi�u. Ho�n th�nh nhi�m v� xu�t s� th� c� th� xu�t s�. Hi�n ��"..UTask_tm.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Tr�ng ph�n s� m�n/v8")
end;

end;

----------------------------------------------------------------------------------------------

function o1()
Say("Trong con m�t c�a ng��i ngo�i, b�n m�n l� 1 gia t�c th�n b�, �m kh� v� ho� kh� uy ch�n thi�n h�, danh ch�n giang h� �� h�n tr�m n�m nay", 4, " Bi�t r�i!/ok", "V� tr� ��a l� /o2", "��a v� giang h� /o3", "��c s�c m�n ph�i/o4")
end;

function o2()
Say("B�n m�n � Nam Tr�c H�i, b�n ngo�i tuy u nh�n thanh t�nh, nh�ng b�n trong c�m b�y tr�ng tr�ng. Kh�ng c� ng��i h��ng d�n, ng��i ngo�i kh� m� v�o ���c!", 4, " Bi�t r�i!/ok", "Kh�i nguy�n m�n ph�i/o1", "��a v� giang h� /o3", "��c s�c m�n ph�i/o4")
end;

function o3()
Say("B�n m�n v� Th�y Y�n M�n ���c xem l� 'V� L�m Nh� m�n'. �m kh�, h�a kh�, y d��c, c�m b�y ��u ��t ��n t�i cao. Giang h� ch� c�n nh�c ��n t�n b�n m�n l� m�t �� bi�n s�c", 4, " Bi�t r�i!/ok", "Kh�i nguy�n m�n ph�i/o1", "V� tr� ��a l� /o2", "��c s�c m�n ph�i/o4")
end;

function o4()
Say("�� t� b�n m�n h�nh s� b� hi�m. Kh�ng m�ng th� phi. K� t�n t�i m�i l� anh h�ng!", 4, " Bi�t r�i!/ok", "Kh�i nguy�n m�n ph�i/o1", "V� tr� ��a l� /o2", "��a v� giang h� /o3")
end;

--------------------------------

function m1()
Say("V� tr�: <color=blue>ph�ng kh�ch<color>  T�a ��: <color=blue>202,199<color>  ph� tr�ch: <color=blue>nhi�m v�<color><enter> Ki�u c�ng ng�o m�n nh�ng r�t quy�t �o�n!", 10, " Bi�t r�i!/ok", "Truy H�n T�u ���ng Nh�n/m2", "Ti�u Nhi�m T�u ���ng V�n/m3", "Tuy�t Xu�n T�u ���ng D� /m4", "B�ch B�o T�u ���ng H�c/m5", "���ng Nh�t Tr�n/m6", "���ng B�t Nhi�m/m7", "���ng Khuy�t /m8", "���ng Khinh/m9", "���ng ��c/m10")
end;

function m2()
Say("V� tr�: <color=blue>ph�ng �m kh�<color>  T�a ��: <color=blue>199,200<color>  ph� tr�ch: <color=blue>nhi�m v�<color><enter> T�i ngh� ch� t�o ra �m kh� thi�n h� v� ��ch. T�nh c�ch th�m tr�m, vui bu�n kh�ng th� hi�n ra ngo�i", 10, " Bi�t r�i!/ok", "Ch��ng m�n ���ng C�u/m1", "Ti�u Nhi�m T�u ���ng V�n/m3", "Tuy�t Xu�n T�u ���ng D� /m4", "B�ch B�o T�u ���ng H�c/m5", "���ng Nh�t Tr�n/m6", "���ng B�t Nhi�m/m7", "���ng Khuy�t /m8", "���ng Khinh/m9", "���ng ��c/m10")
end;

function m3()
Say("V� tr�: <color=blue>ph�ng H�a kh�<color>  T�a ��: <color=blue>200,200<color>  ph� tr�ch: <color=blue>nhi�m v�<color><enter> B�c th�y v� ch� t�o h�a kh�, khi�n ng��i trong v� l�m nh�c ��n t�n �� bi�n s�c. T�nh t�nh n�ng nhu l�a, nh�ng r�t trung th�nh, sau khi ��a con ch�t �i t�m t�nh thay ��i ", 10, " Bi�t r�i!/ok", "Ch��ng m�n ���ng C�u/m1", "Truy H�n T�u ���ng Nh�n/m2", "Tuy�t Xu�n T�u ���ng D� /m4", "B�ch B�o T�u ���ng H�c/m5", "���ng Nh�t Tr�n/m6", "���ng B�t Nhi�m/m7", "���ng Khuy�t /m8", "���ng Khinh/m9", "���ng ��c/m10")
end;

function m4()
Say("V� tr�: <color=blue>ph�ng Y d��c<color>  T�a ��: <color=blue>200,200<color>  ph� tr�ch: <color=blue>nhi�m v�<color><enter>tinh th�ng y thu�t v� ��c d��c, t�nh t�nh qu�i l�, c� ch�p", 10, " Bi�t r�i!/ok", "Ch��ng m�n ���ng C�u/m1", "Truy H�n T�u ���ng Nh�n/m2", "Ti�u Nhi�m T�u ���ng V�n/m3", "B�ch B�o T�u ���ng H�c/m5", "���ng Nh�t Tr�n/m6", "���ng B�t Nhi�m/m7", "���ng Khuy�t /m8", "���ng Khinh/m9", "���ng ��c/m10")
end;

function m5()
Say("V� tr�: <color=blue>ph�ng V� c�ng<color>  T�a ��: <color=blue>200,200<color>  ph� tr�ch: <color=blue>nhi�m v�<color><enter> T�nh t�nh nhu nh� v� �n ho�,tuy l� 1 trong 4 ng��i v� tr� cao trong ���ng M�n, nh�ng lu�n �i�m ��m khi�n t�n.", 10, " Bi�t r�i!/ok", "Ch��ng m�n ���ng C�u/m1", "Truy H�n T�u ���ng Nh�n/m2", "Ti�u Nhi�m T�u ���ng V�n/m3", "Tuy�t Xu�n T�u ���ng D� /m4", "���ng Nh�t Tr�n/m6", "���ng B�t Nhi�m/m7", "���ng Khuy�t /m8", "���ng Khinh/m9", "���ng ��c/m10")
end;

function m6()
Say("V� tr�: <color=blue>ph�ng Ngh� s�<color>  T�a ��: <color=blue>199,200<color>  ph� tr�ch: <color=blue>nhi�m v�<color><enter> con tr��ng c�a ���ng C�u, th�ng minh lanh l�i, v�n v� song to�n.", 10, " Bi�t r�i!/ok", "Ch��ng m�n ���ng C�u/m1", "Truy H�n T�u ���ng Nh�n/m2", "Ti�u Nhi�m T�u ���ng V�n/m3", "Tuy�t Xu�n T�u ���ng D� /m4", "B�ch B�o T�u ���ng H�c/m5", "���ng B�t Nhi�m/m7", "���ng Khuy�t /m8", "���ng Khinh/m9", "���ng ��c/m10")
end;

function m7()
Say("V� tr�: <color=blue>T� t� ���ng<color>  T�a ��: <color=blue>199,199<color>  ph� tr�ch: <color=blue>nhi�m v�<color><enter> con th� c�a ���ng C�u, t�nh t�nh h�o ph�ng, b�c �i hi�n l��ng", 10, " Bi�t r�i!/ok", "Ch��ng m�n ���ng C�u/m1", "Truy H�n T�u ���ng Nh�n/m2", "Ti�u Nhi�m T�u ���ng V�n/m3", "Tuy�t Xu�n T�u ���ng D� /m4", "B�ch B�o T�u ���ng H�c/m5", "���ng Nh�t Tr�n/m6", "���ng Khuy�t /m8", "���ng Khinh/m9", "���ng ��c/m10")
end;

function m8()
Say("V� tr�: <color=blue>Qu�ng tr��ng<color>  T�a ��: <color=blue>508,323<color>  ph� tr�ch: <color=blue>Giao d�ch binh kh�<color>", 10, " Bi�t r�i!/ok", "Ch��ng m�n ���ng C�u/m1", "Truy H�n T�u ���ng Nh�n/m2", "Ti�u Nhi�m T�u ���ng V�n/m3", "Tuy�t Xu�n T�u ���ng D� /m4", "B�ch B�o T�u ���ng H�c/m5", "���ng Nh�t Tr�n/m6", "���ng B�t Nhi�m/m7", "���ng Khinh/m9", "���ng ��c/m10")
end;

function m9()
Say("V� tr�: <color=blue>Qu�ng tr��ng<color>  T�a ��: <color=blue>506,322<color>  ph� tr�ch: <color=blue>Giao d�ch trang b�<color>", 10, " Bi�t r�i!/ok", "Ch��ng m�n ���ng C�u/m1", "Truy H�n T�u ���ng Nh�n/m2", "Ti�u Nhi�m T�u ���ng V�n/m3", "Tuy�t Xu�n T�u ���ng D� /m4", "B�ch B�o T�u ���ng H�c/m5", "���ng Nh�t Tr�n/m6", "���ng B�t Nhi�m/m7", "���ng Khuy�t /m8", "���ng ��c/m10")
end;

function m10()
Say("V� tr�: <color=blue>Qu�ng tr��ng<color>  T�a ��: <color=blue>504,322<color>  ph� tr�ch: <color=blue>Giao d�ch d��c ph�m<color>", 10, " Bi�t r�i!/ok", "Ch��ng m�n ���ng C�u/m1", "Truy H�n T�u ���ng Nh�n/m2", "Ti�u Nhi�m T�u ���ng V�n/m3", "Tuy�t Xu�n T�u ���ng D� /m4", "B�ch B�o T�u ���ng H�c/m5", "���ng Nh�t Tr�n/m6", "���ng B�t Nhi�m/m7", "���ng Khuy�t /m8", "���ng Khinh/m9")
end;

--------------------------------

function c1()
Say("Ph�a nam ti�p v�i Th�nh ��.", 3, " Bi�t r�i!/ok", "���ng Gia B�o/c2", "Xung quanh ���ng Gia B�o/c3")
end;

function c2()
Say("Trung t�m g�m: ph�ng kh�ch (508,322) , Ph�ng Ch�nh (511,319) , T� t� ���ng (514,318) .<enter> ph�a ��ng c�: ph�ng H�a kh� (512,324) , ph�ng Y d��c (515,322) .<enter>ph�a T�y c� Ph�ng Ngh� s� (507,319) , ph�ng �m kh� (504,317) , ph�ng V� c�ng (509,317) ", 3, " Bi�t r�i!/ok", "C�c v�ng l�n c�n/c1", "Xung quanh ���ng Gia B�o/c3")
end;

function c3()
Say("Ph�a nam th�ng qua Tr�c H�i Tam Quan.<enter> ph�a ��ng ��n Tr�c T� ��ng (522,326) .<enter>ph�a T�y ��n Ph� Th�y h� (495,314) .<enter>ph�a B�c ��n V� T�m c�c (527,292) .", 3, " Bi�t r�i!/ok", "C�c v�ng l�n c�n/c1", "���ng Gia B�o/c2")
end;

--------------------------------

function v1()							
Talk(6, "", "Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i c� th� gia nh�p ���ng M�n, tr� th�nh <color=blue>T�p D�ch<color>, h�c ���c v� c�ng <color=blue>T�ch L�ch ��n<color>.<enter>Ti�p nh�n nhi�m v�, c�n ph�i ��t �i�u ki�n sau: Ng� h�nh thu�c t�nh: h� M�c, ��ng c�p ��t ��n 10, kh�ng l�m nhi�m v� nh�p m�n c�a b�t k� m�n ph�i n�o","B��c 1: ��n <color=blue>l�i v�o Tr�c H�i Tam Quan<color> g�p 1 <color=blue>���ng M�n Tr�ng �inh (453,358)<color>, ti�p nh�n nhi�m v�, qua Tr�c H�i Tam Quan.", "B��c 2: ��n c�a th� nh�t ��nh b�i <color=blue>��i M� h�u<color>, l�y ���c <color=red>g�y tr�c m�u xanh<color>.", "B��c 3: ��n c�a th� hai tr� l�i c�u h�i c�a <color=blue>���ng M�n Tr�ng �inh (468,350)<color> v� C�u Cung ��, l�y ���c <color=red>g�y tr�c m�u tr�ng<color>. C�n ph�i ��nh b�i <color=blue>��i M� h�u, ��i D� h�u<color>m�i l�y ���c ��p �n!", "B��c 4: ��n c�a th� ba tr� l�i c�u h�i c�a<color=blue>���ng M�n Tr�ng �inh (473,343)<color> v� B�t qu�i, l�y ���c <color=red>g�y tr�c m�u t�m<color>.C�n ph�i ��nh b�i <color=blue>��i M� h�u, ��i D� h�u, ��i H�c Di�p H�u<color> m�i l�y ���c ��p �n!", "B��c 5: ��n <color=blue>l�i ra Tr�c H�i Tam Quan<color>, giao 3 c�y g�y tr�c cho <color=blue>���ng M�n Tr�ng �inh (479,339)<color>, ho�n th�nh nhi�m v�.")
end;


function v2()
Talk(7, "", "Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>Tr�ng �inh <color>, h�c ���c v� c�ng <color=blue>���ng M�n �m kh�, ���ng M�n �ao ph�p<color>.<enter>Ti�p nh�n nhi�m v� n�y c�n ph�i l� �� t� tr�n c�p 10","B��c 1: ��n <color=blue>ph�ng V� c�ng<color> g�p <color=blue>���ng H�c <color>, ti�p nh�n nhi�m v�, �i <color=blue>Th�nh �� <color> t�m <color=red>Ma V� ch�m<color>.", "B��c 2: ��n <color=blue>Th�nh �� <color>, g�p <color=blue>Mai N��ng (389,315)<color> bi�t ���c c�n ph�i �i t�m <color=blue>T�n Uy�n<color>.", "B��c 3: ��n ph�a ��ng nam Th�nh �� ��ng Nam t�m <color=blue>T�n Uy�n (394,323)<color>, ti�p nh�n nhi�m v�, d�ng <color=red>Nh�n M� N�o<color> ��i Ma V� ch�m.", "B��c 4: ��n <color=blue>ti�m T�p h�a<color> mua <color=red>Nh�n M� N�o<color>.", "B��c 5: Tr� l�i g�p T�n Uy�n, giao Nh�n M� N�o, l�y ���c <color=red>Ma V� ch�m<color>.", "B��c 6: Tr� v� <color=blue>ph�ng V� c�ng<color>, giao <color=red>Ma V� ch�m<color> cho <color=blue>���ng H�c <color>, ho�n th�nh nhi�m v�.")
end;


function v3()
Talk(8, "", "Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>H� Vi�n<color>, h�c ���c v� c�ng <color=blue>�o�t H�n Ti�u, T�m Nh�n <color>.<enter>Ti�p nh�n nhi�m v� c�n ph�i l� �� t� c�p 20 v� �� ho�n th�nh nhi�m v� Ma V� ch�m","B��c 1: ��n <color=blue>ph�ng Ngh� s�<color> g�p <color=blue>���ng Nh�t Tr�n<color>, ti�p nh�n nhi�m v�, ��n <color=blue>V� T�m c�c<color> khuy�n nh� <color=blue>���ng U<color>.", "B��c 2: ��n <color=blue>ph�a b�c V� T�m c�c<color>, nh�p v�o <color=blue>c�a g� (528,291)<color>, ti�p nh�n nhi�m v�, ��n V� T�m c�c t�m <color=blue>4 ch� kh�u quy�t<color>.", "B��c 3: ��n V� T�m c�c ��nh b�i 4 con <color=blue>X� L� tinh<color> v� <color=blue>Ho�n h�ng tinh<color>, l�y ���c <color=red>4 chi�c kh�n t�<color>tr�n �� c� 4 c�u kh�u quy�t", "B��c 4: Quay l�i ��i tho�i v�i ���ng U, ti�p nh�n nhi�m v�, ��n ph�a t�y <color=blue>Ph� Th�y h�<color> t�m <color=red>Kim H�ng khuy�n<color>.", "B��c 5: ��n <color=blue>Ph� Th�y h�<color>, ��nh b�i <color=blue>X�ch Di�m Ng�c<color>, l�y ���c <color=red>Kim H�ng khuy�n<color>", "B��c 6: Tr� l�i <color=blue>V� T�m c�c<color>, ���ng U s� b�o ng��i mang <color=red>Kim H�ng khuy�n<color> cho <color=blue>Ch��ng m�n ���ng C�u<color>.", "B��c 7: Quay v� <color=blue>ph�ng kh�ch<color>, giao <color=red>Kim H�ng khuy�n<color> cho <color=blue>���ng C�u <color>, ho�n th�nh nhi�m v�. N�u Kim H�ng khuy�n b� m�t, ph�i th�c hi�n nhi�m v� l�i t� ��u.")
end;


function v4()
Talk(6, "", "Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>Gi�i Ti�n H� v�<color>, h�c ���c v� c�ng <color=blue>Truy T�m Ti�n<color>.<enter>Ti�p nh�n nhi�m v� c�n ph�i l� �� t� c�p 30 v� �� ho�n th�nh nhi�m v� ���ng U","B��c 1: ��n <color=blue>T� t� ���ng<color> g�p <color=blue>���ng B�t Nhi�m<color>, ti�p nh�n nhi�m v�, �i l�y<color=red>H�a Kh� ph�<color>.", "B��c 2: ��n <color=blue>B�ch V�n ��ng<color>, ��nh b�i th� ph� <color=blue>��i ��u m�c Cu�ng Sa<color>, ti�p nh�n nhi�m v�, v�o trong ��ng t�m <color=red>Ch�a kh�a b�o r��ng<color>.", "B��c 3: V�o ��ng ��nh b�i 4 t�n <color=blue>ti�u ��u m�c ��c Nh�, Thi�t T�, Qu� �nh, L� Quy�n<color> s� l�y ���c <color=red>Ch�a kh�a<color>.", "B��c 4: M� <color=blue>B�o r��ng (230,199)<color>, l�y ���c <color=red>H�a Kh� ph�<color>.", "B��c 5: Tr� v� <color=blue>ph�ng H�a kh�<color>, giao <color=red>H�a Kh� ph�<color> cho <color=blue>���ng V�n <color>, ho�n th�nh nhi�m v�.")
end;


function v5()
Talk(7, "", "Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>Nh�p C�c �� t�<color>, h�c ���c v� c�ng <color=blue>M�n Thi�n Hoa V�, Th�i ��c Thu�t<color>.<enter>Ti�p nh�n nhi�m v� c�n ph�i l� �� t� c�p 40 v� �� ho�n th�nh nhi�m v� H�a Kh� ph� ","B��c 1: ��n <color=blue>ph�ng Y d��c<color> g�p <color=blue>���ng D�<color>, ti�p nh�n nhi�m v�, h�a gi�i �n o�n gi�a ���ng D� v� C�nh T� K� ", "B��c 2: ��n ph�a t�y <color=blue>Thanh Th�nh s�n<color> t�m <color=blue>C�nh T� K� (230,245)<color>. Tr��c ti�n ��nh b�i 5 con d� th�: <color=blue>S�i x�m<color>, <color=blue>M�nh h�<color>, <color=blue>Kim Ti�n b�o<color>, <color=blue>Heo r�ng<color> v� <color=blue>G�u n�u<color>, sau �� ti�p nh�n nhi�m v�, gi�p con g�i C�nh T� K� tr� b�nh", "B��c 3: Tr� l�i <color=blue>ph�ng Y d��c<color>, h�i <color=blue>���ng D�<color> v� <color=blue>b�i thu�c<color>.", "B��c 4: ��n ��ng b�c <color=blue>Thanh Th�nh s�n<color>, l�n <color=blue>Thanh D��ng phong<color>, ��nh b�i <color=blue>H�c �ng, Hung Th�u, Linh �i�u<color>, l�y ���c 5 D��c li�u: <color=red>Da c�c, gan r�n ��c, h�t Anh t�c, �u�i r�t ��c, ��u Thi�n t�m<color>.", "B��c 5: Giao d��c li�u C�nh T� K�, h�a gi�i ���c �n o�n", "B��c 6: Tr� v� ph�ng Y d��c g�p ���ng D�, ho�n th�nh nhi�m v�.")
end;


function v6()
Talk(7, "", "Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>T� L�o m�n nh�n<color>, h�c ���c v� c�ng <color=blue>Thi�n La ��a V�ng<color>.<enter>Ti�p nh�n nhi�m v� c�n ph�i l� �� t� c�p 50 v� �� ho�n th�nh nhi�m v� C�nh T� K� ","B��c 1: ��n <color=blue>ph�ng �m kh�<color> g�p <color=blue>���ng Nh�n<color>, ti�p nh�n nhi�m v�, �i t�m <color=red>'�m kh� ph�'<color>.", "B��c 2: ��n <color=blue>ph�ng Ngh� s�<color>,g�p <color=blue>���ng Nh�t Tr�n<color>, bi�t ���c <color=blue>Tam s� huynh ���ng H�a<color> v� <color=blue>Ng� s� huynh ���ng Nguy�n <color> �� �i ngang ph�ng �m kh�, h�nh ��ng c�a 2 ng��i r�t kh� nghi", "B��c 3: ��n <color=blue>Giang T�n th�n <color> t�m <color=blue>���ng Nguy�n <color>, bi�t ���c <color=blue>���ng H�a<color> �ang � <color=blue>H��ng Th�y ��ng<color>.", "B��c 4: ��n <color=blue>H��ng Th�y ��ng<color>, ��nh b�i <color=blue>���ng H�a<color>, bi�t ���c <color=red>'�m kh� ph�'<color> �ang ���c gi�u trong ��ng", "B��c 5: Ti�p t�c ��nh b�i <color=blue>Thi�t Ch�y Ma V��ng<color> ho�c <color=blue>Thi�t Quy�n Di�m La<color>, s� l�y ���c <color=red>'�m kh� ph�'<color>.", "B��c 6: Tr� v� <color=blue>ph�ng �m kh�<color>, giao <color=red>'�m kh� ph�'<color> cho <color=blue>���ng Nh�n<color>, ho�n th�nh nhi�m v�. N�u �m kh� ph� b� m�t, ph�i th�c hi�n nhi�m v� l�i t� ��u.")
end;


function v7()
Talk(6, "", "Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>Thi�n Th� Th�n V�<color>, thu�n l�i xu�t s�.<enter>Ti�p nh�n nhi�m v� c�n ph�i l� �� t� c�p 50 v� �� ho�n th�nh nhi�m v� �m kh� ph� ","B��c 1: ��n <color=blue>ph�ng kh�ch<color> g�p <color=blue>Ch��ng m�n ���ng C�u<color>, ti�p nh�n nhi�m v�, ��n <color=blue>Tr�c T� ��ng<color> �o�t l�i <color=red>Th�t Tinh Tuy�t M�nh ki�m<color>.", "B��c 2: ��n <color=blue>t�ng 1 Tr�c T� ��ng<color> ��nh b�i <color=blue>M�ng H�n ��u l�nh<color>, s� l�y ���c <color=red>Ch�a kh�a l�n t�ng 2<color>.", "B��c 3: ��n <color=blue>t�ng 2 Tr�c T� ��ng<color> ��nh b�i <color=blue>M�ng H�n ��u l�nh<color> ho�c <color=blue>�i�m T�nh h�<color>, s� l�y ���c <color=red>Ch�a kh�a l�n t�ng 3<color>.", "B��c 4: ��n <color=blue>t�ng 3 Tr�c T� ��ng<color>, c� 2 chi�c <color=blue>B�o r��ng <color>, trong �� c� 1 chi�c ch�a <color=red>Th�t Tinh Tuy�t M�nh ki�m<color>.", "B��c 5: Tr� l�i <color=blue>ph�ng kh�ch<color>, giao <color=red>Th�t Tinh Tuy�t M�nh ki�m<color> cho <color=blue>Ch��ng m�n ���ng C�u<color>, ho�n th�nh nhi�m v�. N�u Th�t Tinh Tuy�t m�nh ki�m b� m�t, ph�i th�c hi�n nhi�m v� l�i t� ��u.")
end;

function v8()
Talk(3,"","Sau khi tr�ng ph�n s� m�n, ng��i ���c phong l� <color=blue>L�c C�c Tr��ng L�o<color>, h�c ���c tuy�t h�c tr�n ph�i <color=blue>Ti�u L� Phi �ao, Thi�n La ��a V�ng, T�n Hoa Ti�u<color>.","B��c 1: Sau khi ��ng c�p ��t h�n 60,  ��n <color=blue> Ph�ng kh�ch <color> g�p <color=blue>Ch��ng m�n ���ng C�u<color>, xin ���c tr�ng ph�n ���ng M�n.","B��c 2: Th�ng qua giao n�p <color=red>50000 l��ng<color>, tr�ng ph�n ���ng M�n.")
end;

--------------------------------

function ok()
end;
