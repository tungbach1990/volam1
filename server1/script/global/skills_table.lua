--  skills_table.lua
--     By: Dan_Deng(2004-05-16)
--  ��ά���������ɡ����ȼ������ܱ�
-- Update: Dan_Deng(2004-07-05) ����Ͷ�㷽ʽ��90�������ر���������ӵ�д˼��ܣ��򱣴漼��ID��ɾ�����ڼӼ���ʱ�ٵ�������

function check_update()
	-- ������ģʽ�����״̬
	if (GetTask(137) >= 20 or GetTripMode() == 2) then
		return 0
	else
		SetTask(57,GetGameTime())		-- ��ס���ܸ��º��һ������ʱ�䣬��������72Сʱ�Ժ��������ϴ�赺
		rollback_prop()				-- ����Ǳ�ܵ㣨2004-07-13��
		skills_update()
		UpdateSkill()
		return 1
	end
end

function skills_update()
	SetTaskTemp(20,0)				-- ʹ��ǰ��λ����֤���ܸ���
	SetTaskTemp(21,0)
	Player_Faction = check_faction()
	if (Player_Faction == 3) then				-- ������
		update_tw()
	elseif (Player_Faction == 7) then		-- ������
		update_sl()
	elseif (Player_Faction == 2) then		-- ����
		update_tm()
	elseif (Player_Faction == 10) then		-- �嶾
		update_wu()
	elseif (Player_Faction == 1) then		-- ����
		update_em()
	elseif (Player_Faction == 6) then		-- ����
		update_cy()
	elseif (Player_Faction == 4) then		-- ����
		update_tr()
	elseif (Player_Faction == 8) then		-- ؤ��
		update_gb()
	elseif (Player_Faction == 5) then		-- �䵱
		update_wd()
	elseif (Player_Faction == 9) then		-- ����
		update_kl()
	else									-- ����
		SetTask(137,20)
		return 1
	end
	-- �����ܵ����� = (�ȼ�-1) + �Ӽ������� + �Ӽ��ܵ��� - ����δ�������	- ����������¶�������ȼ� - �۵�ϴ��Ӱ��
--	Say("���ܸ����Ѿ���ɣ���ע������Ϊ�������ܷ��似�ܵ㡣",0)
	Msg2Player("Ph�c h�i k� n�ng �� ho�n t�t!  Xin h�y ph�n ph�i l�i �i�m! ")
	xMagic = 0
	if HaveMagic(397) >= 0 then			-- ������¶�������ܣ��۳���Ӧ������Ҫ��ֹ����-1��
		xMagic = HaveMagic(397)
	end
--	if (GetTask(13) >= 1) and (GetTask(13) < 256) then		-- �����Ƿ�۵�ϴ�㡣
--		xMagic = xMagic + 3
--		Msg2Player("������������ɮ���׽�ϴ�裬��������һ�����ˡ��������������ˮ�������������޸�����ľ�����")
--	end
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) + GetTask(700) - GetMagicPoint() - xMagic - 1
	Ttask21 = GetTaskTemp(21)
	if (Ttask21 ~= MagicPoint_total + GetMagicPoint()) then		-- ��һ�µ�Ҫдlog
		WriteLog(date("%Hgi�%Mph�t%Sgi�y")..": t�i kho�n'"..GetAccount().."'nh�n v�t'"..GetName().."'Ph�c h�i k� n�ng �� lui v� k� l�c ban ��u: ��ng c�p"..GetLevel()..", �i�m k� n�ng ban ��u"..Ttask21..", ���c s�a l�i"..MagicPoint_total+GetMagicPoint().."�i�m (Bao g�m nhi�m v� c�ng"..GetByte(GetTask(86),2).."�i�m, ��o c� c�ng"..GetTask(80).."�i�m) .")
	end
	AddMagicPoint(MagicPoint_total)
	SetTaskTemp(20,0)				-- ϴ����ɣ����¸�λ
	SetTaskTemp(21,0)
end

function check_faction()
	if (GetTask(7) >= 10*256) and (GetTask(7) ~= 75*256) then		-- ���ֻ�����ɳ�ʦ
		SetTask(137,7)
		SetLastFactionNumber(0)
		return 7
	elseif (GetTask(3) >= 10*256) and (GetTask(3) ~= 75*256) then			-- ����������ɳ�ʦ
		SetTask(137,3)
		SetLastFactionNumber(1)
		return 3
	elseif (GetTask(10) >= 10*256) and (GetTask(10) ~= 75*256) then	-- �嶾������ɳ�ʦ
		SetTask(137,10)
		SetLastFactionNumber(3)
		return 10
	elseif (GetTask(2) >= 10*256) and (GetTask(2) ~= 75*256) then		-- ���Ż�����ɳ�ʦ
		SetTask(137,2)
		SetLastFactionNumber(2)
		return 2
	elseif (GetTask(6) >= 10*256) and (GetTask(6) ~= 75*256) then		-- ���̻�����ɳ�ʦ
		SetTask(137,6)
		SetLastFactionNumber(5)
		return 6
	elseif (GetTask(1) >= 10*256) and (GetTask(1) ~= 75*256) then		-- ���һ�����ɳ�ʦ
		SetTask(137,1)
		SetLastFactionNumber(4)
		return 1
	elseif (GetTask(8) >= 10*256) and (GetTask(8) ~= 75*256) then		-- ؤ�������ɳ�ʦ
		SetTask(137,8)
		SetLastFactionNumber(6)
		return 8
	elseif (GetTask(4) >= 10*256) and (GetTask(4) ~= 75*256) then		-- ���̻�����ɳ�ʦ
		SetTask(137,4)
		SetLastFactionNumber(7)
		return 4
	elseif (GetTask(9) >= 10*256) and (GetTask(9) ~= 75*256) then		-- ���ػ�����ɳ�ʦ
		SetTask(137,9)
		SetLastFactionNumber(9)
		return 9
	elseif (GetTask(5) >= 10*256) and (GetTask(5) ~= 75*256) then		-- �䵱������ɳ�ʦ
		SetTask(137,5)
		SetLastFactionNumber(8)
		return 5
	else																					-- �����ģ�����Ҫ����
		SetLastFactionNumber(-1)
		return 20
	end
end;

function add_misc(lvl)		-- �ӹ������ܣ���������λ����ӣ�
	if (GetBit(lvl,1) == 1) and (HaveMagic(210) == -1) then			-- ��1��λ���Ṧ
		AddMagic(210,1)
	end
	if (GetBit(lvl,2) == 1) and (HaveMagic(400) == -1) then			-- ��2��λ���ٸ���ƶ
		AddMagic(400,1)
	end
	if (GetBit(lvl,3) == 1) and (HaveMagic(397) == -1) then			-- ��3��λ����¶����
		AddMagic(397)
	end
end

function update_tw()			-- �ȸ�������ȼ�ɾ�������¼��뼼�ܣ�Ȼ�󲹻ؼ��ܵ�
	UTask = GetTask(3)
	if (GetTask(121) == 255) then		-- ѧ����90������
		the_lvl = 90
