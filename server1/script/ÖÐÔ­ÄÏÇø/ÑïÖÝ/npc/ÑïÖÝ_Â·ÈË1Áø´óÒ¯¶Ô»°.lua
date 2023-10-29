-- ���� ·��NPC ����ү��ؤ����������
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
	if (Uworld30 == 10) and (HaveItem(72) == 0) then		--���������в���û�и���Ʒ
		Say("Ph�i khen th� n�o ��y?",4,"T�i ph�c /prise_1","Con ch�u. /prise_2","c�ng danh /prise_3","R�i kh�i/prise_exit")
	else					--����ͨ�Ի��и�һ���������ʾ��
		i = random(0,2)
		if (i == 0) then
			Talk(1,""," S�ng tr�n ��i, c�n ph�i c� l�ng t� t�m!")
		elseif (i == 1) then
			Talk(1,"","Ha!Ha! Kh�ng sai! Kh�ng sai! Ta b�nh sinh m�c d� kham kh�,nh�ng b�y gi� th� kh� t�n cam lai,con ch�u l�i r�t hi�u thu�n. Ta �� c� th� t� h�o v�i t� t�ng c�a m�nh r�i!")
		else
			Talk(1,"","C� ��i ta ch� �eo �u�i m�t gi�c m�ng n�y th�i! Ha! Ha! Xem ra ta l� ng��i h�nh ph�c nh�t tr�n ��i")
		end
	end
end

function prise_1()
	Talk(2,"","L�o gia n�y, v�a nh�n �� bi�t ng��i gi�u c�, gia t�i v�n quan!","Kh�ng sai kh�ng sai! Tuy ta �n m�c kh�ng thi�u, nh�ng gia c�nh ch� b�nh th��ng, �i�u vui nh�t l� con ch�u r�t hi�u thu�n")
end

function prise_2()
	Talk(4,"","L�o gia, v�a nh�n ta �� bi�t �ng l� ng��i gi�u c�, nh�t ��nh l� d�ng d�i danh gia","Ha!Ha! Kh�ng sai! Kh�ng sai! Ta b�nh sinh m�c d� kham kh�, nh�ng b�y gi� th� kh� t�n cam lai,con ch�u l�i r�t hi�u thu�n. Ta �� c� th� t� h�o v�i t� t�ng c�a m�nh r�i!","L�o gia! c� th� cho ta 1 s�i r�u c�a �ng kh�ng?","Th�ng nh� n�y th�t l� k� qu�i! Mu�n xin m�t s�i r�u c�a ta �� l�m g�? Nh�ng m� d� sao th� ng��i c�ng c� duy�n v�i ta ��! ���c! Ta t�ng ng��i m�t s�i r�u!")
	AddEventItem(72)
	Msg2Player("C� s�i r�u t� ch� l�o gi�. ")
	AddNote("B�n c� m�t s�i r�u ")
end

function prise_3()
	Talk(2,"","V� l�o gia n�y v�a nh�n �� bi�t h�c th�c uy�n th�m! Th�i trai tr� �� h�c qu� cao trung r�i!","Ta v�n kh�ng m�ng ch� ngh�a, tr��c gi� ch�a �� m�t ��n c�ng danh, ng��i khen qu� l�m ta ng�i!")
end

function prise_exit()
end
