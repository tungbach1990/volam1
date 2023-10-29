--description: ���������� 
--author: yuanlan	
--date: 2003/3/4
--update: Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-12)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_em = GetTask(1)
--	player_Faction = GetFaction()
	if (GetSeries() == 2) and (GetFaction() == "emei") then
		if (UTask_em == 10*256) and (GetLevel() >= 10) then		--10����������
			Talk(5,"L10_talk2", "Ph�t T�! �� t� c� t�i, xin h�y tr�ng ph�t �� t�, ��ng gi�ng t�i cho huynh �y....", "S� t�, xem t� �u�m n�t u s�u, c� chuy�n g� kh�ng?", "N�i ra d�i l�m -- Tr��c khi ta xu�t gia ��u Ph�t, �� t�ng c� m�t gia ��nh h�nh ph�c ng�p tr�n. N�o ng� cu�c chi�n T�ng Kim n� ra, t��ng c�ng ta b� l�i ra chi�n tr��ng l�m Tr�ng �inh. Ch�ng ra �i nhi�u n�m nh�ng kh�ng c� tin t�c g�!", "V� sau c� tin ch�ng �� t� tr�n n�i chi�n tr��ng. Ta v� c�ng �au kh�, xu�ng t�c l�m ni c�, ��nh s�ng cu�c s�ng ��m b�c trong qu�ng ��i t�n. N�o ng�, t��ng c�ng ta v�n c�n s�ng!", "Sau khi ch�ng tr� v�, �au kh� kh�n thi�t mong ta ho�n t�c. Nh�ng, ta �� ph�t nguy�n n��ng nh� c�a Ph�t, sao c� th� v� chuy�n luy�n �i h�ng tr�n m� quay l�ng l�i v�i Ph�t T�? Ta th�t c� t�i! ")
		elseif (UTask_em == 10*256+20) and (HaveItem(18) == 0) then			-- ͭ������
			AddEventItem(18)
			Talk(1,"","�i da! C�i t�n ti�u qu� n�y, n�a m�t g��ng ��ng ta ch�a l�y �� ch�y m�t!")
			Msg2Player("Nh�n ���c n�a m�nh g��ng ��ng. ")
		elseif ((UTask_em == 10*256+60) and (HaveItem(20) == 1)) then					--�õ��޸��õ�����ͭ��
			Talk(2, "", "S� t�, nh�n xem! G��ng ��ng �� s�a xong! G��ng v� l�i l�nh, n�u Ph�t T� bi�t t�m ch�n t�nh c�a phu ph� t�, nh�t ��nh s� kh�ng tr�ch t� ��u!", "�a t� s� mu�i! H�y gi�p ta mang t�m g��ng ��ng trao cho t��ng c�ng. Nh�n v�i ch�ng n�u b�ng l�ng ��i ta 3 n�m. 3 n�m sau ta nh�t ��nh tr� v� b�n ch�ng. Trong 3 n�m ta ph�i chuy�n t�m tu h�nh �� c�u xin Ph�t T� tha th�.")
			SetTask(1,10*256+70)
			AddNote("Quay v� Nga Mi nh�n nhi�m v� c�a Di�u �n ph� th�c, �em g��ng ��ng trao cho t��ng c�ng b� ta. ")
			Msg2Player("Quay v� Nga Mi nh�n nhi�m v� c�a Di�u �n ph� th�c, �em g��ng ��ng trao cho t��ng c�ng b� ta. ")
		elseif ((UTask_em == 10*256+70) and (HaveItem(20) == 0)) then		-- �����У�ͭ�����֡�����
			AddEventItem(20)
			Talk(1,"","Di�u �n:Ti�u qu� �! Qu�n c�m g��ng ��ng r�i!")
		elseif (UTask_em == 10*256+80) then
			Talk(2,"L10_prise","G��ng ��ng �� giao cho t��ng c�ng t�, ��i ca n�i s� m�i m�i ��i t� tr� v�!", "S� mu�i! Ta th�t kh�ng bi�t ph�i c�m �n mu�i th� n�o!")
		else   					--�Ѿ����10������ȱʡ�Ի���
			Talk(1,"","S� mu�i! Ta th�t kh�ng bi�t ph�i c�m �n mu�i th� n�o!")
		end
	elseif (UTask_em >= 70*256) then								--�Ѿ���ʦ
		Talk(1,"","Mu�i ph�i h� s�n sao? H�y ch� � b�o tr�ng.")
	else
		Talk(1,"","Ph�t T�! �� t� c� t�i, xin h�y tr�ng ph�t �� t�, ��ng gi�ng t�i cho huynh �y....")
	end
end;

function L10_talk2()
	Talk(3,"L10_get","S� t�! ��ng t� tr�ch m�nh! C� tr�ch h�y tr�ch chuy�n ��i ngang tr�i, t�o h�a tr�u ng��i.", "N�u ta kh�ng ho�n t�c, ch�ng s� kh�ng ch�u r�i kh�i Nga Mi. Ch�ng n�i ng�y ng�y s� ��ng d��i n�i ��i ta, mong ta h�i t�m chuy�n �. Ta ph�i l�m sao ��y? L�ng ta r�i nh� t� v�!", "S� t�, t�m � s� t� r�t cu�c l� th� n�o? T� c�n y�u t��ng c�ng kh�ng?")
end;

function L10_get()
	Say("N�u t�nh duy�n ki�p n�y �� ��nh s�n nh� th�, ta l�m sao d�m c��ng l�i? N�m x�a khi ch�ng t�ng qu�n, �� t�ng chia m�nh g��ng l�m 2 m�nh �� l�m t�n v�t cho ng�y sau g�p l�i, l� n�o g��ng v� l�i l�nh sao?", 2, "�� ta th� xem. /L10_get_yes", "Kh�ng c� c�ch/L10_get_no")
end;

function L10_get_yes()
	Talk(1, "select1", "G��ng v� ch�a n�i kh�ng th� n�o l�nh ���c! T� h�y ��a <color=Red>n�a m�nh g��ng ��ng <color> cho mu�i. Mu�i ��n <color=Red>Th�nh ��<color> t�m <color=Red> Th� r�n<color> th� xem c� c�ch n�o kh�ng!")
end;

function select1()
	Talk(1,"","C� th�t ���c kh�ng? T�t l�m!<color=Red>n�a m�nh g��ng kia<color> � ch� <color=Red>t��ng c�ng<color> ta. Ch�ng �ang � <color=Red>trong r�ng c�y<color> d��i ch�n n�i.")
	AddEventItem(18)
	Msg2Player("Nh�n nhi�m v� c�a Di�u �n Nga Mi ph�i, nh�n ���c n�a m�nh g��ng ��ng. ")
	SetTask(1,10*256+20)
	AddNote("G�p ni c� Di�u �n � ch�nh �i�n (273, 311) , ti�p nh�n <color=Red>nhi�m v� g��ng ��ng<color>. Nh�n n�a m�nh g��ng ��ng. ")
end;

function L10_get_no()
end;

function L10_prise()
	SetRank(14)
	SetTask(1,20*256)
--	AddMagic(77)
--	AddMagic(79)
	add_em(20)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng b�n! B�n ���c th�ng l�m V� Y Ni, h�c ���c Nga Mi ki�m ph�p, Nga Mi ch��ng ph�p. ")
	AddNote("Quay v� Nga Mi ph�i, ph�c m�nh Di�u �n, ho�n th�nh nhi�m v� g��ng ��ng. ")
end;
