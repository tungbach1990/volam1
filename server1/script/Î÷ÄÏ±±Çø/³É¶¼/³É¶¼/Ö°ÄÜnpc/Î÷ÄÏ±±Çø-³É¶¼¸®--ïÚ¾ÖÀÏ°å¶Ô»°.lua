--description: ���ϱ����ɶ����ھ��ϰ� 
--author: yuanlan	
--date: 2003/3/5
-- Update: Dan_Deng(2003-08-12)
Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	Say("M�t ki�m d�c ngang tr�i ��t! Ch�a c� ai ��i th�! Ng��i ��n c� vi�c g�?",3,"Ta ��n l�m nhi�m v� ph� tuy�n/branch_branchlengqiang","Ta ��n l�m nhi�m v� c�p 40 c�a Nga My Ph�i/emei_fourtytask","Kh�ng c� g�! Ng��ng m� n�n ��n xem th�i!/no")
end;

function branch_branchlengqiang()
Uworld1055 = nt_getTask(1055)
	if ( Uworld1055 >= 60 and Uworld1055 <= 120 ) then
			branch_lengqiang()
	else
		Talk(1,"","Ai c�ng t��ng ngh� B�o ti�u l� sung s��ng! Th�t s� m�i l�n ra �i ��u kh�ng d�m h�n tr��c ng�y v�!")
	end
end

function emei_fourtytask()
	UTask_em = GetTask(1);
	if (UTask_em == 40*256+40) then 							--������40������
		Talk(6, "", "Nghe n�i qu� Ti�u C�c c� m�t b�c 'ph� dung c�m k� ��'c�a T�ng Huy T�ng, ta mu�n mua, xin h�i bao nhi�u ti�n?", "Kh�u kh� l�n nh�! Ng��i bi�t gi� c� c�a b�c tranh �� kh�ng? Bao nhi�u ti�n c�ng kh�ng b�n ��u!", "C�c ng��i v�n chuy�n h�ng h�a c�n g� b�c tranh ��? Th�i �� cho ta �i, c�n �i�u ki�n g� c� n�i th�ng ra!", "Ng��i r�t kh�ng kh�i! ���c! N�u c� th� t�m ba m�n �� th� ta s� d�ng hai tay b�c tranh 'Ph� Dung C�m K� ��' cho.", "Ba m�n g� v�y?", "<color=Red>Linh X� H��ng Nang<color>,<color=Red> �ng T�nh H� Th�n ph�<color> v� <color=Red>B�ch T� Gi�i Ch�<color>, to�n l� nh�ng th� mang s� may m�n b�o v� vi�c l�m �n c�a ti�u c�c, nh�ng m� kh� t�m l�m ��!")
		SetTask(1, 40*256+50)
		SetTask(29,0)				-- ��ʼ������֮ǰ������
		AddNote("��i tho�i v�i �ng ch� Ti�u C�c, ti�p nh�n nhi�m v�, v�o th�nh t�m Linh X� H��ng Nang, �ng T�nh H� Th�n ph� v� B�ch T� Gi�i ch�.")
		Msg2Player("Ch� ti�u c�c y�u c�u b�n t�m Linh X� H��ng Nang, �ng T�nh H� Th�n ph� v� B�ch T� Gi�i Ch� �� ��i l�y 'Ph� Dung C�m K� ��'")
	elseif ((UTask_em == 40*256+60) and (HaveItem(21) == 0)) then		-- ���߶�ʧ�Ĵ���
		AddEventItem(21)
		Talk(1,"","Ta m�i v�a �em tranh ra, ng��i ch�y �i ��u v�y? May m� ta gi� l�i h�a!")
	elseif (UTask_em == 40*256+50) then	-- ������40��������
		if (HaveItem(166)== 1  and  HaveItem(167)== 1  and  HaveItem(168)== 1) then
			Talk(1,"","Ng��i trong giang h� ch� t�n �i ��u, ban ��u ta ch� mu�n ng��i th�y kh� �� n�n l�ng, kh�ng ng� ng��i �� t�m �� ba m�n. T�t! Ta giao 'Ph� Dung C�m K� ��' cho ng��i ��y!")
			DelItem(166)
			DelItem(167)
			DelItem(168) 
			AddEventItem(21)
			Msg2Player("���c 'Ph� Dung C�m K� ��'.")
			SetTask(1, 40*256+60)
			SetTask(29,0)
			AddNote("giao Linh X� H��ng Nang, �ng T�nh H� Th�n ph� v� B�ch T� Gi�i Ch� ��i l�y 'Ph� Dung C�m K� ��' c�a �ng ch� ti�u c�c.")
		else									--û��������������
			Talk(1,"","T�m �� <color=Red>Linh X� H��ng Nang<color>, <color=Red>�ng T�nh H� Th�n ph� <color> v� <color=Red>B�ch T� Gi�i Ch�<color> �i m�i t�nh ti�p.")
		end
	else
		Talk(1,"","Ti�u s� c�a ti�u c�c ch�ng ta ai c�ng v� ngh� cao c��ng, ��n ��t h�ng nh�n ���c n�u ai d�m ngang nhi�n ��n c��p th� kh�ng bi�t l��ng s�c t� n�o!")
	end
end

function no()
end
