--���̰̽���NPC

Include("\\script\\global\\map_helper.lua")
Include("\\script\\task\\newtask\\education\\dragonfive.lua")
npc_name = "Qu�n s� "
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
if allbrother_0801_CheckIsDialog(210) == 1 then
		allbrother_0801_FindNpcTaskDialog(210)
		return 0;
	end
UTask_tr = GetTask(4)

if (UTask_tr < 10*256) then						--δ�����̽���������δ�����̽�
	if (GetFaction() ~= "") then				--�������Ѿ�������һ����
		Say("Ch� c�n kh�ng li�n quan ��n c� m�t c�a b�n gi�o, c� chuy�n g� c� h�i!", 3, "T�m hi�u qu� gi�o/org", "T�m hi�u c�c v� cao th� /member", "T�m hi�u b� c�c n�i n�y/config")
		return
	else
		Say("Ch� c�n kh�ng li�n quan ��n c� m�t c�a b�n gi�o, c� chuy�n g� c� h�i!", 4, "T�m hi�u qu� gi�o/org", "T�m hi�u c�c v� cao th� /member", "T�m hi�u b� c�c n�i n�y/config", "L�m sao �� nh�p m�n?/task1")
		return	
	end
end;
	
if (UTask_tr == 70*256) then					--���̽��Ѿ���ʦ		
	Say("Kh�ng ph�i ng��i �� xu�t s� r�i sao, c�n chuy�n g� kh�ng bi�t n�a?", 6, "Ti�p t�c t�m hi�u Thi�n Nh�n Gi�o/org", "T�m hi�u l�i ��ng m�n tr��c kia/member", "T�m hi�u l�i b� c�c n�i n�y/config", "C�n nhi�m v� n�o �� l�m n�a/task3","T�m hi�u s� tr��ng luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help")
	return
end;	

Say("C� chuy�n g� c� h�i.", 7,"��i tho�i v�i Long Ng� /Uworld1000_word", "T�m hi�u b�n gi�o/org", "T�m hi�u ��ng m�n/member", "T�m hi�u b� c�c n�i n�y/config", "T�m hi�u nhi�m v� /task3","T�m hi�u s� tr��ng luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help")

end;

----------------------------------------------------------------------------------------------

function org()
Say("Mu�n bi�t chuy�n g� n�a?", 4, "Kh�i nguy�n m�n ph�i/o1", "V� tr� ��a l� /o2", "��a v� giang h� /o3", "��c s�c m�n ph�i/o4")
end;


function member()
Say("Mu�n bi�t v� ai?", 10, "Gi�o ch� Ho�n Nhan H�ng Li�t/m1", "T� H� ph�p �oan M�c Du� /m2", "H�u H� ph�p Gia L�c T� Ly/m3", "Phong ���ng ���ng ch� Ho�n Nhan Tuy�t Y/m4", "H�a ���ng ���ng ch� Ng�t Ng�o/m5", "Nh�t Nguy�t ��n ch� � H�p T�t/m6", "Thi�n Nh�n T� S� /m7", "Th�p L� H�n/m8", "V� ��ch/m9", "K� H�u/m10")
end;


function config()
Say("Mu�n bi�t chuy�n g� n�a?", 3, "C�c v�ng l�n c�n/c1",  "B� c�c b�n ngo�i/c2", "B� c�c b�n trong/c3")
end;


function task1()
Say("B�n m�n ch� nh�n �� t� thu�c h� H�a, kh�ng ph�n bi�t nam n�. Mu�n nh�p m�n h�c ngh�, c�n ph�i ho�n th�nh nhi�m v� nh�p m�n.", 1, "T�m hi�u c� th� nhi�m v� nh�p m�n/v1")
end;


function task2()
Say("<#> Ng��i �� xu�t s�, kh�ng c�n l�m nhi�m v� c�a b�n gi�o n�a! Hi�n �� "..UTask_tr.."<#>.", 0)
end;


function task3()

UTask_tr = GetTask(4)

if (UTask_tr > 5*256) and (UTask_tr < 10*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh nhi�m v� xu�t s� s� th�nh ngh� xu�t s�.Hi�n �� "..UTask_tr.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Nhi�m v� nh�p m�n/v1")
end;

