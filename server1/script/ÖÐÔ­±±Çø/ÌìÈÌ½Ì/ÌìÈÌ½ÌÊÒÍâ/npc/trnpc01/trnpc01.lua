--description: ���̵̽��ӡ��������������̼�����������
--author: yuanlan	
--date: 2003/5/17
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-14)

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_tr = GetTask(4)
	UTask_gb = GetTask(8)
	UTask_world30 = GetByte(GetTask(30),1)
	if (UTask_world30 == 0) and (GetLevel() >= 10) and (GetFaction() ~= "tianren") then		-- ����������Ҫ��10�����ϣ�
--		DelItem(50)						--��ֹ�ؽ��������Ҽ����������
		Say("Tr�n <color=Red>Hoa S�n<color> c� gi�u m�t thanh <color=Red>V� V��ng Ki�m<color>, ai l�y ���c thanh ki�m �y cho b�n gi�o s� ���c tr�ng th��ng!", 2, "�i l�y Thanh ki�m /get_yes", "Kh�ng th�ch l�m!/get_no")
	elseif ((UTask_world30 == 5) and (HaveItem(50) == 1)) then					--��������
		world30_prise()
	elseif ((UTask_world30 > 0) and (UTask_world30 < 10)) then
		Talk(1,"","<color=Red>V� V��ng Ki�m<color> ���c gi�u tr�n <color=Red>Hoa S�n<color>, t� ��y ��n Hoa S�n xa x�i hi�m tr�, ng��i ph�i c�n th�n!")
	elseif (UTask_world30 == 10) then		-- ��ǰ����������ת������ֵ
		Utask_world30 = SetByte(GetTask(30),1,127)
		SetTask(30,Uworld30)
		if (GetFaction() == "tianren") then
			Talk(1,"","C�ng lao ng��i t�m ���c V� V��ng Ki�m, b�n gi�o s� ghi nh�, s� kh�ng b�c ��i ng��i!")
		else
			Talk(1,"","V� c�ng lao ng��i l�p cho b�n gi�o, b�n gi�o nh�n ng��i l�m �� t�!")
		end
	elseif (UTask_tr == 70*256) and (GetFaction() ~= "tianren") then							--�Ѿ���ʦ
		Talk(1,"","Ng��i mu�n �i v� ph��ng Nam �? Cao th� v� l�m Trung Nguy�n nhi�u v� s�, h�y suy ngh� k� tr��c khi �i.")
	else
		Talk(1,"","Ng��i bi�t kh�ng? Phong ���ng ���ng Ch� ch�nh l� Th�t c�ng ch�a c�a ���ng kim Ho�ng �� ��i Kim, ch�ng nh�ng xinh ��p m� v� ngh� c�ng cao c��ng.")
	end
end;

function get_yes()
	Talk(1,"","T� ��y ��n Hoa S�n xa x�i hi�m tr�, ng��i c� th� ��n <color=Red>Bi�n Kinh<color>, �i xa phu ��n <color=Red>Ph��ng T��ng<color>g�n Hoa S�n, c�ng c� th� nh� <color=Red>Nh�t Nguy�t ��n Ch� Ch� � H�p T�t<color> c�a b�n gi�o ��a ng��i �i.")
	SetTask(30, SetByte(GetTask(30),1,5))
	AddNote("Nh�n nhi�m v�: �i Hoa s�n t�m V� V��ng Ki�m. ")
	Msg2Player("Nh�n nhi�m v�: �i Hoa s�n t�m V� V��ng Ki�m. ")
end;

function get_no()
	Talk(1,"","L�c n�o c�ng c� ng��i mu�n l�y V� V��ng Ki�m �� ���c tr�ng th��ng.")
end;

function world30_prise()
	DelItem(50)
	i = ReturnRepute(15,19,6)		-- ȱʡ����15���������ĵȼ�19����ÿ���ݼ�6%
	Uworld30 = SetByte(GetTask(30),1,127)
	AddRepute(i)
	SetTask(30,Uworld30)
	Earn(500)
	Talk(1,"","V� c�ng lao ng��i l�p cho b�n gi�o, b�n gi�o nh�n ng��i l�m �� t�!")
	AddNote("Quay l�i Thi�n Nh�n Gi�o, ��a V� V��ng Ki�m cho Thi�n Nh�n T� S�, tr� th�nh �� t�, ���c th��ng 500 l��ng. ")
	Msg2Player("Quay l�i Thi�n Nh�n Gi�o, ��a V� V��ng Ki�m cho Thi�n Nh�n T� S�, ho�n th�nh nhi�m v�. T� th�nh �� t� c�a Thi�n Nh�n Gi�o, ���c th��ng 500 l��ng, danh v�ng ���c n�ng cao. "..i.."�i�m.")
end;

function enroll_prise()
	SetFaction("tianren")    				--��Ҽ������̽�
	SetCamp(2)
	SetCurCamp(2)
	AddMagic(135)
	SetRank(55)						--���óƺ�
	SetRevPos(49, 28)  					--����������
	SetTask(4, 10*256)
	Msg2Player("Hoan ngh�nh gia nh�p Thi�n Nh�n Gi�o, tr� th�nh S�t Th�, h�c ���c v� c�ng T�n D��ng Nh� Huy�t. ")
	AddNote("Gia nh�p Thi�n Nh�n Gi�o, tr� th�nh S�t Th�, h�c ���c v� c�ng T�n D��ng Nh� Huy�t. ")
end;

function enroll_no()
end;
