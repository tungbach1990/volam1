-- ���� ���� ͯϦ�� ��������
-- by��Dan_Deng(2003-07-30)
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
	UTask_kl = GetTask(9)
	Uworld31 = GetByte(GetTask(31),2)
	if (Uworld31 == 10) then
		if (HaveItem(8) == 1) then
			Talk(2,"Uworld31_get_Monkey","Ti�u th�! Con Kim T� H�u n�y d� th��ng qu�! T�ng cho c� ��y!","T� gi� �� c� ng��i ch�i v�i ta r�i! Hihi! D� th��ng qu�! Ta mang cho cha ta xem!")
		else
			Talk(1,"","B�t kh� c� d� kh�ng?")
		end
	elseif (Uworld31 == 0) and (GetFaction() ~= "kunlun") and (GetLevel() >= 10) then		--��������
		Say("Ta t� b� ��n l�n v�n ch�a ra kh�i C�n L�n, cha ta n�i ng��i b�n ngo�i r�t x�u, kh�ng cho ta qua l�i v�i nh�ng ng��i ��! Ta c� ��n ��n ch�t ���c! Nghe n�i r�ng 'Kho�i Ho�t' c� r�t nhi�u kh�, n�u c� ���c 1 con Kim t� h�u ch�i v�i ta th� t�t bi�t ch�ng n�o! Ng��i c� th� b�t cho ta 1 con kh�ng",2,"Kh�ng th�nh v�n ��!/enroll_get_yes","Ta c� th� kh�ng c� th�i gian �i b�t kh� /enroll_get_no")
	elseif (Uworld31 >= 20) then
		Talk(1,"","Kim T� h�u th�c l� d� th��ng! Ta r�t th�ch n�!")
	else
		Talk(1,"","Th� gi�i b�n ngo�i nh� th� n�o nh�?")
	end
end;

function Uworld31_get_Monkey()
	DelItem(8)
	Uworld31 = SetByte(GetTask(31),2,20)
	SetTask(31,Uworld31)
	Msg2Player("��ng T�ch Nhan r�t th�ch nh�n con Kim T� H�u m� b�n �� b�t ���c. ")
	AddNote("��ng T�ch Nhan r�t th�ch nh�n con Kim T� H�u m� b�n �� b�t ���c. ")
end

function enroll_get_yes()
	Talk(1,"","B�t 1 con kh� c� g� l� kh�! Ta s� �i b�t ��y!")
	Uworld31 = SetByte(GetTask(31),2,10)
	SetTask(31,Uworld31)
	Msg2Player("Nh�n nhi�m v�: Gi�p ��ng T�ch Nhan ��n Kho�i Ho�t l�m b�t 1 con Kim T� H�u ")
	AddNote("Nh�n nhi�m v�: Gi�p ��ng T�ch Nhan ��n Kho�i Ho�t l�m b�t 1 con Kim T� H�u ")
end;

function enroll_get_no()
end;
