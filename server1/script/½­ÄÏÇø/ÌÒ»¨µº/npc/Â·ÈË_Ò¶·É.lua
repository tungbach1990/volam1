-- ������ �һ��� ���� ·��_Ҷ��.lua
-- by: Dan_deng(2004-05-15)
-- Ϊ���ص��Ӽ����ʦ���Ӹ��¼���

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 9) then			-- ������¼���
--		del_all_skill()
--		Talk(4,"skills_update","Ҷ�ɣ�����һ���ǲ���Υ����ʦ����һ��ȴ����ҹǣ�ҵ������ˣ��ҡ����Ҹ�����Ǻã�","��ң�ʦ�֡���","Ҷ�ɣ�ʦ����������Ѱ���������ţ���ǣ�����ţ���һ�뵽Ϧ�յ�Ц���Ҿ;�������Ϊ�ѡ�","Ҷ�ɣ������������˵��̫���ˣ������ȥ��ʦ�������𷣡���Щ��ʦ���̸��ҵ��ķ�����������������������ͬ������Կ������������������١�")
--	elseif (Uworld137 == 29) then		-- �Ѿ����¹�����
--		Talk(1,"","Ҷ�ɣ����Ȼ�ȥ�ɣ����������š�")
--	else										-- ��������
		Talk(1,"","C� nh� v�y �i, h�y v� ngh� ng�i tr��c, ta s� c� c�ch!")
--	end
end

function skills_flush()			-- ˢ�¼���
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
	add_kl(the_lvl)			-- �ӻ�Ӧѧ��ļ���
	-- �����ܵ����� = (�ȼ�-1) + �Ӽ������� + �Ӽ��ܵ��� - ����δ������� ����������������û�����Ժ��ټӣ�
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,29)
	Talk(1,"UpdateSkill","C� nh� v�y �i, h�y v� ngh� ng�i tr��c, ta s� c� c�ch!")
end