if (UTask_tr == 10*256) then
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh nhi�m v� xu�t s� s� th�nh ngh� xu�t s�.Hi�n �� "..UTask_tr.."<#>, gi� �� nh�p m�n, ti�p theo c� th� ti�n h�nh:", 1, "Nhi�m v� Th�t S�t ��ng/v2")
end;

if (UTask_tr > 10*256) and (UTask_tr < 20*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh nhi�m v� xu�t s� s� th�nh ngh� xu�t s�.Hi�n �� "..UTask_tr.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Nhi�m v� Th�t S�t ��ng/v2")
end;

if (UTask_tr == 20*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh nhi�m v� xu�t s� s� th�nh ngh� xu�t s�.Hi�n �� "..UTask_tr.."<#>, ti�p theo c� th� ti�n h�nh:", 1, "Nhi�m v� ��a b� th�ng minh/v3")
end;

if (UTask_tr > 20*256) and (UTask_tr < 30*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh nhi�m v� xu�t s� s� th�nh ngh� xu�t s�.Hi�n �� "..UTask_tr.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Nhi�m v� ��a b� th�ng minh/v3")
end;

if (UTask_tr == 30*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh nhi�m v� xu�t s� s� th�nh ngh� xu�t s�.Hi�n �� "..UTask_tr.."<#>, ti�p theo c� th� ti�n h�nh:", 1, "nhi�m v� B�o Th�ch/v4")
end;

if (UTask_tr > 30*256) and (UTask_tr < 40*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh nhi�m v� xu�t s� s� th�nh ngh� xu�t s�.Hi�n �� "..UTask_tr.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "nhi�m v� B�o Th�ch/v4")
end;

if (UTask_tr == 40*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh nhi�m v� xu�t s� s� th�nh ngh� xu�t s�.Hi�n �� "..UTask_tr.."<#>, ti�p theo c� th� ti�n h�nh:", 1, "nhi�m v� h�nh th�ch/v5")
end;

if (UTask_tr > 40*256) and (UTask_tr < 50*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh nhi�m v� xu�t s� s� th�nh ngh� xu�t s�.Hi�n �� "..UTask_tr.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "nhi�m v� h�nh th�ch/v5")
end;

if (UTask_tr == 50*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh nhi�m v� xu�t s� s� th�nh ngh� xu�t s�.Hi�n �� "..UTask_tr.."<#>, ti�p theo c� th� ti�n h�nh:", 1, "nhi�m v� c�u ng��i/v6")
end;

if (UTask_tr > 50*256) and (UTask_tr < 60*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh nhi�m v� xu�t s� s� th�nh ngh� xu�t s�.Hi�n �� "..UTask_tr.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "nhi�m v� c�u ng��i/v6")
end;

if (UTask_tr == 60*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh nhi�m v� xu�t s� s� th�nh ngh� xu�t s�.Hi�n �� "..UTask_tr.."<#>, ti�p theo c� th� ti�n h�nh:", 1, "Nhi�m v� xu�t s� /v7")
end;

if (UTask_tr > 60*256) and (UTask_tr < 70*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh nhi�m v� xu�t s� s� th�nh ngh� xu�t s�.Hi�n �� "..UTask_tr.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Nhi�m v� xu�t s� /v7")
end;

if (UTask_tr >= 70*256) and (UTask_tr < 80*256) then	
Say("<#> Mu�n nh�p m�n h�c ngh�, tr��c ti�n ph�i th�ng qua ho�n th�nh nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh nhi�m v� xu�t s� s� th�nh ngh� xu�t s�.Hi�n �� "..UTask_tr.."<#>, nhi�m v� �ang ti�n h�nh l�:", 1, "Tr�ng ph�n s� m�n/v8")
end;

end;

----------------------------------------------------------------------------------------------

function o1()
Say("B�n gi�o l�p n�n � ��i Kim l� �� ��i ch�i v�i V� l�m Trung Nguy�n, ���c tin t��ng tr� th�nh Qu�c Gi�o, Gi�o ch� Ho�n Nhan H�ng Li�t c�ng l� qu�c s� c�a ��i Kim.", 4, "Bi�t r�i/ok", "V� tr� ��a l� /o2", "��a v� giang h� /o3", "��c s�c m�n ph�i/o4")
end;

function o2()
Say("��y l� t�ng ��n c�a b�n gi�o, n�m � v� tr� b� m�t d��i thung l�ng ph�a ��ng Bi�n Kinh.", 4, "Bi�t r�i/ok", "Kh�i nguy�n m�n ph�i/o1", "��a v� giang h� /o3", "��c s�c m�n ph�i/o4")
end;

function o3()
Say("B�n gi�o c� b�i c�nh ch�nh tr� r�t ph�c t�p. M�c ��ch l� gi�p nh� Kim Nam h� di�t T�ng, nh�t th�ng thi�n h�!", 4, "Bi�t r�i/ok", "Kh�i nguy�n m�n ph�i/o1", "V� tr� ��a l� /o2", "��c s�c m�n ph�i/o4")
end;

function o4()
Say("Kh�c bi�t l�n nh�t c�a b�n gi�o v�i c�c m�n ph�i kh�c l�: b�n gi�o th�nh l�p v� m�c ��ch ch�nh tr�. C�c nh�n v�t gia nh�p b�n gi�o kh�ng ph�i �� h�c ngh�, m� v� m�c ��ch ch�nh tr�, nh�ng ng��i n�y th��ng gi� ��a v� cao trong b�n gi�o. B�n gi�o h�nh s� nghi�m m�t, gi�o quy r�t nghi�m, ��i v�i nh�ng k� ph�n b�i s� tr�ng tr� kh�ng tha.", 4, "Bi�t r�i/ok", "Kh�i nguy�n m�n ph�i/o1", "V� tr� ��a l� /o2", "��a v� giang h� /o3")
end;

--------------------------------

function m1()
Say("V� tr�: <color=blue>Thi�n Nh�n gi�o t�ng 3<color>   T�a ��: <color=blue>215,195<color>   Ph� tr�ch: <color=blue>nhi�m v�<color><enter> Kim qu�c Qu�c s�, nh�t ��i ki�u h�ng, �a m�u t�c tr� nh�ng ki�u c�ng ng�o m�n.", 10, "Bi�t r�i/ok", "T� H� ph�p �oan M�c Du� /m2", "H�u H� ph�p Gia L�c T� Ly/m3", "Phong ���ng ���ng ch� Ho�n Nhan Tuy�t Y/m4", "H�a ���ng ���ng ch� Ng�t Ng�o/m5", "Nh�t Nguy�t ��n ch� � H�p T�t/m6", "Thi�n Nh�n T� S� /m7", "Th�p L� H�n/m8", "V� ��ch/m9", "K� H�u/m10")
end;

function m2()
Say("V� tr�: <color=blue>Thi�n Nh�n gi�o t�ng 3<color>   T�a ��: <color=blue>225,199<color>   Ph� tr�ch: <color=blue>nhi�m v�<color><enter>, v�n v� song to�n, phong l�u nho nh�, n�a ch�nh n�a t� ", 10, "Bi�t r�i/ok", "Gi�o ch� Ho�n Nhan H�ng Li�t/m1", "H�u H� ph�p Gia L�c T� Ly/m3", "Phong ���ng ���ng ch� Ho�n Nhan Tuy�t Y/m4", "H�a ���ng ���ng ch� Ng�t Ng�o/m5", "Nh�t Nguy�t ��n ch� � H�p T�t/m6", "Thi�n Nh�n T� S� /m7", "Th�p L� H�n/m8", "V� ��ch/m9", "K� H�u/m10")
end;

function m3()
Say("V� tr�: <color=blue>Thi�n Nh�n gi�o t�ng 3<color>   T�a ��: <color=blue>207,189<color>   Ph� tr�ch: <color=blue>nhi�m v�<color><enter>, l� ng��i gian tr� gi�o ho�t, b�t ch�p m�i th� �o�n �� ��t ���c m�c ti�u", 10, "Bi�t r�i/ok", "Gi�o ch� Ho�n Nhan H�ng Li�t/m1", "T� H� ph�p �oan M�c Du� /m2", "Phong ���ng ���ng ch� Ho�n Nhan Tuy�t Y/m4", "H�a ���ng ���ng ch� Ng�t Ng�o/m5", "Nh�t Nguy�t ��n ch� � H�p T�t/m6", "Thi�n Nh�n T� S� /m7", "Th�p L� H�n/m8", "V� ��ch/m9", "K� H�u/m10")
end;

function m4()
Say("V� tr�: <color=blue>Thi�n Nh�n gi�o t�ng 3<color>   T�a ��: <color=blue>213,201<color>   Ph� tr�ch: <color=blue>nhi�m v�<color><enter>, th�t c�ng ch�a c�a Kim qu�c, van v� song to�n, th�ng minh lanh l�i. Gia nh�p Thi�n Nh�n Gi�o v�i m�c ��ch gi�m s�t Ho�n Nhan H�ng Li�t!", 10, "Bi�t r�i/ok", "Gi�o ch� Ho�n Nhan H�ng Li�t/m1", "T� H� ph�p �oan M�c Du� /m2", "H�u H� ph�p Gia L�c T� Ly/m3", "H�a ���ng ���ng ch� Ng�t Ng�o/m5", "Nh�t Nguy�t ��n ch� � H�p T�t/m6", "Thi�n Nh�n T� S� /m7", "Th�p L� H�n/m8", "V� ��ch/m9", "K� H�u/m10")
end;

function m5()
Say("V� tr�: <color=blue>Thi�n Nh�n gi�o t�ng 3<color>   T�a ��: <color=blue>205,197<color>   Ph� tr�ch: <color=blue>nhi�m v�<color><enter>, t�nh t�nh n�ng n�y, h�o th�ng. M�t khi �� h� th� th� kh�ng v� t�nh b�t c� ai!", 10, "Bi�t r�i/ok", "Gi�o ch� Ho�n Nhan H�ng Li�t/m1", "T� H� ph�p �oan M�c Du� /m2", "H�u H� ph�p Gia L�c T� Ly/m3", "Phong ���ng ���ng ch� Ho�n Nhan Tuy�t Y/m4", "Nh�t Nguy�t ��n ch� � H�p T�t/m6", "Thi�n Nh�n T� S� /m7", "Th�p L� H�n/m8", "V� ��ch/m9", "K� H�u/m10")
end;

function m6()
Say("V� tr�: <color=blue>Qu�ng tr��ng<color>   T�a ��: <color=blue>200,198<color>   Ph� tr�ch: <color=blue>nhi�m v�<color><enter>, v� ngh� cao c��ng nh�ng h�i ��nh ��ng, nhi�u l�c khi�n ��ng m�n ph�i d� kh�c d� c��i", 10, "Bi�t r�i/ok", "Gi�o ch� Ho�n Nhan H�ng Li�t/m1", "T� H� ph�p �oan M�c Du� /m2", "H�u H� ph�p Gia L�c T� Ly/m3", "Phong ���ng ���ng ch� Ho�n Nhan Tuy�t Y/m4", "H�a ���ng ���ng ch� Ng�t Ng�o/m5", "Thi�n Nh�n T� S� /m7", "Th�p L� H�n/m8", "V� ��ch/m9", "K� H�u/m10")
end;

function m7()
Say("V� tr�: <color=blue>L�i v�o m�t th�t<color>   T�a ��: <color=blue>207,195<color>   Ph� tr�ch: <color=blue>nhi�m v�<color><enter>, ch� l� m�t �� t� th�ng th��ng, ch�a c� bi�u hi�n g� xu�t s�c", 10, "Bi�t r�i/ok", "Gi�o ch� Ho�n Nhan H�ng Li�t/m1", "T� H� ph�p �oan M�c Du� /m2", "H�u H� ph�p Gia L�c T� Ly/m3", "Phong ���ng ���ng ch� Ho�n Nhan Tuy�t Y/m4", "H�a ���ng ���ng ch� Ng�t Ng�o/m5", "Nh�t Nguy�t ��n ch� � H�p T�t/m6", "Th�p L� H�n/m8", "V� ��ch/m9", "K� H�u/m10")
end;

function m8()
Say("V� tr�: <color=blue>Thi�n Nh�n gi�o t�ng 3<color>   T�a ��: <color=blue>207,199<color>   Ph� tr�ch: <color=blue>Giao d�ch binh kh�<color>", 10, "Bi�t r�i/ok", "Gi�o ch� Ho�n Nhan H�ng Li�t/m1", "T� H� ph�p �oan M�c Du� /m2", "H�u H� ph�p Gia L�c T� Ly/m3", "Phong ���ng ���ng ch� Ho�n Nhan Tuy�t Y/m4", "H�a ���ng ���ng ch� Ng�t Ng�o/m5", "Nh�t Nguy�t ��n ch� � H�p T�t/m6", "Thi�n Nh�n T� S� /m7", "V� ��ch/m9", "K� H�u/m10")
end;

function m9()
Say("V� tr�: <color=blue>Thi�n Nh�n gi�o t�ng 3<color>   T�a ��: <color=blue>208,198<color>   Ph� tr�ch: <color=blue>Giao d�ch trang b�<color>", 10, "Bi�t r�i/ok", "Gi�o ch� Ho�n Nhan H�ng Li�t/m1", "T� H� ph�p �oan M�c Du� /m2", "H�u H� ph�p Gia L�c T� Ly/m3", "Phong ���ng ���ng ch� Ho�n Nhan Tuy�t Y/m4", "H�a ���ng ���ng ch� Ng�t Ng�o/m5", "Nh�t Nguy�t ��n ch� � H�p T�t/m6", "Thi�n Nh�n T� S� /m7", "Th�p L� H�n/m8", "K� H�u/m10")
end;

function m10()
Say("V� tr�: <color=blue>Thi�n Nh�n gi�o t�ng 3<color>   T�a ��: <color=blue>210,198<color>   Ph� tr�ch: <color=blue>Giao d�ch D��c ph�m<color>", 10, "Bi�t r�i/ok", "Gi�o ch� Ho�n Nhan H�ng Li�t/m1", "T� H� ph�p �oan M�c Du� /m2", "H�u H� ph�p Gia L�c T� Ly/m3", "Phong ���ng ���ng ch� Ho�n Nhan Tuy�t Y/m4", "H�a ���ng ���ng ch� Ng�t Ng�o/m5", "Nh�t Nguy�t ��n ch� � H�p T�t/m6", "Thi�n Nh�n T� S� /m7", "Th�p L� H�n/m8", "V� ��ch/m9")
end;

--------------------------------

function c1()
Say("B�n ngo�i �i theo h��ng nam s� ��n Bi�n Kinh", 3, "Bi�t r�i/ok", "B� c�c b�n ngo�i/c2", "B� c�c b�n trong/c3")
end;

function c2()
Say("Qu�ng tr��ng c� l�i ra v�o m�t th�t", 3, "Bi�t r�i/ok", "C�c v�ng l�n c�n/c1", "B� c�c b�n trong/c3")
end;

function c3()
Say("M�t th�t g�m 3 t�ng. T�ng 1 kh�ng c� s�n ��ng; t�ng 2 c� Th�t S�t ��ng (190,190) ; t�ng 3 c� Th�nh ��ng (218,192) . T�ng ��n n�m � t�ng 3.", 3, "Bi�t r�i/ok", "C�c v�ng l�n c�n/c1",  "B� c�c b�n ngo�i/c2")
end;

--------------------------------

function v1()							
Talk(4, "", "Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i c� th� gia nh�p Thi�n Nh�n Gi�o, tr� th�nh <color=blue>S�t th�<color>, h�c ���c v� c�ng <color=blue>T�n D��ng Nh� Huy�t<color>.<enter>Ti�p nh�n nhi�m v�, c�n ph�i ��t �i�u ki�n sau: Ng� h�nh thu�c t�nh: h� H�a, ��ng c�p ��t ��n 10, kh�ng l�m nhi�m v� nh�p m�n c�a b�t k� m�n ph�i n�o","B��c 1: ��n <color=blue>L�i v�o m�t th�t<color> g�p <color=blue>Thi�n Nh�n T� S�<color>. Ti�p nh�n nhi�m v�, ��n <color=blue>Hoa S�n<color> t�m <color=red>V� V��ng Ki�m<color>.", "B��c 2: ��n <color=blue>Hoa S�n<color> ��nh b�i <color=blue> ��i Ho�n H�ng, ��i D� Tr�<color> ho�c <color=blue>��i Th�ch V�<color> s� l�y ���c <color=red>V� V��ng Ki�m<color>.", "B��c 3: Tr� v� Thi�n Nh�n Gi�o, giao <color=red>V� V��ng Ki�m<color> cho <color=blue>Thi�n Nh�n T� S�<color>, nhi�m v� ho�n th�nh. N�u V� V��ng Ki�m m�t �i,c�n ph�i th�c hi�n nhi�m v� l�i t� ��u!")
end;


function v2()
Talk(4, "", "Sau khi ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>V� �nh S�t th�<color>, h�c ���c v� c�ng <color=blue>Thi�n Nh�n �ao ph�p, Thi�n Nh�n M�u ph�p, H�a Li�n Ph�n Hoa<color>.<enter>Ti�p nh�n nhi�m v� n�y c�n ph�i l� �� t� tr�n c�p 10","B��c 1: ��n <color=blue>Thi�n Nh�n gi�o t�ng 3<color> g�p <color=blue>H�a ���ng ���ng ch� Ng�t Ng�o<color>. Ti�p nh�n nhi�m v�, v�o <color=blue>Th�t S�t ��ng<color> l�y <color=red>3 m�nh l�nh b�i<color>.", "B��c 2: L�n t�ng 2, v�o <color=blue>Th�t S�t ��ng<color>, ��nh b�i <color=blue>7 t�n T� t�<color> s� l�y ���c <color=red>3 m�nh l�nh b�i<color>.", "B��c 3: Tr� l�i <color=blue>t�ng 3<color> giao <color=red>l�nh b�i<color> cho <color=blue>H�a ���ng ���ng ch� Ng�t Ng�o<color>, nhi�m v� ho�n th�nh. ")
end;


function v3()
Talk(5, "", "Sau khi ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>T� S� <color>, h�c ���c v� c�ng <color=blue>�o �nh Phi H�<color>.<enter>Ti�p nh�n nhi�m v� n�y c�n ph�i l� �� t� tr�n c�p 20 v� �� ho�n th�nh nhi�m v� Th�t S�t l�nh.","B��c 1: ��n <color=blue>Qu�ng tr��ng<color> g�p <color=blue>Nh�t Nguy�t ��n ch� � H�p T�t<color>, nh�n nhi�m v� �i tr� l�i c�u h�i, �i t�m <color=blue>��a b� trai<color> l�y l�i <color=red>Nh�t Nguy�t Song Lu�n<color>", "B��c 2: ��n khu r�ng ph�a ��ng t�m <color=blue>��a b� trai (213,203)<color>, tr� l�i ch�nh x�c c�u ��, l�i nh�n nhi�m v� �i t�m <color=red>ti�u Ho�ng c�u<color> v� <color=red>ti�u Kh�i l�<color>", "B��c 3: ��n khu r�ng ph�a T�y t�m th�y <color=red>ti�u Ho�ng c�u (210,191)<color> v� <color=red>ti�u Kh�i l� (196,195)<color>, giao cho <color=blue>��a b� trai<color> ��i l�y <color=red>Nh�t Nguy�t Song Lu�n<color>.", "B��c 4: tr� v� giao <color=red>Nh�t Nguy�t Song Lu�n<color> cho <color=blue>� H�p T�t<color>, nhi�m v� ho�n th�nh. N�u Nh�t Nguy�t Song Lu�n m�t �i,c�n ph�i th�c hi�n nhi�m v� l�i t� ��u!")
end;


function v4()
Talk(5, "", "Sau khi ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>U Minh T� S�<color>, h�c ���c v� c�ng <color=blue>Li�t H�a T�nh Thi�n, Th�i S�n �i�n H��, Phi H�ng V� T�ch<color>.<enter>Ti�p nh�n nhi�m v� n�y c�n ph�i l� �� t� tr�n c�p 30 v� �� ho�n th�nh nhi�m v� ��a b� th�ng minh.","B��c 1: ��n <color=blue>Thi�n Nh�n gi�o t�ng 3<color> g�p <color=blue>H�a ���ng ���ng ch� Ho�n Nhan Tuy�t Y<color>. Ti�p nh�n nhi�m v�, ��n <color=blue>T�n L�ng<color>t�m 4 lo�i b�o th�ch: <color=red>C�p Huy�t H�ng, B�ng Tinh Lam, T� M�u L�c, V�n M�ng T�<color>.", "B��c 2: ��n <color=blue>T�n L�ng<color>, ��nh b�i <color=blue>��o b�o t�c<color>, s� l�y ���c 3 vi�n: <color=red>C�p Huy�t H�ng; B�ng Tinh Lam; T� M�u L�c<color>.", "B��c 3: Ra ph�a ngo�i T�n L�ng t�m m�t <color=blue>N�ng phu (296,158)<color>, s� mua ���c <color=red>V�n M�ng T�<color>.", "B��c 4: Tr� v� <color=blue>Thi�n Nh�n gi�o t�ng 3<color>, giao 4 lo�i B�o th�ch cho <color=blue> Ho�n Nhan Tuy�t Y<color>, nhi�m v� ho�n th�nh. ")
end;


function v5()
Talk(4, "", "Sau khi ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>Ch��ng K� S�<color>, h�c ���c v� c�ng <color=blue>Bi T� Thanh Phong<color>.<enter>Ti�p nh�n nhi�m v� n�y c�n ph�i l� �� t� tr�n c�p 40 v� �� ho�n th�nh nhi�m v� B�o Th�ch.","B��c 1: ��n <color=blue>t�ng 3<color> g�p <color=blue>H�u H� ph�p Gia Lu�t T� Ly<color>. Ti�p nh�n nhi�m v�, ��n <color=blue> (Ki�m C�c Th�c ��o) T�a V�n ��ng<color> th�ch s�t gian t� <color=blue>Li�u K�<color>.", "B��c 2: ��n <color=blue>T�a V�n ��ng<color> ��nh b�i <color=blue>Li�u K�<color> l�y ���c m�t b�c <color=red>Thi�n Nh�n m�t th�<color>.", "B��c 3: Tr� v� <color=blue>t�ng 3<color> giao <color=red>Thi�n Nh�n M�t th�<color> cho <color=blue>Gia Lu�t T� Ly<color>, nhi�m v� ho�n th�nh. N�u Thi�n Nh�n M�t th� m�t �i, c�n ph�i th�c hi�n nhi�m v� l�i t� ��u!")
end;


function v6()
Talk(6, "", "Sau khi ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>H� Gi�o s�<color>, h�c ���c v� c�ng <color=blue>L�ch Ma �o�t H�n<color>.<enter>Ti�p nh�n nhi�m v� n�y c�n ph�i l� �� t� tr�n c�p 50 v� �� ho�n th�nh nhi�m v� h�nh th�ch.","B��c 1: ��n <color=blue>t�ng 3<color> g�p <color=blue>T� H� ph�p �oan M�c Du�<color>. Ti�p nh�n nhi�m v�, ��n <color=blue>Bi�n Kinh Thi�t Th�p<color> c�u Ph�ng H�p Nh�.", "B��c 2: ��n <color=blue>t�ng 1 Thi�t Th�p<color>, ��nh b�i <color=blue>�ao binh ��i tr��ng, Th��ng binh �� tr��ng<color> ho�c <color=blue>Cung binh ��i tr��ng<color> s� l�y ���c <color=red>Ch�a kh�a<color>, m� <color=blue>B�o r��ng � t�ng 1<color>, m� ���c <color=blue>c� quan th� nh�t<color>.", "B��c 3: L�n <color=blue>t�ng 2 Thi�t Th�p<color>, ��nh b�i <color=blue>�ao binh th�ng l�nh<color> ho�c <color=blue>Cung binh th�ng l�nh<color> s� l�y ���c <color=red>Ch�a kh�a<color>,nh�p v�o <color=blue>B�o r��ng � t�ng 2<color>, m� ���c <color=blue>C� quan th� 2<color>.", "B��c 4: L�n <color=blue>t�ng 3 Thi�t Th�p<color>, ��nh b�i <color=blue>T�ng binh<color> l�y ���c <color=red>Ch�a kh�a<color>, nh�p v�o <color=blue>B�o r��ng � t�ng 3<color>, m� <color=blue>C� quan th� 3<color> c�u ���c Ph�ng H�p Nh�.", "B��c 5: Tr� v� <color=blue>Thi�n Nh�n gi�o<color>, g�p <color=blue> �oan M�c Du�<color> ph�c m�nh, nhi�m v� ho�n th�nh. ")
end;


function v7()
Talk(10, "", "Sau khi ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� <color=blue>T�t M�n Ph�p V��ng<color>, thu�n l�i xu�t s�.<enter>Ti�p nh�n nhi�m v� n�y c�n ph�i l� �� t� tr�n c�p 50 v� �� ho�n th�nh nhi�m v� c�u ng��i.","B��c 1: ��n <color=blue>t�ng 3<color> g�p <color=blue>Gi�o ch� Ho�n Nhan H�ng Li�t<color>. Ti�p nh�n nhi�m v�,  �i t�m <color=red>5 thanh �o�n Ki�m<color>,v� ��n <color=blue>Thi�n Nh�n Th�nh ��ng<color>l�y v� <color=red>s�ch da d�<color>.", "B��c th� 2:��n <color=blue>Bi�n Kinh<color> t�m <color=red>5 thanh �o�n Ki�m<color>:<enter>thanh th� 1:��n ch� th� r�n g�p <color=blue>Kh�c Thi�t T��ng?218,190?<color>,ti�p nh�n nhi�m v�,mang <color=red>Ng�n Tr�m<color> cho Tr��ng qu� ph�. ��n ph�a ��ng t�m <color=blue>Tr��ng qu� ph�?213,199?<color>, giao Ng�n Tr�m,nh�n ���c <color=red>H��ng Nang<color>.Giao H��ng Nang v� cho Kh�c Thi�t T��ng,nh�n ���c <color=red>�o�n ki�m 'Y�m Nh�t'<color>.", "Thanh th� 2: ��n <color=blue>c�ng B�c<color> t�m <color=blue>T�n T� t�i (229,184)<color>,tr� l�i ��ng c�u �� s� nh�n ���c thanh <color=red>�o�n ki�m '�o�n Th�y'<color>.", "Thanh th� 3: ��n <color=blue>S�ng b�c<color> t�m <color=blue>Con b�c (201,194)<color>,mua ���c <color=red>�o�n ki�m 'Chuy�n H�n'<color>.", "Thanh th� 4: ��n <color=blue>ph�a ��ng b�c<color> t�m <color=blue>��ng Mai (230,190)<color>, ti�p nh�n nhi�m v� gi�p c� ta t�m Ti�u h�i. ��n <color=blue>qu�ng tr��ng<color> t�m th�y <color=blue>Ti�u H�i (220,192)<color>, khuy�n n� v� nh�. Tr� l�i g�p ��ng Mai, nh�n ���c <color=red>�o�n ki�m 'Kh� T�'<color>.", "Thanh th� 5: ��n <color=blue>T��ng Qu�c t�<color> t�m <color=blue>�n m�y (210,187)<color>, li�n t�c b� th� 3 l�n s� nh�n ���c <color=red>�o�n ki�m 'Di�t H�n' <color>.", "B��c 3: Tr� l�i Thi�n Nh�n gi�o, v�o <color=blue>t�ng 1 Th�nh ��ng<color>, ��nh b�i 4 con <color=blue>��c X� tinh, Nh�n tinh, b� c�p tinh, b� c�p ch�a<color>,l�n l��t nh�n ���c <color=blue>h�u quy�t 'Thi�n ��a Huy�n Ho�ng'; 'Th�n X� Li�t Tr��ng'; 'Giang H� X� T�c'; 'Duy nng� gi�o v��ng'<color>, ti�p t�c �i l�n t�ng 2", "B��c 4: l�n t�ng 2<color=blue>Th�nh ��ng<color>, ��nh b�i <color=blue>B� c�p ch�a<color> s� l�y ���c <color=red>Ch�a kh�a<color>, nh�p v�o <color=blue>B�o r��ng (233,197)<color> s� l�y ���c <color=red>s�ch da d�<color>.", "B��c 5: Giao<color=red>s�ch da d�<color> v� cho <color=blue>Ho�n Nhan H�ng Li�t<color>, nhi�m v� ho�n th�nh. N�u s�ch da d� m�t �i, ph�i th�c hi�n nhi�m v� l�i t� ��u!")
end;

function v8()
Talk(3,"","Th�ng qua Tr�ng ph�n s� m�n, ng��i ���c phong l� <color=blue>Th�nh Gi�o Tr��ng l�o<color>, h�c ���c tuy�t h�c tr�n ph�i <color=blue>Thi�n Ma Gi�i Th�; v� c�ng Th�u Thi�n Ho�n Nh�t; Ma Di�m Th�t S�t<color>.","B��c 1: Sau khi ��t ��n c�p 60, ��n <color=blue>Thi�n Nh�n Gi�o t�ng 3<color> g�p <color=blue>Gi�o ch�<color>, xin ���c tr�ng ph�n Thi�n Nh�n Gi�o.","B��c 2: T�ng cho m�n ph�i <color=red>50000 ng�n l��ng<color> tr�ng ph�n Thi�n Nh�n Gi�o.")
end;

--------------------------------

function ok()
end;
