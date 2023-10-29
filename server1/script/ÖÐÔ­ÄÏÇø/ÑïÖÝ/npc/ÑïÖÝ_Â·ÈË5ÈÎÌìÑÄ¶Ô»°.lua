-- ���� ·��NPC �����ģ���������
-- by��Dan_Deng(2003-07-28)
Include("\\script\\misc\\eventsys\\eventsys.lua")
Include("\\script\\dailogsys\\dailog.lua")

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
	Uworld30 = GetByte(GetTask(30),2)
	if ((Uworld30 == 10) and (HaveItem(73) == 0)) then		--���������в���û�и���Ʒ
		Say("Ph�i khen th� n�o ��y?",4,"Con ch�u. /prise_1","T��ng m�o /prise_2","c�ng danh /prise_3","R�i kh�i/prise_exit")
	else					--����ͨ�Ի��и�һ���������ʾ��
		i = random(0,2)
		if (i == 0) then
			Talk(1,"","Ti�u sinh gia c�nh b�n h�n ��n nay th� t� v�n ch�a c�: 'C� nh�n v�n,b�t hi�u h�u tam,v� h�u vi ��i'. N�u nh� v�y sau n�y ta l�m sao c� th� nh�n m�t t� t�ng?!")
		elseif (i == 1) then
			Talk(1,"","Ch�nh v� ta l�n l�n x�u x� nh� v�y n�n kh�ng c� c� g�i n�o ch�u g� cho ta c�! T�i sao c�c c� g�i tr�n ��i l�y ch�ng ��u ch� th�ch nh�n t��ng m�o?")
		else
			Talk(1,"","Th�p ni�n h�n song v� nh�n hi�u; nh�t c� th�nh danh thi�n h� tri'? Ph�i ch�ng ch� ��n khi n�o ta th�nh danh th� m�i mong ��n chuy�n th� t�?")
		end
	end
end;

function prise_1()
	Talk(2,"","V� huynh ��i n�y, v�a nh�n th�y t��ng m�o, �� bi�t ngay l� ng��i c� ph�c s�, con ch�u ��y nh�!","Ti�u sinh gia c�nh b�n h�n ��n nay th� t� v�n ch�a c�: 'c� nh�n v�n,b�t hi�u h�u tam,v� h�u vi ��i'. N�u nh� v�y sau n�y ta l�m sao c� th� nh�n m�t t� t�ng?!")
end;

function prise_2()
	Talk(2,""," V� huynh ��i n�y, v�a nh�n th�y t��ng m�o, �� bi�t ngay l� ng��i c� ph�c s�, con ch�u ��y nh�!","Ng��i ��ng c� ��a gi�n n�a! Ch�nh v� ta l�n l�n x�u x� nh� v�y n�n kh�ng c� c� g�i n�o ch�u g� cho ta c�! T�i sao c�c c� g�i tr�n ��i l�y ch�ng ��u ch� th�ch nh�n t��ng m�o?")
end;

function prise_3()
	Talk(2,""," V� huynh ��i n�y, v�a nh�n th�y t��ng m�o, �� bi�t ngay l� ng��i c� ph�c s�, con ch�u ��y nh�!","Nh�n sinh kh� c� tri �m, ng��i th�t l� tri k� c�a ta! Ti�u sinh kh�ng c� v�t g� ��ng gi�, ch� c� phi�n qu�t n�y, t�ng ng��i g�i l� l� t��ng ki�n")
	AddEventItem(73)
	Msg2Player("Nhi�m Thi�n Nhai t�ng b�n chi�c qu�t ")
	AddNote("Nhi�m Thi�n Nhai t�ng b�n chi�c qu�t ")
end;

function prise_exit()
end;
