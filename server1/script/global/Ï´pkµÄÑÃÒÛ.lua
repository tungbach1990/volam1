-- ϴPK������.lua
-- By Dan_Deng(2003-11-10)

Include("\\Script\\Global\\TimerHead.lua")
Include("\\Script\\Global\\FuYuan.lua")

function default_talk()
	if (GetFightState() ~= 0) then
		SetFightState(0)
	end
	Say("Qu�c c� qu�c ph�p. Gia c� gia quy!  Ng��i hai tay d�nh ��y m�u �i ��n ch�n tr�i g�c b� th� c�ng kh�ng th� tho�t kh�i lu�t ph�p! ",3,"Ta ��n ��u th� /atone","Ta ��n th�m t� /visit","Kh�ng h�i n�a!/no")
	LeaveTeam();
end

function atone()				-- ����ϴPK
	local PK_value = GetPK()
	local my_money = GetCash()
	local ExpPer = GetExpPercent()
	local Uworld96 = GetTask(96)
	local Uworld94 = GetTask(94)
	if (Uworld96 > 0) then		-- �ݴ���������η��ⷢ�ִ�������״̬���Ȼ�ԭ����˵
		SetTask(96,0)
		StopTimer()
		if (Uworld94 > 0) then	-- ������б���ļ�ʱ����ͬʱ��ԭ(��������μ�ʱ����ֱ�ӹؼ�ʱ��)
			if (Uworld94 ~= 9) then
				SetTimer(GetTask(95),GetTask(94));
			end
			SetTask(94,0)
			SetTask(95,0)
		end
	end
	if (PK_value == 0) then			-- ����
		Talk(2,"","Ta v� t�nh l�m b� th��ng ng��i kh�c nay ��n t� th�! ","B�n ph� �� �i�u tra, ng��i ch� l� ph�ng v� ch�nh ��ng m� th�i! Sau n�y c�n th�n m�t ch�t!  Ng��i �i �i! ")
	elseif (Uworld94 > 0) and (Uworld94 ~= 9) then		-- �Ѿ��б���ļ�ʱ�����������ٱ��棨����ѱ���������μ�ʱ�����ݴ������
		Talk(1,"","Ng��i mang nhi�u tr�ng tr�ch ch�a ho�n th�nh, sao c� th� t� � l�ng ph� th�i gian, �em th�n h�u d�ng c�a m�ng v�o ng�c lao nh� th� sao?")
		Msg2Player("Tr�n ng��i c�n nhi�u nhi�m v� quan tr�ng, kh�ng cho ph�p ��n t� th� ")
	elseif (ExpPer < -50) then			-- ������ͷ��У�������ϴPK
		Talk(1,"","T�i ng��i ch�t ch�ng nh� n�i, Ng�i lao c�ng v� d�ng!  Ha!  Ha!  ��i b� ng��i ta �� s�t �i! ")
		Msg2Player("Ph�p lu�t quy ��nh: Nh�n v�t �i�m �m qu� 50%, kh�ng ���c t� th� chu�c t�i!")
	else
		Say(GetName()..": Tr��c ��y ta l� tay s�t th��ng ng��i kh�c, nay ��n t� th�", 1, "Ti�p t�c ��i tho�i /want_atone")
	end
end

function want_atone()
	local PK_value = GetPK();
	local my_money = GetCash();
	Say("Ngay ng��i �� nhu�m m�u, ph�i ng�i ��i lao �� s�m h�i t�i l�i, tu t�m d��ng t�nh. <enter>�.<enter>T�i tr�ng nh� sau <enter>  Cai ph�m <color=red> "..GetName().." <color> hi�n �i�m PK l� <color=red>"..PK_value.."<color>, ��nh h�i l� quan sai <color=red>"..my_money.."<color> l��ng. C�ng g�p 2 t�i, nh�t v�o ��i lao <color=red>"..PK_value.."<color> ng�y.", 2, "V�o ��i lao /go_atone", "Hay l� ta ch�y tr�n th�i /no")
end;

function go_atone()

	SetTask(96,100+GetPK())
	i = GetTimerId()
	if (i > 0) and (i ~= 9) then		-- �������ԭ�м�ʱ�����Ҳ������μ�ʱ�����ȱ���
		SetTask(94,i)
		SetTask(95,GetRestTime(i))
	else
		SetTask(94,0)
		SetTask(95,0)
		StopTimer()
	end
	local my_money = GetCash();
	Pay(my_money);
	Msg2Player("Quan sai t�ch thu to�n b�"..my_money.." ng�n l��ng c�a b�n. B�n b� ��a v�o ��i lao")
	WriteLog(date().."\tName:"..GetName().."\tAccount:"..GetAccount().."\t b� t�ch thu h�t ti�n trong ng��i v� ��a v�o ��i"..my_money.." l��ng")
	FuYuan_Pause();
	SetTimer(12 * CTime * FramePerSec, 9)				-- ÿ120����ͨ����ʱ�����½���PKֵ
	DisabledTeam(1);
	NewWorld(208,1785,3062)
end

function visit()			-- ̽��
	Say("Mau �i ch� kh�c!  Nh�n c�i g�? C� ph�i l� ��ng b�n kh�ng! ",2,"H�i l� 5000 l��ng b�c /go_visit","�i ra /no")
end

function go_visit()
	if (GetCash() >= 5000) then
		Talk(1,"","Sao? B�n ng��i trong t� ph�t b�nh? N�u v�y ng��i �i th�m h�n c�ng tr�n t�nh!  Nh� ��ng l�m g� gian d�i ��y")
		Msg2Player("H�i l� Nha D�ch 5000 l��ng b�c, v�o ��i lao �� th�m t� nh�n ")
		Pay(5000)
		SetTask(96,1)
		DisabledTeam(1);
		NewWorld(208,1785,3062)
	else
		Talk(1,"","�i ra! C� ph�i mu�n ta b�t ng��i v�o c�ng ��ng ��ng m�i v�a l�ng kh�ng?")
	end
end

function no()
end
