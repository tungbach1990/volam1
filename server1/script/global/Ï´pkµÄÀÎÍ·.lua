-- ������ͷ.lua����ϴ������
-- By Dan_Deng(2003-11-12)

Include("\\script\\global\\timerhead.lua")
Include("\\Script\\Global\\FuYuan.lua")
Include("\\script\\nationalwar\\head.lua")

function main(sel)
	local Uworld96 = GetTask(96)
	local PK_value = GetPK();
	if (Uworld96 == 1) then			-- ̽���
		Say("Th�m xong ch�a v�y? Mau �i �i! ",2,"C�m �n v� ��i ca n�y, ta �i ��y /visit_leave","Xin ��i ca th� th� cho ch�t ��! Ta s� �i ngay th�i /no")
--	elseif (Uworld96 == 0) then		-- ������
--		Talk(1,"","��ͷ��ι��������ô��������ص����ģ���ʲô��ȥ��GM���Ͱɣ�")
	elseif (PK_value <= 0) then		-- ϴ����PK��
		Talk(2,"PKclear","Mau thu x�p h�nh l� �i!  Ng��i c� th� ra kh�i ��y r�i! ","�a t� �ai ca, v�y ta �i ��y! ")
	else									-- ϴPK��
		-- ����ϵͳ����������
		local absolve_time = NW_GetTask(NW_TASKNO_ABSOLVE)
		local current_time = GetCurServerTime()
		if (absolve_time ~= 0 and current_time < absolve_time + SECONDS_ONEHOUR) then
			Say("Thi�n t� nh�n t�, ��i x� thi�n h�. Ng��i sau n�y ��ng ph�m t�i n�a nha.",
				2,
				"Tr� v� nh�/nw_absolve",
				"Ta mu�n � l�i t�/Cancel")
		else
			local n_timerid = GetTimerId();
			if (n_timerid ~= 9) then
				SetTask(96,100 + PK_value);
				SetTimer(12 * CTime * FramePerSec, 9)
				return
			end
			Say("��i ng�c thi�n lao, kh�ng ���c t�y � �i l�i! ",3,"H�i th�i gian /ask_timer","N�p ti�n �� t�i ngo�i/pay_money","D�! D�! N�u v�y ta s� tr� v�o trong �� /no")
		end
	end
end

-- ����ϵͳ����������
function nw_absolve()
	SetPK(0)
	leave_prison()
end

function ask_timer()
	if (GetCash() >= 1000) then		-- ��500�����Ӳ�����
		Pay(1000)
		Talk(2,"","V� ��i ca n�y. ��y l� 1000 l��ng b�c xin c�m �� u�ng tr�. Ta ch� l� mu�n h�i th� b�y gi� l� m�y gi� th�i. ","Lao ��u: T�i �� nghi�t s�c, ��ng ki�m chuy�n n�a "..GetRestCTime(9).."Mau �i v� trong �� �i ")
	else
		Talk(2,"","V� ��i ca n�y! Ta ch� mu�n h�i b�y gi� l� m�y gi� th�i! ","H�i g� m� h�i! Mu�n �n ��n h�! C�n kh�ng mau quay v� ch� ng�i! ")
	end
end

function pay_money()
	PK_PayMoney = GetPK() * GetPK() * 10000
	Talk(1,"pay_money2","Lao ��u ��i ca, � ��y "..PK_PayMoney.."C� ch�t ng�n l��ng, xem nh� �t l�ng th�nh. Ch� l� v� ta � trong n�y �� sinh tr�ng b�nh kh�ng th� kh�ng c� ���c n�a. Xin ��i ca h�y khai �n cho ra ngo�i t�m ��i phu. ")
end

function pay_money2()
	Say("Xem ng��i r�ch r��i v�y,sao l�i c� nhi�u ti�n v�y th�! ",2,"��t ti�n v�o tay h�n /pay_yes","Ti�p t�c th�nh c�u /pay_no")
end

function pay_yes()
	PK_PayMoney = GetPK() * GetPK() * 10000
	if (GetCash() >= PK_PayMoney) then
		Pay(PK_PayMoney)
		Msg2Player("Lao ��u cho ph�p �i t�m ��i phu. B�n c� th� r�i kh�i ��i lao r�i. ")
		Talk(1,"leave_prison","Lu�t ph�p v� t�nh, nh�n h�u t�nh!  B�nh ng��i n�ng nh� v�y n�n �i t�m th�y thu�c ch�a!  Nh� r�ng ng��i ch� ra ngo�i ch�a b�nh th�i, th�n ph�n t� t�i ch�a r�a s�ch ��ng t�i ph�m n�a! ")
	else
		pay_no()
	end
end

function pay_no()
	Talk(1,"","Qu� ��i!  C�t ngay!  Kh�ng ta qu�t cho 1 roi b�y gi�! ")
end

function PKclear()
	Msg2Player("Sau m�t h�i xem x�t th� ng��i b� �u�i ra kh�i nh� lao ")
	leave_prison()
end

function leave_prison()
	StopTimer()
	if (GetTask(94) == 9) then		-- ���ϴ���ر��������μ�ʱ����������������ֱ�����
		SetTask(94,0)
		SetTask(95,0)
	elseif (GetTask(94) > 0) then		-- �ָ�����ԭ�еļ�ʱ��
		Msg2Player("Tr�n m�nh ng��i v�n c�n mang nhi�m v�! H�y l�p t�c �i l�m nhi�m v� �i ")
		SetTimer(GetTask(95),GetTask(94))
		SetTask(94,0)
		SetTask(95,0)
	end
	FuYuan_Resume();
	leave2()
end

function visit_leave()
	leave2()
end

function leave2()
	SetTask(96,0)
	leave_pos = GetTask(93)
	DisabledTeam(0);
	if (leave_pos == 1) then		-- �ٰ�
		NewWorld(176,1473,3245)
	else								-- �꾩
		NewWorld(37,1781,3044)
	end
--	NewWorld(57,1592,3195)		-- �ӵ���ɽ����
end

function no()
end
