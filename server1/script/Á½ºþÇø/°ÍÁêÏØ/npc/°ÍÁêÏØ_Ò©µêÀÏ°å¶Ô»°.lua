--description: ������ ������ ҩ���ϰ�Ի���������40��������������С������Ĳ���
--author: yuanlan	
--date: 2003/4/26
-- Update: Dan_Deng(2003-08-10)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	UTask_tw = GetTask(3)
	UTask_world18 = GetTask(46)
	if (UTask_tw == 40*256+20) then						-- ����40������
		Talk(5, "L40_tw_talk2", "T�i h� l� �� t� Thi�n V��ng bang, c� m�t ��ng m�n b� tr�ng n�c r�n X�ch Li�m. Xin th�n y cho thu�c gi�i!", "R�n X�ch Li�m �? Th�t l� nguy hi�m qu�!..Ta c� th� c�u, c�i kh� l� ph�i t�m ���c d��c li�u �� ph�i thu�c!", "Kh�ng bi�t ph�i c�n nh�ng d��c li�u g�?", "��y l� b� quy�t gia truy�n, nh�ng ng��i l� �� t� Thi�n V��ng n�n ta n�i cho nghe! C�n c� <color=Red>da th�n l�n ��<color> v� <color=Red>L�c Th� Quy<color>. T�m ���c hai th� n�y th� ��ng m�n c�a ng��i s� ���c c�u", "Kh�ng bi�t c� th� t�m hai th� n�y � ��u?")
	elseif(UTask_world18 == 1) then				-- ���ִ�С������
		Talk(1,"","H�?B� c�a Ti�u Ng� b�nh �? Ng��i ��n ch�m r�i! Ta v�a b�n vi�n T� B� ho�n cu�i c�ng cho �� t� Thi�n V��ng. Hay l� ng��i h�i th� �ng ta xem")
		Msg2Player("Ch� d��c �i�m cho bi�t T� B� ho�n �� b�n h�t. B�n h�y �i h�i th� �� t� Thi�n V��ng Bang. ")
		AddNote("T� B� ho�n �� b�n h�t. B�n h�y �i h�i th� �� t� Thi�n V��ng Bang. ")
	elseif (UTask_tw == 40*256+50) then
		Say("Nghe n�i trong <color=Red>Ph�c L�u ��ng<color> c� <color=Red>Th�n l�n ��<color> v�<color=Red>L�c Th� Quy<color>, c� ng��i tr�n <color=Red>Thi�n V��ng ��o<color> �� nh�n th�y. Ch� c�n t�m ���c n� th� ��ng m�n s� ���c c�u", 2, "Ta mua �t thu�c tr��c ��/yes", "Ta ph�i l�p t�c �i t�m thu�c d�n/no")
	else							-- ������״̬
		Say("B�n ti�m ��u l� th�n d��c! C� b�nh s� kh�i b�nh, kh�ng b�nh s� kh�e, gi� c� ph�i ch�ng. Mua m�t �t ch�?", 3, "Giao d�ch/yes", "Ta ��n nh�n nhi�m v� S� nh�p/yboss","Kh�ng giao d�ch/no");
	end
end;

function L40_tw_talk2()
	Talk(2,"","Nghe n�i trong <color=Red>Ph�c L�u ��ng<color> c� <color=Red>Th�n l�n ��<color> v�<color=Red>L�c Th� Quy<color>, c� ng��i tr�n <color=Red>Thi�n V��ng ��o<color> �� nh�n th�y", "�a t� Ng� th�n y!")
	SetTask(3, 40*256+50)								-- ����40������
	AddNote("Ng� th�n y t�i Ba L�ng huy�n cho bi�t: mu�n gi�i n�c r�n c�n c� da th�n l�n �� v� L�c Th� Quy")
	Msg2Player("Mu�n tr� ���c n�c c�a ��c x�, c�n ph�i c� da Th�n l�n �� v� L�c Th� Quy.")
end;

function yes()
	Sale(39);  			--�������׿�
end;

function no()
end;
