-- ������ �һ��� �嶾 ·��_������.lua
-- by: Dan_deng(2004-05-15)
-- Ϊ�嶾���Ӽ����ʦ���Ӹ��¼���

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 10) then			-- ������¼���
--		del_all_skill()
--		Talk(2,"skills_update","��ң����²��Ƿ�����֮�����������ʦ��ʦ���������⵺�ϣ�����ǰ����̡����Ӿ������������书�ƺ��в���֮���������徭����֮������������������ʦ��ָ�㡣","���������ߣ�ʦ������ˣ���ͽ�ܾ�Ҳ���Ź����嶾������Ҫ������ڲƭ���֣���ʵί�룬��ʹ���ַ��ģ�ʹ����������֮�С�������Ӧ���Ұ��£��ұ�ָ���㹦��","��ң�����Ը����ǲ��")
--	elseif (Uworld137 == 30) then		-- �Ѿ����¹�����
--		Talk(1,"","���������书���Ѿ�ָ�����ˣ�ϣ�����ֽ�����Щ�������³ɡ�")
--	else										-- ��������
		Talk(1,"","M�nh Tinh Dao ta v�n ch�ng �am m� g� ng�i v� V��ng Ch�. S� huynh c�a ta h� t�t c� ph�i cho ng��i �i theo d� x�t ta nh� v�y. ")
--	end
end

function skills_update()			-- �ȸ�������ȼ�ɾ�������¼��뼼�ܣ�Ȼ�󲹻ؼ��ܵ�
	UTask = GetTask(2)
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
	add_wu(the_lvl)			-- �ӻ�Ӧѧ��ļ���
	-- �����ܵ����� = (�ȼ�-1) + �Ӽ������� + �Ӽ��ܵ��� - ����δ�������				�����弼�ܣ���
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,30)
	Talk(1,"UpdateSkill","Ta �� truy�n h�t v� c�ng cho ng��i r�i! C� g�ng luy�n t�p nh�!")
end