-- �����Ļ�ʦ������Ҫ�ٶ����жϣ���Ϊԭ60�����ܱ���Ϊ50���������н����֡�����60���������ѳ�ʦ��������ʦ��
	elseif (HaveMagic(42) >= 0) and (GetTask(3) >= 70*256) and (GetTask(3) ~= 75*256) and (GetLevel() >= 60) then		-- �����ɾ�ѧ����
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- �����50������
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- �����40������
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- �����30������
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- �����20������
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- �����10������
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- ������
		the_lvl = 10
	end
	del_all_skill()
	add_tw(the_lvl)			-- �ӻ�Ӧѧ��ļ���
	SetTask(137,23)
end

function update_gb()			-- �ȸ�������ȼ�ɾ�������¼��뼼�ܣ�Ȼ�󲹻ؼ��ܵ�
	UTask = GetTask(8)
	if (GetTask(128) == 255) then		-- ѧ����90������
		the_lvl = 90
-- ؤ��Ļ�ʦ������Ҫ�ٶ����жϣ���Ϊԭ60�����ܱ���Ϊ50���������п����лڡ�����60���������ѳ�ʦ��������ʦ��
	elseif (HaveMagic(128) >= 0) and (GetTask(8) >= 70*256) and (GetTask(8) ~= 75*256) and (GetLevel() >= 60) then		-- �����ɾ�ѧ����
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- �����50������
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- �����40������
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- �����30������
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- �����20������
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- �����10������
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- ������
		the_lvl = 10
	end
	del_all_skill()
	add_gb(the_lvl)			-- �ӻ�Ӧѧ��ļ���
	SetTask(137,28)
end

function update_wd()			-- �ȸ�������ȼ�ɾ�������¼��뼼�ܣ�Ȼ�󲹻ؼ��ܵ�
	UTask = GetTask(5)
	if (GetTask(129) == 255) then		-- ѧ����90������
		the_lvl = 90
	elseif (HaveMagic(166) >= 0) then		-- �����ɾ�ѧ����
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- �����50������
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- �����40������
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- �����30������
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- �����20������
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- �����10������
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- ������
		the_lvl = 10
	end
	del_all_skill()
	add_wd(the_lvl)			-- �ӻ�Ӧѧ��ļ���
	SetTask(137,25)
end

function update_em()			-- �ȸ�������ȼ�ɾ�������¼��뼼�ܣ�Ȼ�󲹻ؼ��ܵ�
	UTask = GetTask(1)
	if (GetTask(125) == 255) then		-- ѧ����90������
		the_lvl = 90
	elseif (HaveMagic(252) >= 0) then		-- �����ɾ�ѧ����
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- �����50������
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- �����40������
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- �����30������
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- �����20������
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- �����10������
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- ������
		the_lvl = 10
	end
	del_all_skill()
	add_em(the_lvl)			-- �ӻ�Ӧѧ��ļ���
	SetTask(137,21)
end

function update_sl()			-- �ȸ�������ȼ�ɾ�������¼��뼼�ܣ�Ȼ�󲹻ؼ��ܵ�
	UTask = GetTask(7)
	if (GetTask(122) == 255) then		-- ѧ����90������
		the_lvl = 90
	elseif (HaveMagic(21) >= 0) then		-- �����ɾ�ѧ����
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- �����50������
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- �����40������
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- �����30������
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- �����20������
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- �����10������
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- ������
		the_lvl = 10
	end
	del_all_skill()
	add_sl(the_lvl)			-- �ӻ�Ӧѧ��ļ���
	SetTask(137,27)
end

function update_wu()			-- �ȸ�������ȼ�ɾ�������¼��뼼�ܣ�Ȼ�󲹻ؼ��ܵ�
	UTask = GetTask(10)
	if (GetTask(124) == 255) then		-- ѧ����90������
		the_lvl = 90
	elseif (HaveMagic(75) >= 0) then		-- �����ɾ�ѧ����
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- �����50������
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- �����40������
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- �����30������
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- �����20������
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- �����10������
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- ������
		the_lvl = 10
	end
	del_all_skill()
	add_wu(the_lvl)			-- �ӻ�Ӧѧ��ļ���
	SetTask(137,30)
end

function update_cy()			-- �ȸ�������ȼ�ɾ�������¼��뼼�ܣ�Ȼ�󲹻ؼ��ܵ�
	UTask = GetTask(6)
	if (GetTask(126) == 255) then		-- ѧ����90������
		the_lvl = 90
	elseif (HaveMagic(111) >= 0) then		-- �����ɾ�ѧ����
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- �����50������
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- �����40������
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- �����30������
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- �����20������
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- �����10������
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- ������
		the_lvl = 10
	end
	del_all_skill()
	add_cy(the_lvl)			-- �ӻ�Ӧѧ��ļ���
	SetTask(137,26)
end

function update_tm()			-- �ȸ�������ȼ�ɾ�������¼��뼼�ܣ�Ȼ�󲹻ؼ��ܵ�
	UTask = GetTask(2)
	if (GetTask(123) == 255) then		-- ѧ����90������
		the_lvl = 90
	elseif (HaveMagic(249) >= 0) then		-- �����ɾ�ѧ����
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- �����50������
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- �����40������
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- �����30������
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- �����20������
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- �����10������
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- ������
		the_lvl = 10
	end
	del_all_skill()
	add_tm(the_lvl)			-- �ӻ�Ӧѧ��ļ���
	SetTask(137,22)
end

function update_tr()			-- �ȸ�������ȼ�ɾ�������¼��뼼�ܣ�Ȼ�󲹻ؼ��ܵ�
	UTask = GetTask(4)
	if (GetTask(127) == 255) then		-- ѧ����90������
		the_lvl = 90
	elseif (HaveMagic(150) >= 0) then		-- �����ɾ�ѧ����
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- �����50������
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- �����40������
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- �����30������
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- �����20������
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- �����10������
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- ������
		the_lvl = 10
	end
	del_all_skill()
	add_tr(the_lvl)			-- �ӻ�Ӧѧ��ļ���
	SetTask(137,24)
end

function update_kl()			-- ˢ�¼���
	UTask = GetTask(9)
	if (GetTask(130) == 255) then		-- ѧ����90������
		the_lvl = 90
	elseif (HaveMagic(182) >= 0) then		-- �����ɾ�ѧ����
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- �����50������
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- �����40������
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- �����30������
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- �����20������
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- �����10������
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- ������
		the_lvl = 10
	end
	del_all_skill()
	add_kl(the_lvl)			-- �ӻ�Ӧѧ��ļ���
	SetTask(137,29)
end

