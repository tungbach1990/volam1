--ϴ���ܵ����ɮ�����ڲ�ר�ð棩
-- By: Dan_Deng(2003-08-29)
-- Update: Dan_Deng(2003-12-10)

function main()
	Say("Ng��i mu�n t�y t�y �? ���c! L�i ��m l�ng cho ta tr��c �i! C� bi�t c�ch l�m kh�ng v�y?",2,"��y l� 10 v�n l��ng, xin ��i s� nh�n cho. /pay_yes","V�y th�i �i/rollback_no")
end;

function pay_yes()
	if (GetCash() >= 100000) then
		Pay(100000)
		i = HaveMagic(210)		-- �Ṧ�������
		j = HaveMagic(400)		-- ���ٸ���ƶ���������
		n = RollbackSkill()		-- ������ܲ��������м��ܵ㣨�����Ṧ�����⼼�ܣ�
		x = 0
		if (i ~= -1) then x = x + i end		-- �������ж����ų���δѧ���Ṧ���˷���-1�Ӷ����µ�������������
		if (j ~= -1) then x = x + j end
		rollback_point = n - x			-- �Ѽ��ܵ㵱�����е������������ȿ۳��Ṧ��
		AddMagicPoint(rollback_point)
		if (i ~= -1) then AddMagic(210,i) end			-- ���ѧ���Ṧ��ӻ�ԭ�еȼ�
		if (j ~= -1) then AddMagic(400,j) end			-- ���ѧ�����ٸ���ƶ��ͬ������
		if (GetTask(13) > 256) then		-- ���ñ�ʯϴ�ĵ�
			Msg2Player("D�ng 3 vi�n Th�y Tinh ti�n h�nh t�y �i�m k� n�ng. B�n n�n v� nh� ngh� m�t l�t!")
			Say("D�ng 3 vi�n Th�y Tinh ti�n h�nh t�y �i�m k� n�ng. B�n n�n v� nh� ngh� m�t l�t!",1,"���c. /KickOutSelf")
		else
			Msg2Player("D�ng 3 vi�n Th�y Tinh ti�n h�nh t�y �i�m k� n�ng. Nh�ng �i�m k� n�ng b� m�t �i 3 �i�m. B�n n�n v� nh� ngh� m�t l�t!")
			Say("D�ng 3 vi�n Th�y Tinh ti�n h�nh t�y �i�m k� n�ng. Nh�ng �i�m k� n�ng b� m�t �i 3 �i�m. B�n n�n v� nh� ngh� m�t l�t!",1,"���c. /KickOutSelf")
		end
	else
		Talk(1,"","��y l� th�nh � c�a ng��i sao?Nh� th� th� ng��i quay v� �i! ")
	end
end

function no()
end
