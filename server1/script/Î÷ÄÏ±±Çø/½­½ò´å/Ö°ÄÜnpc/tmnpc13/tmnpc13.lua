--description: ���Ž������Ԫ 50������
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_tm = GetTask(2);
	Uworld123 = GetTask(123)
	Uworld37 = GetByte(GetTask(37),1)
	if (GetLevel() >= 90) and (Uworld123 < 10) and (Uworld37 == 127) and (GetReputeLevel(GetRepute()) >= 5) and (GetFaction() ~= "tangmen") then		-- ��������������90���������ż������ӡ�����δ�����������ȼ�5��
		Talk(2,"U123_get","G�n ��y B�t Nhi�m s� huynh h�nh tung k� l�, c� l� ta qu� �a nghi ch�ng? Ta lu�n c�m th�y c� m�t m�i nguy hi�m �ang �n ch�a b�n trong!","V�y sao? Ta h�nh nh� kh�ng c�m th�y!")
	elseif (Uworld123 >= 10) and (Uworld123 < 255) then			-- ���������
		Talk(1,"","Nh�ng l�i �� ��ng bao gi� �� truy�n ra ngo�i, B�t Nhi�m s� huynh l� ��a con m� m�n ch� nh�t m�c y�u th��ng. N�u ��n tay �ng ta, ch�ng ta e r�ng kh�ng to�n m�ng!")
	elseif (UTask_tm == 50*256+40) then  				--50������
		Talk(7, "", "T�m ta c� vi�c g�p g� kh�ng?", "Ng� s� huynh, t�i qua huynh c� �i qua ph�ng �m kh� kh�ng?", "�C�, ta v�o d�n d�p, qu�t nh� xong th� �i ra!", "Huynh c� th�y Tam S� huynh kh�ng?", "N�i ra th�t l�! T�i qua ta th�y m�t ng��i r�t gi�ng Tam s� huynh ph�a sau ph�ng �m kh�. Ta c� g�i 1 ti�ng. N�o ng� huynh �y v�i v� b� �i, ta c�n cho l� m�nh nh�n l�m!", "Huynh c� bi�t Tam s� huynh b�y gi� � ��u kh�ng?", "S�ng nay khi ta ra ngo�i, tr�ng th�y huynh �y �i v� h��ng <color=Red>Thanh Th�nh s�n<color>, c� th� �i <color=Red>H��ng Th�y ��ng <color>, nghe n�i c� v�i ng��i b�n c�a huynh �y � ��.")
		SetTask(2, 50*256+60)
		Msg2Player("� Giang T�n th�n t�m ���c ���ng Nguy�n, bi�t ���c ���ng H�a �i ��n H��ng Thu� ��ng c�a Thanh Th�nh s�n ")
		AddNote("� Giang T�n th�n t�m ���c ���ng Nguy�n, bi�t ���c ���ng H�a �i ��n H��ng Thu� ��ng c�a Thanh Th�nh s�n ")
	elseif (UTask_tm == 50*256+60) then  
		Talk(1,"","Tam s� huynh c� th� �i <color=Red>H��ng Th�y ��ng<color>, nghe n�i c� v�i ng��i b�n c�a huynh � ��.")
	else
		Talk(1,"","Cha m� ta m�t s�m, nh� ng��i c�u nu�i n�ng n�n ng��i, c�u l� ng��i th�n thu�c nh�t c�a ta.")
	end
end;

function U123_get()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- ����δѧҰ��ȭ�ģ������������
		Talk(1,"","B� �i! Ng��i ch�ng ph�i b�n l�nh g�, n�i ra nh�ng l�i n�y ch� th�m phi�n ph�c m� th�i!")
	else
		Say("G�n ��y d��ng nh� �ng t�m th�n th��ng b�t �n�.",2,"Nghe m�t l�c �� b�t ��u tin m�t ch�t /U123_get_yes","Chuy�n c�a ng��i kh�c kh�ng c�n qu� �� t�m /no")
	end
end

function U123_get_yes()
	SetTask(123,10)
	Msg2Player("Nhi�m v� gi� ho� Nh�t Tr�n b�t ��u: �i�u tra h�nh tung k� qu�i c�a ���ng B�t Nhi�m ")
	AddNote("Nhi�m v� gi� ho� Nh�t Tr�n b�t ��u: �i�u tra h�nh tung k� qu�i c�a ���ng B�t Nhi�m ")
end

function no()
end