function add_tw(lvl)			-- ��������ȼ�����Ӧ����������
	AddMagic(210,1)
	if (lvl >= 10) then			-- �Ѿ����ţ������ż��ܣ�
		if (HaveMagic(34) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(34)		--����ն[34]  �����ţ�
		end
		if (HaveMagic(30) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(30)		--�ط�����[30]�����ţ�
		end
		if (HaveMagic(29) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(29)		--ն����[29]  �����ţ�
		end
	end
	if (lvl >= 20) then		-- 10�����񣨼�10�����ܣ�
		if (HaveMagic(26) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(26)		--��������[26]��10����
		end
		if (HaveMagic(23) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(23)		--����ǹ��[23]��10����
		end
		if (HaveMagic(24) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(24)		--��������[24]��10����
		end
	end
	if (lvl >= 30) then		-- 20�����񣨼�20�����ܣ�
		if (HaveMagic(33) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(33)		--���ľ�[33]  ��20����
		end
	end
	if (lvl >= 40) then		-- 30�����񣨼�30�����ܣ�
		if (HaveMagic(37) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(37)		--�÷�ն  [37]��30����
		end
		if (HaveMagic(35) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(35)		--��������[35]��30����
		end
		if (HaveMagic(31) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(31)		--���ƾ�  [31]��30����
		end
	end
	if (lvl >= 50) then		-- 40�����񣨼�40�����ܣ�
		if (HaveMagic(40) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(40)		--�ϻ��  [40]��40����
		end
	end
	if (lvl >= 60) then		-- 50�����񣨼�50�����ܣ�
		if (HaveMagic(42) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(42)		--������  [42]��50����
		end
	end
	if (lvl >= 70) then		-- ��ʦ���񣨼����ɾ�ѧ��
		if (HaveMagic(32) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(32)		--����ն  [32] ��60����
		end
		if (HaveMagic(36) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(36)		--����ս��[36]�����ɣ�
		end
		if (HaveMagic(41) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(41)		--Ѫս�˷�[41] ��60����
		end
		if (HaveMagic(324) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(324)		--������  [324]��60����
		end
	end
	if (lvl >= 90) then		-- 90�����񣨼�90�����ܣ�
		if (HaveMagic(322) <= 0) then AddMagic(322,20) end		--����ն  [322]��90����
		if (HaveMagic(323) <= 0) then AddMagic(323,20) end		--׷������[323]��90����
		if (HaveMagic(325) <= 0) then AddMagic(325,20) end		--׷���  [325]��90����
		if (HaveMagic(708) <= 0) then AddMagic(708,20) end		--����120����
		if (HaveMagic(1058) <= 0) then AddMagic(1058,20) end		--����150����
		if (HaveMagic(1059) <= 0) then AddMagic(1059,20) end		--����150����
		if (HaveMagic(1060) <= 0) then AddMagic(1060,20) end		--����150����
		--AddItem(6,1,2841,1,0,0)
	end
end

function add_sl(lvl)			-- ��������ȼ�����Ӧ�����ּ���
	AddMagic(210,1)
	if (lvl >= 10) then			-- �Ѿ����ţ������ż��ܣ�
		if (HaveMagic(14) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(14)		-- ��������[14]
		end
		if (HaveMagic(10) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(10)			--��շ�ħ[10]�����ţ�
		end
	end
	if (lvl >= 20) then		-- 10�����񣨼�10�����ܣ�
		if (HaveMagic(8) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(8)			-- ����ȭ��[8]
		end
		if (HaveMagic(4) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(4)			--���ֹ���[4]��10��
		end
		if (HaveMagic(6) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(6)			--���ֵ���[6]��10����
		end
	end
	if (lvl >= 30) then		-- 20�����񣨼�20�����ܣ�
		if (HaveMagic(15) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(15)		--��������[15]��20����
		end
	end
	if (lvl >= 40) then		-- 30�����񣨼�30�����ܣ�
		if (HaveMagic(16) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(16)		--�޺���[16]��30����
		end
	end
	if (lvl >= 50) then		-- 40�����񣨼�40�����ܣ�
		if (HaveMagic(20) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(20)		--ʨ�Ӻ� [20]��40����
		end
	end
	if (lvl >= 60) then		-- 50�����񣨼�50�����ܣ�
		if (HaveMagic(271) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(271)		-- ��צ��ץ[271]
		end
		if (HaveMagic(11) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(11)		--��ɨ���� [11]��50����
		end
		if (HaveMagic(19) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(19)		--Ħڭ���� [19]��50����
		end
	end
	if (lvl >= 70) then		-- ��ʦ���񣨼����ɾ�ѧ��
		if (HaveMagic(273) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(273)		--����ǧҶ[273]
		end
		if (HaveMagic(21) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(21)		--�׽[21]��60����
		end
	end
	if (lvl >= 90) then		-- 90�����񣨼�90�����ܣ�
		if (HaveMagic(318) <= 0) then AddMagic(318,20) end		--��Ħ�ɽ�[318]
		if (HaveMagic(319) <= 0) then AddMagic(319,20) end		--��ɨǧ��[319]��90����
		if (HaveMagic(321) <= 0) then AddMagic(321,20) end		--����ն  [321]��90����
		if (HaveMagic(709) <= 0) then AddMagic(709,20) end		--����120����
		if (HaveMagic(1055) <= 0) then AddMagic(1055,20) end		--����150����
		if (HaveMagic(1056) <= 0) then AddMagic(1056,20) end		--����150����
		if (HaveMagic(1057) <= 0) then AddMagic(1057,20) end		--����150����
		--AddItem(6,1,2841,1,0,0)
	end
end

function add_tm(lvl)			-- ��������ȼ�����Ӧ�����ż���
	AddMagic(210,1)
	if (lvl >= 10) then			-- �Ѿ����ţ������ż��ܣ�
		if (HaveMagic(45) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(45)		--������[45 ]�����ţ�
		end
	end
	if (lvl >= 20) then		-- 10�����񣨼�10�����ܣ�
		if (HaveMagic(43) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(43)		--���Ű���[43 ]��10����
		end
		if (HaveMagic(347) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(347)		--�����[347]��10����
		end
	end
	if (lvl >= 30) then		-- 20�����񣨼�20�����ܣ�
		if (HaveMagic(303) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(303)		--���̹�  [303]��20����
		end
	end
	if (lvl >= 40) then		-- 30�����񣨼�30�����ܣ�
		if (HaveMagic(50) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(50)		--׷�ļ�  [50 ]��30����
		end
		if (HaveMagic(54) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(54)		--���컨��[54 ]��30����
		end
		if (HaveMagic(47) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(47)		--�����  [47 ]��30����
		end
		if (HaveMagic(343) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(343)		--���Ĵ�  [343]��30����
		end
	end
	if (lvl >= 50) then		-- 40�����񣨼�40�����ܣ�
		if (HaveMagic(345) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(345)		--������  [345]��40����
		end
	end
	if (lvl >= 60) then		-- 50�����񣨼�50�����ܣ�
		if (HaveMagic(349) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(349)		--�׻���[349]��50����
		end
	end
	if (lvl >= 70) then		-- ��ʦ���񣨼����ɾ�ѧ��
		if (HaveMagic(249) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(249)		--С��ɵ�[249]��60����
		end
		if (HaveMagic(48) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(48)		--����  [48 ]�����ɣ�
		end
		if (HaveMagic(58) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(58)		--���޵���[58 ]��60����
		end
		if (HaveMagic(341) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(341)		--ɢ����  [341]��60����
		end
	end
	if (lvl >= 90) then		-- 90�����񣨼�90�����ܣ�
		if (HaveMagic(339) <= 0) then AddMagic(339,20) end		--�����Ӱ[339]��90����
		if (HaveMagic(302) <= 0) then AddMagic(302,20) end		--�����滨[302]��90����
		if (HaveMagic(342) <= 0) then AddMagic(342,20) end		--�Ź�����[342]��90����
---		if (GetTaskTemp(20) == 351) then					-- ��������иü�����ӻأ�����90����δɾ
---			if (HaveMagic(351) == -1) then		-- ����û�м��ܵĲŸ�����
---				AddMagic(351)		--�һ���  [351]��90����
---			end
---		end
		if (HaveMagic(351) <= 0) then AddMagic(351) end		--90���丨������
		if (HaveMagic(710) <= 0) then AddMagic(710,20) end		--����120����
		if (HaveMagic(1069) <= 0) then AddMagic(1069,20) end		--����150����
		if (HaveMagic(1070) <= 0) then AddMagic(1070,20) end		--����150����
		if (HaveMagic(1071) <= 0) then AddMagic(1071,20) end		--����150����
		if (HaveMagic(1110) <= 0) then AddMagic(1110) end		--����150����
		--AddItem(6,1,2841,1,0,0)
	end
end

function add_wu(lvl)			-- ��������ȼ�����Ӧ���嶾����
	AddMagic(210,1)
	if (lvl >= 10) then			-- �Ѿ����ţ������ż��ܣ�
		if (HaveMagic(63) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(63)		--��ɰ��  [63]�����ţ�
		end
		if (HaveMagic(65) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(65)		--Ѫ����ɱ[65]�����ţ�
		end
	end
	if (lvl >= 20) then		-- 10�����񣨼�10�����ܣ�
		if (HaveMagic(62) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(62)		--�嶾�Ʒ�[62]��10����
		end
		if (HaveMagic(60) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(60)		--�嶾����[60]��10����
		end
		if (HaveMagic(67) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(67)		--�������[67]��10����
		end
	end
	if (lvl >= 30) then		-- 20�����񣨼�20�����ܣ�
		if (HaveMagic(70) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(70)		--����ʴ��[70]��20����
		end
		if (HaveMagic(66) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(66)		--����ҩ��[66]��20����
		end
	end
	if (lvl >= 40) then		-- 30�����񣨼�30�����ܣ�
		if (HaveMagic(68) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(68)		--��ڤ����[68 ]��30����
		end
		if (HaveMagic(384) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(384)		--�ٶ�����[384]��30����
		end
		if (HaveMagic(64) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(64)		--��������[64 ]��30����
		end
		if (HaveMagic(69) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(69)		--���ι�  [69]��30����
		end
	end
	if (lvl >= 50) then		-- 40�����񣨼�40�����ܣ�
		if (HaveMagic(356) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(356)		--�����Ƽ�  [356]��40����
		end
		if (HaveMagic(73) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(73)		--���ʴ��[73 ]��40����
		end
	end
	if (lvl >= 60) then		-- 50�����񣨼�50�����ܣ�
		if (HaveMagic(72) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(72)		--���Ķ���[72]��50����
		end
	end
	if (lvl >= 70) then		-- ��ʦ���񣨼����ɾ�ѧ��
		if (HaveMagic(71) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(71)		--���ɷ��[71 ]��60����
		end
		if (HaveMagic(75) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(75)		--�嶾�澭[75]�����ɣ�
		end
		if (HaveMagic(74) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(74)		--�����ڤ  [74 ]��60����
		end
	end
	if (lvl >= 90) then		-- 90�����񣨼�90�����ܣ�
		if (HaveMagic(353) <= 0) then AddMagic(353,20) end		--����ʴ��[353]��90����
		if (HaveMagic(355) <= 0) then AddMagic(355,20) end		--����ն  [355]��90����
---		if (GetTaskTemp(20) == 390) then					-- ��������иü�����ӻأ�����90����δɾ
---			if (HaveMagic(390) == -1) then		-- ����û�м��ܵĲŸ�����
---				AddMagic(390)		-- [390]��90����
---			end
---		end
		if (HaveMagic(390) <= 0) then AddMagic(390) end		--90���丨������
		if (HaveMagic(711) <= 0) then AddMagic(711,20) end		--����120����
		if (HaveMagic(1066) <= 0) then AddMagic(1066,20) end		--����150����
		if (HaveMagic(1067) <= 0) then AddMagic(1067,20) end		--����150����
		--AddItem(6,1,2841,1,0,0)
	end
end

function add_em(lvl)			-- ��������ȼ�����Ӧ�Ķ��Ҽ���
	AddMagic(210,1)
	if (lvl >= 10) then			-- �Ѿ����ţ������ż��ܣ�
		if (HaveMagic(85) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(85)		--һҶ֪��[85]�����ţ�
		end
		if (HaveMagic(80) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(80)		--Ʈѩ����[80]�����ţ�
		end
	end
	if (lvl >= 20) then		-- 10�����񣨼�10�����ܣ�
		if (HaveMagic(77) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(77)		--���ҽ���[77]��10����
		end
		if (HaveMagic(79) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(79)		--�����Ʒ�[79]��10����
		end
	end
	if (lvl >= 30) then		-- 20�����񣨼�20�����ܣ�
		if (HaveMagic(93) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(93)		--�Ⱥ��ն�[93]��20����
		end
	end
	if (lvl >= 40) then		-- 30�����񣨼�30�����ܣ�
		if (HaveMagic(385) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(385)		--�ƴ�����[385]��30����
		end
		if (HaveMagic(82) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(82)		--����ͬ��[82]��30����
		end
		if (HaveMagic(89) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(89)		--�ε�    [89]��30����
		end
	end
	if (lvl >= 50) then		-- 40�����񣨼�40�����ܣ�
		if (HaveMagic(86) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(86)		--��ˮ    [86 ]��40����
		end
	end
	if (lvl >= 60) then		-- 50�����񣨼�50�����ܣ�
		if (HaveMagic(92) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(92)		--���Ĵ���[92]��50����
		end
	end
	if (lvl >= 70) then		-- ��ʦ���񣨼����ɾ�ѧ��
		if (HaveMagic(88) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(88)		--���𲻾�[88]��60����
		end
		if (HaveMagic(252) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(252)		--���ޱ�[252]�����ɣ�
		end
		if (HaveMagic(91) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(91)		--�������[91]��60����
		end
		if (HaveMagic(282) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(282)		--������[282]��60����
		end
	end
	if (lvl >= 90) then		-- 90�����񣨼�90�����ܣ�
		if (HaveMagic(328) <= 0) then AddMagic(328,20) end		--������ѩ[328]��90����
		if (HaveMagic(380) <= 0) then AddMagic(380,20) end		--��˪��Ӱ[380]��90����
---		if (GetTaskTemp(20) == 332) then					-- ��������иü�����ӻأ�����90����δɾ
---			if (HaveMagic(332) == -1) then		-- ����û�м��ܵĲŸ�����
---				AddMagic(332)		--�ն�����[332]��90����
---			end
---		end
		if (HaveMagic(332) <= 0) then AddMagic(332) end		--90���丨������
		if (HaveMagic(712) <= 0) then AddMagic(712,20) end		--����120����
		if (HaveMagic(1061) <= 0) then AddMagic(1061,20) end		--����150����
		if (HaveMagic(1062) <= 0) then AddMagic(1062,20) end		--����150����
		if (HaveMagic(1114) <= 0) then AddMagic(1114,20) end		--����150����
		--AddItem(6,1,2841,1,0,0)
	end
end

function add_cy(lvl)			-- ��������ȼ�����Ӧ�Ĵ��̼���
	AddMagic(210,1)
	if (lvl >= 10) then			-- �Ѿ����ţ������ż��ܣ�
		if (HaveMagic(99) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(99)		--�绨ѩ��[99 ]�����ţ�
		end
		if (HaveMagic(102) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(102)		--����ѩ[102]�����ţ�
		end
	end
	if (lvl >= 20) then		-- 10�����񣨼�10�����ܣ�
		if (HaveMagic(95) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(95)		----���̵���[95 ]��10����
		end
		if (HaveMagic(97) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(97)		--����˫��[97 ]��10����
		end
	end
	if (lvl >= 30) then		-- 20�����񣨼�20�����ܣ�
		if (HaveMagic(269) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(269)		--����ٻӰ[269]��20����
		end
	end
	if (lvl >= 40) then		-- 30�����񣨼�30�����ܣ�
		if (HaveMagic(105) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(105)		--����滨[105]��30����
		end
		if (HaveMagic(113) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(113)		--����ɢѩ[113]��30����
		end
	end
	if (lvl >= 50) then		-- 40�����񣨼�40�����ܣ�
		if (HaveMagic(100) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(100)		--���庮��[100]��30����
		end
	end
	if (lvl >= 60) then		-- 50�����񣨼�50�����ܣ�
		if (HaveMagic(109) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(109)		--ѩӰ    [109]��40����
		end
	end
	if (lvl >= 70) then		-- ��ʦ���񣨼����ɾ�ѧ��
		if (HaveMagic(108) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(108)		--��Ұ����[108]��60����
		end
		if (HaveMagic(114) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(114)		--����ѩ��[114]�����ɣ�
		end
		if (HaveMagic(111) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(111)		--�̺�����[111]��60����
		end
	end
	if (lvl >= 90) then		-- 90�����񣨼�90�����ܣ�
		if (HaveMagic(336) <= 0) then AddMagic(336,20) end		--������Ӱ[336]��90����
		if (HaveMagic(337) <= 0) then AddMagic(337,20) end		--��������[337]��90����
		if (HaveMagic(713) <= 0) then AddMagic(713,20) end		--����120����
		if (HaveMagic(1063) <= 0) then AddMagic(1063,20) end		--����150����
		if (HaveMagic(1065) <= 0) then AddMagic(1065,20) end		--����150����
		--AddItem(6,1,2841,1,0,0)
	end
end

function add_tr(lvl)			-- ��������ȼ�����Ӧ�����̼���
	AddMagic(210,1)
	if (lvl >= 10) then			-- �Ѿ����ţ������ż��ܣ�
		if (HaveMagic(135) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(135)		--������Ѫ[135]�����ţ�
		end
		if (HaveMagic(145) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(145)		--��ָ����[145]�����ţ�
		end
	end
	if (lvl >= 20) then		-- 10�����񣨼�10�����ܣ�
		if (HaveMagic(132) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(132)		--����ì��[132]��10����
		end
		if (HaveMagic(131) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(131)		--���̵���[131]��10����
		end
		if (HaveMagic(136) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(136)		--�������[136]��10����
		end
	end
	if (lvl >= 30) then		-- 20�����񣨼�20�����ܣ�
		if (HaveMagic(137) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(137)		--��Ӱ�ɺ�[137]��20����
		end
	end
	if (lvl >= 40) then		-- 30�����񣨼�30�����ܣ�
		if (HaveMagic(141) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(141)		--�һ�����[141]��30����
		end
		if (HaveMagic(138) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(138)		--��ɽ�[138]��30����
		end
		if (HaveMagic(140) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(140)		--�ɺ��޼�[140]��30����
		end
	end
	if (lvl >= 50) then		-- 40�����񣨼�40�����ܣ�
		if (HaveMagic(364) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(364)		--�������[364]��40����
		end
	end
	if (lvl >= 60) then		-- 50�����񣨼�50�����ܣ�
		if (HaveMagic(143) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(143)		--��ħ���[143]��50����
		end
	end
	if (lvl >= 70) then		-- ��ʦ���񣨼����ɾ�ѧ��
		if (HaveMagic(142) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(142)		--͵�컻��[142]��60����
		end
		if (HaveMagic(150) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(150)		--��ħ����[150]�����ɣ�
		end
		if (HaveMagic(148) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(148)		--ħ����ɱ[148]��60����
		end
	end
	if (lvl >= 90) then		-- 90�����񣨼�90�����ܣ�
		if (HaveMagic(361) <= 0) then AddMagic(361,20) end		--������  [361]��90����
		if (HaveMagic(362) <= 0) then AddMagic(362,20) end		--��������[362]��90����
---		if (GetTaskTemp(20) == 391) then					-- ��������иü�����ӻأ�����90����δɾ
---			if (HaveMagic(391) == -1) then		-- ����û�м��ܵĲŸ�����
---				AddMagic(391)		-- [391]��90����
---			end
---		end
		if (HaveMagic(391) <= 0) then AddMagic(391) end		--90���丨������
		if (HaveMagic(715) <= 0) then AddMagic(715,20) end		--����120����
		if (HaveMagic(1075) <= 0) then AddMagic(1075,20) end		--����150����
		if (HaveMagic(1076) <= 0) then AddMagic(1076,20) end		--����150����
		--AddItem(6,1,2841,1,0,0)
	end
end

function add_gb(lvl)			-- ��������ȼ�����Ӧ��ؤ�＼��
	AddMagic(210,1)
	if (lvl >= 10) then			-- �Ѿ����ţ������ż��ܣ�
		if (HaveMagic(122) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(122)		--��������[122]�����ţ�
		end
		if (HaveMagic(119) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(119)		--�����в�[119]�����ţ�
		end
	end
	if (lvl >= 20) then		-- 10�����񣨼�10�����ܣ�
		if (HaveMagic(116) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(116)		--ؤ���Ʒ�[116]��10����
		end
		if (HaveMagic(115) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(115)		--ؤ�����[115]��10����
		end
	end
	if (lvl >= 30) then		-- 20�����񣨼�20�����ܣ�
		if (HaveMagic(129) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(129)		--����Ϊ��[129]��20����
		end
	end
	if (lvl >= 40) then		-- 30�����񣨼�30�����ܣ�
		if (HaveMagic(274) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(274)		--������[274]��30����
		end
		if (HaveMagic(124) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(124)		--����[124]��30����
		end
	end
	if (lvl >= 50) then		-- 40�����񣨼�40�����ܣ�
		if (HaveMagic(277) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(277)		--��������[277]��40����
		end
	end
	if (lvl >= 60) then		-- 50�����񣨼�50�����ܣ�
		if (HaveMagic(128) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(128)		--�����л�[128]��50����
		end
		if (HaveMagic(125) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(125)		--�����[125]��50����
		end
	end
	if (lvl >= 70) then		-- ��ʦ���񣨼����ɾ�ѧ��
		if (HaveMagic(130) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(130)		--�������[130]�����ɣ�
		end
		if (HaveMagic(360) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(360)		--��ң��[360]��60����
		end
	end
	if (lvl >= 90) then		-- 90�����񣨼�90�����ܣ�
		if (HaveMagic(357) <= 0) then AddMagic(357,20) end		--��������[357]��90����
		if (HaveMagic(359) <= 0) then AddMagic(359,20) end		--�����޹�[359]��90����
		if (HaveMagic(714) <= 0) then AddMagic(714,20) end		--����120����
		if (HaveMagic(1073) <= 0) then AddMagic(1073,20) end		--����150����
		if (HaveMagic(1074) <= 0) then AddMagic(1074,20) end		--����150����
		--AddItem(6,1,2841,1,0,0)
	end
end

function add_wd(lvl)			-- ��������ȼ�����Ӧ���䵱����
	AddMagic(210,1)
	if (lvl >= 10) then			-- �Ѿ����ţ������ż��ܣ�
		if (HaveMagic(153) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(153)		--ŭ��ָ  [153]�����ţ�
		end
		if (HaveMagic(155) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(155)		--�׺�����[155]�����ţ�
		end
	end
	if (lvl >= 20) then		-- 10�����񣨼�10�����ܣ�
		if (HaveMagic(152) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(152)		--�䵱ȭ��[152]��10����
		end
		if (HaveMagic(151) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(151)		--�䵱����[151]��10����
		end
	end
	if (lvl >= 30) then		-- 20�����񣨼�20�����ܣ�
		if (HaveMagic(159) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(159)		--������  [159]��30����
		end
	end
	if (lvl >= 40) then		-- 30�����񣨼�30�����ܣ�
		if (HaveMagic(164) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(164)		--��������[164]��30����
		end
		if (HaveMagic(158) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(158)		--���ɾ���[158]��30����
		end
	end
	if (lvl >= 50) then		-- 40�����񣨼�40�����ܣ�
		if (HaveMagic(160) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(160)		--������  [160]��40����
		end
	end
	if (lvl >= 60) then		-- 50�����񣨼�50�����ܣ�
		if (HaveMagic(157) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(157)		--��������[157]��50����
		end
	end
	if (lvl >= 70) then		-- ��ʦ���񣨼����ɾ�ѧ��
		if (HaveMagic(165) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(165)		--�����޽�[165]��60����
		end
		if (HaveMagic(166) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(166)		--̫����[166]�����ɣ�
		end
		if (HaveMagic(267) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(267)		--��������[267]��60����
		end
	end
	if (lvl >= 90) then		-- 90�����񣨼�90�����ܣ�
		if (HaveMagic(365) <= 0) then AddMagic(365,20) end		--����޼�[365]��90����
		if (HaveMagic(368) <= 0) then AddMagic(368,20) end		--�˽���һ[368]��90����
		if (HaveMagic(716) <= 0) then AddMagic(716,20) end		--����120����
		if (HaveMagic(1078) <= 0) then AddMagic(1078,20) end		--����150����
		if (HaveMagic(1079) <= 0) then AddMagic(1079,20) end		--����150����
		--AddItem(6,1,2841,1,0,0)
	end
end

function add_kl(lvl)			-- ��������ȼ�����Ӧ�����ؼ���
	AddMagic(210,1)
	if (lvl >= 10) then			-- �Ѿ����ţ������ż��ܣ�
		if (HaveMagic(169) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(169)		--���編  [169]�����ţ�
		end
		if (HaveMagic(179) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(179)		--�������[179]�����ţ�
		end
	end
	if (lvl >= 20) then		-- 10�����񣨼�10�����ܣ�
		if (HaveMagic(167) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(167)		--���ص���[167]��10����
		end
		if (HaveMagic(168) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(168)		--���ؽ���[168]��10����
		end
		if (HaveMagic(392) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(392)		--���־�[392]��10����
		end
		if (HaveMagic(171) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(171)		--����  [171]��10����
		end
	end
	if (lvl >= 30) then		-- 20�����񣨼�20�����ܣ�
		if (HaveMagic(174) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(174)		--��  [174]��20����
		end
	end
	if (lvl >= 40) then		-- 30�����񣨼�30�����ܣ�
		if (HaveMagic(178) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(178)		--һ������[178]��30����
		end
		if (HaveMagic(172) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(172)		--Ѹ����  [172]��30����
		end
		if (HaveMagic(393) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(393)	-- ȱ��ID��30����
		end
		if (HaveMagic(173) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(173)		--�������[173]��30����
		end
	end
	if (lvl >= 50) then		-- 40�����񣨼�40�����ܣ�
		if (HaveMagic(175) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(175)		--�ۺ���ѩ[175]��40����
		end
		if (HaveMagic(181) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(181)		--���ķ�  [181]��40����
		end
	end
	if (lvl >= 60) then		-- 50�����񣨼�50�����ܣ�
		if (HaveMagic(176) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(176)		--������[176]��50����
		end
		if (HaveMagic(90) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(90)		--���ٻ�Ӱ[90 ]��50����
		end
	end
	if (lvl >= 70) then		-- ��ʦ���񣨼����ɾ�ѧ��
		if (HaveMagic(275) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(275)		--˪������[275]�����ɣ�
		end
		if (HaveMagic(182) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(182)		--��������[182]��60����
		end
		if (HaveMagic(630) == -1) then
			AddMagic(630);		--��������Ƭ�����������¼���"�����޼�"
		end
	end
	if (lvl >= 90) then		-- 90�����񣨼�90�����ܣ�
		if (HaveMagic(372) <= 0) then AddMagic(372,20) end		--��ѩХ��[372]��90����
		if (HaveMagic(375) <= 0) then AddMagic(375,20) end		--�׶�����[375]��90����
---		if (GetTaskTemp(20) == 394) then
---			if (HaveMagic(394) == -1) then		-- ����û�м��ܵĲŸ�����
---				AddMagic(394)		-- [394]��90����
---			end
---		end
		if (HaveMagic(394) <= 0) then AddMagic(394) end		--90���丨������
		if (HaveMagic(717) <= 0) then AddMagic(717,20) end		--����120����
		if (HaveMagic(1080) <= 0) then AddMagic(1080,20) end		--����150����
		if (HaveMagic(1081) <= 0) then AddMagic(1081,20) end		--����150����
		--AddItem(6,1,2841,1,0,0)
	end
end

function add_hs(lvl)			-- ��������ȼ�����Ӧ�Ļ�ɽ����
	AddMagic(210,1)
	if (lvl >= 10) then			-- �Ѿ����ţ������ż��ܣ�
		if (HaveMagic(1347) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(1347)		--�׺���գ����ţ�
		end
		if (HaveMagic(1372) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(1372)		--�����ˬ�����ţ�
		end
	end
	if (lvl >= 20) then		-- 10�����񣨼�10�����ܣ�
		if (HaveMagic(1349) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(1349)		--�����ܾ���10����
		end
		if (HaveMagic(1374) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(1374)		--������10����
		end
	end
	if (lvl >= 30) then		-- 20�����񣨼�20�����ܣ�
		if (HaveMagic(1350) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(1350)		--���ὣ����20����
		end
		if (HaveMagic(1375) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(1375)		--���ɰٴ���20����
		end
	end
	if (lvl >= 40) then		-- 30�����񣨼�30�����ܣ�
		if (HaveMagic(1351) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(1351)		--�����գ�30����
		end
		if (HaveMagic(1376) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(1376)		--����������30����
		end
	end
	if (lvl >= 50) then		-- 40�����񣨼�40�����ܣ�
		if (HaveMagic(1354) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(1354)		--ϣ�Ľ�����40����
		end
		if (HaveMagic(1378) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(1378)		--����ɽ�ӣ�40����
		end
	end
	if (lvl >= 60) then		-- 50�����񣨼�50�����ܣ�
		if (HaveMagic(1355) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(1355)		--��������50����
		end
		if (HaveMagic(1379) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(1379)		--���᳤�磨50����
		end
	end
	if (lvl >= 70) then		-- ��ʦ���񣨼����ɾ�ѧ��
		if (HaveMagic(1358) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(1358)		--�������Σ�60����
		end
		if (HaveMagic(1360) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(1360)		--����ӭ�ͣ�60����
		end
		if (HaveMagic(1380) == -1) then
			AddMagic(1380);		--Ħ�ƽ�����60����
		end
	end
end

function del_all_skill()
	i = HaveMagic(210)		-- �Ṧ�������
	j = HaveMagic(400)		-- ���ٸ���ƶ���������
	n = RollbackSkill()		-- ������ܲ��������м��ܵ㣨�����Ṧ�����⼼�ܣ�
	x = 0
	if (i ~= -1) then x = x + i end		-- �������ж����ų���δѧ���Ṧ���˷���-1�Ӷ����µ�������������
	if (j ~= -1) then x = x + j end
	SetTaskTemp(21,n + GetMagicPoint() - x)			-- �Ѽ��ܵ㵱�����е������������ȿ۳��Ṧ��

---------------- �������� ------------------------
	if (i ~= -1) then AddMagic(210,i) end			-- ���ѧ���Ṧ��ӻ�ԭ�еȼ�
	if (j ~= -1) then AddMagic(400,j) end			-- ���ѧ�����ٸ���ƶ��ͬ������
--	DelMagic(396)
--	DelMagic(397)

------------------ ���� --------------------------
--	DelMagic(395)

------------------ ������ ------------------------
	DelMagic(29)			-- ����
	DelMagic(23)
	DelMagic(24)
	DelMagic(26)
	DelMagic(30)
	DelMagic(31)
	DelMagic(32)
	DelMagic(33)
	DelMagic(34)
	DelMagic(35)
	DelMagic(36)
	DelMagic(37)
	DelMagic(38)
	DelMagic(40)
	DelMagic(41)
	DelMagic(42)
	DelMagic(324)
--	DelMagic(322)
--	DelMagic(323)
--	DelMagic(325)
	
	DelMagic(10)			-- ����
	DelMagic(3)
	DelMagic(4)
	DelMagic(5)
	DelMagic(6)
	DelMagic(7)
	DelMagic(8)
	DelMagic(9)
	DelMagic(12)
	DelMagic(14)
	DelMagic(13)
	DelMagic(15)
	DelMagic(271)
	DelMagic(16)
	DelMagic(18)
	DelMagic(20)
	DelMagic(11)
	DelMagic(19)
	DelMagic(21)
	DelMagic(273)
--	DelMagic(318)
--	DelMagic(319)
--	DelMagic(321)

	DelMagic(45)			-- ����
	DelMagic(43)
	DelMagic(347)
	DelMagic(303)
	DelMagic(44)
	DelMagic(47)
	DelMagic(48)
	DelMagic(50)
	DelMagic(51)
	DelMagic(54)
	DelMagic(343)
	DelMagic(345)
	DelMagic(349)
	DelMagic(55)
	DelMagic(57)
	DelMagic(58)
	DelMagic(249)
	DelMagic(253)
	DelMagic(341)
--	DelMagic(339)
--	DelMagic(302)
--	DelMagic(342)
	if (HaveMagic(351) ~= -1) then
		SetTaskTemp(20,351)
		DelMagic(351)
	end

	DelMagic(63)			-- �嶾
	DelMagic(60)
	DelMagic(61)
	DelMagic(62)
	DelMagic(64)
	DelMagic(65)
	DelMagic(66)
	DelMagic(67)
	DelMagic(68)
	DelMagic(384)
	DelMagic(69)
	DelMagic(356)
	DelMagic(70)
	DelMagic(72)
	DelMagic(73)
	DelMagic(74)
	DelMagic(76)
	DelMagic(71)
	DelMagic(75)
--	DelMagic(353)
--	DelMagic(355)
	if (HaveMagic(390) ~= -1) then
		SetTaskTemp(20,390)
		DelMagic(390)
	end

	DelMagic(80)			-- ����
	DelMagic(101)
	DelMagic(77)
	DelMagic(79)
	DelMagic(385)
	DelMagic(81)
	DelMagic(82)
	DelMagic(83)
	DelMagic(84)
	DelMagic(85)
	DelMagic(86)
	DelMagic(87)
	DelMagic(88)
	DelMagic(89)
	DelMagic(91)
	DelMagic(93)
	DelMagic(252)
	DelMagic(92)
	DelMagic(282)
--	DelMagic(328)
--	DelMagic(330)
	if (HaveMagic(332) ~= -1) then
		SetTaskTemp(20,332)
		DelMagic(332)
	end

	DelMagic(99)			-- ����
	DelMagic(95)
	DelMagic(96)
	DelMagic(97)
	DelMagic(100)
	DelMagic(102)
	DelMagic(103)
	DelMagic(269)
	DelMagic(105)
	DelMagic(109)
	DelMagic(270)
	DelMagic(108)
	DelMagic(113)
	DelMagic(111)
	DelMagic(114)
--	DelMagic(336)
--	DelMagic(337)

	DelMagic(117)			-- ؤ��
	DelMagic(115)
	DelMagic(116)
	DelMagic(118)
	DelMagic(119)
	DelMagic(120)
	DelMagic(121)
	DelMagic(122)
	DelMagic(123)
	DelMagic(124)
	DelMagic(126)
	DelMagic(127)
	DelMagic(277)
	DelMagic(274)
	DelMagic(125)
	DelMagic(129)
	DelMagic(130)
	DelMagic(128)
	DelMagic(360)
--	DelMagic(357)
--	DelMagic(359)

	DelMagic(135)			-- ����
	DelMagic(131)
	DelMagic(132)
	DelMagic(134)
	DelMagic(136)
	DelMagic(137)
	DelMagic(138)
	DelMagic(139)
	DelMagic(140)
	DelMagic(364)
	DelMagic(141)
	DelMagic(142)
	DelMagic(143)
	DelMagic(145)
	DelMagic(146)
	DelMagic(147)
	DelMagic(148)
	DelMagic(149)
	DelMagic(150)
	DelMagic(254)
--	DelMagic(361)
--	DelMagic(362)
	if (HaveMagic(391) ~= -1) then
		SetTaskTemp(20,391)
		DelMagic(391)
	end

	DelMagic(153)			-- �䵱
	DelMagic(151)
	DelMagic(152)
	DelMagic(155)
	DelMagic(156)
	DelMagic(157)
	DelMagic(158)
	DelMagic(159)
	DelMagic(160)
	DelMagic(161)
	DelMagic(162)
	DelMagic(164)
	DelMagic(165)
	DelMagic(166)
	DelMagic(267)
--	DelMagic(365)
--	DelMagic(368)

	DelMagic(169)			-- ����
	DelMagic(167)
	DelMagic(168)
	DelMagic(392)
	DelMagic(170)
	DelMagic(171)
	DelMagic(393)
	DelMagic(174)
	DelMagic(175)
	DelMagic(177)
	DelMagic(178)
	DelMagic(179)
	DelMagic(180)
	DelMagic(173)
	DelMagic(90)
	DelMagic(181)
	DelMagic(183)
	DelMagic(184)
	DelMagic(172)
	DelMagic(176)
	DelMagic(182)
	DelMagic(275)
--	DelMagic(372)
--	DelMagic(374)
	if (HaveMagic(394) ~= -1) then
		SetTaskTemp(20,394)
		DelMagic(394)
	end
end

----------------- ����Ǳ�ܵ㣬ͬʱ���м���޸� ------------------------------
function rollback_prop()			-- ���ڵ��߼�Ǳ�ܵ���ڲ�ȷ���ԣ���ʱȡ���޸����ܣ�ֻд��־���飩
	if (GetTask(137) >= 20) then			-- ���¹����ܵ�Ҳ���ٸ���Ǳ��
		return 1
	else
		base_str = {35,20,25,30,20}			-- �����������������ֵ
		base_dex = {25,35,25,20,15}
		base_vit = {25,20,25,30,25}
		base_eng = {15,25,25,20,40}
		player_series = GetSeries() + 1
--		AddProp(100)			-- Ϊ����û��δ����Ǳ�ܵ�ɹ��޸��ļ����������ʱ���衱����100��
		Utask88 = GetTask(88)
		AddStrg(base_str[player_series] - GetStrg(1) + GetByte(Utask88,1))			-- ���ѷ���Ǳ�����ã�task(88)��������ֱ�ӽ��������������ȣ�
		AddDex(base_dex[player_series] - GetDex(1) + GetByte(Utask88,2))
		AddVit(base_vit[player_series] - GetVit(1) + GetByte(Utask88,3))
		AddEng(base_eng[player_series] - GetEng(1) + GetByte(Utask88,4))
--		AddProp(-100)			-- ��ծ
--		if (GetTask(81) == 0) then		-- ����ù�ϴ�辭��Ǳ�ܵ�û�й̶���׼�����޷������޸������ֻ��δ�ù���Ĳż����޸���
			player_prop = GetProp()										-- ������Ǳ�������Ƿ���ȷ��������������߼ӵ�Ǳ�ܵ㣬��������ʱ����
			std_prop = (GetLevel()-1)*5 + GetByte(GetTask(86),1)
			if (player_prop ~= std_prop) then						-- �����һ����������ȡ��������ֻд��־��
--				AddProp(std_prop - player_prop)
				x = GetByte(Utask88,1)+GetByte(Utask88,2)+GetByte(Utask88,3)+GetByte(Utask88,4)
				WriteLog(date("%Hgi�%Mph�t%Sgi�y")..": t�i kho�n'"..GetAccount().."'nh�n v�t'"..GetName().."'Ph�c h�i k� n�ng �� lui v� k� l�c ban ��u: ��ng c�p"..GetLevel()..", �i�m ti�mn�ng ban ��u"..player_prop..", ���c ti�m n�ng s�n c� "..std_prop.."�i�m (Nhi�m v� c�ng"..GetByte(GetTask(86),1).."�i�m, ��o c� c�ng"..GetTask(81).."�i�m) ."..x..".")
			end
--		end
		Msg2Player("Ph�c h�i ti�m n�ng �� ho�n t�t! Xin h�y ph�n ph�i l�i �i�m! ")
	end
end
tbAllSkill = {
	shaolin = {
		[1] = {10,14},
		[2] = {4,6,8},
		[3] = {15},
		[4] = {16},
		[5] = {20},
		[6] = {11,19,271},
		[7] = {21,273},
		[9] = {318,319,321,709},
	},
	tianwang = {
		[1] = {29,30,34},
		[2] = {23,24,26},
		[3] = {33},
		[4] = {31,35,37},
		[5] = {40},
		[6] = {42},
		[7] = {32,36,41,324},
		[9] = {322,323,325,708},
	},
	tangmen = {
		[1] = {45},
		[2] = {43,347},
		[3] = {303},
		[4] = {47,50,54,343},
		[5] = {345},
		[6] = {349},
		[7] = {48,58,249,341},
		[9] = {302,339,342,351,710},
	},
	wudu = {
		[1] = {63,65},
		[2] = {60,62,67},
		[3] = {66,70},
		[4] = {64,68,69,384},
		[5] = {73,356},
		[6] = {72},
		[7] = {71,74,75},
		[9] = {353,355,390,711},
	},
	emei = {
		[1] = {80,85},
		[2] = {77,79},
		[3] = {93},
		[4] = {82,89,385},
		[5] = {86},
		[6] = {92},
		[7] = {88,91,252,282},
		[9] = {328,332,380,712},
	},
	cuiyan = {
		[1] = {99,102},
		[2] = {95,97},
		[3] = {269},
		[4] = {105,113},
		[5] = {100},
		[6] = {109},
		[7] = {108,111,114},
		[9] = {336,337,713},
	},
	gaibang = {
		[1] = {119,122},
		[2] = {115,116},
		[3] = {129},
		[4] = {124,274},
		[5] = {277},
		[6] = {125,128},
		[7] = {130,360},
		[9] = {357,359,714},
	},
	tianren = {
		[1] = {135,145},
		[2] = {131,132,136},
		[3] = {137},
		[4] = {138,140,141},
		[5] = {364},
		[6] = {143},
		[7] = {142,148,150},
		[9] = {361,362,391,715},
	},
	wudang = {
		[1] = {153,155},
		[2] = {151,152},
		[3] = {159},
		[4] = {158,164},
		[5] = {160},
		[6] = {157},
		[7] = {165,166,267},
		[9] = {365,368,716},
	},
	kunlun = {
		[1] = {169,179},
		[2] = {167,168,171,392},
		[3] = {174},
		[4] = {172,173,178,393},
		[5] = {175,181},
		[6] = {90,176},
		[7] = {182,275,630},
		[9] = {372,375,394,717},
	},
}
function HoTroSkill()
	local szFaction = GetFaction()
	if tbAllSkill[szFaction] == nil then
		return
	end
	for i=1, 7 do
		if tbAllSkill[szFaction][i] ~= nil then
			for j=1, getn(tbAllSkill[szFaction][i]) do
				if HaveMagic(tbAllSkill[szFaction][i][j]) == -1 then
						AddMagic(tbAllSkill[szFaction][i][j])
				end
			end
		end
	end
end
