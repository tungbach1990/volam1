-- ������ �һ��� �䵱 ·��_�����.lua
-- by: Dan_deng(2004-05-15)
-- Ϊ�䵱���Ӽ����ʦ���Ӹ��¼���

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 5) then			-- ������¼���
--		del_all_skill()
--		Talk(1,"skills_update","����⣺����֮����������ֹ���ģ�������͡���̫�������书��·������������ᵽ���еľ��硣��ν��Ź����ԡ���ʮ�������Ǹ٣�ʦ�ܽԲ���̫�����⡣�������յ����е��������ڣ����书��ɡ�������ˣ���㡭��")
--	elseif (Uworld137 == 25) then		-- �Ѿ����¹�����
--		Talk(1,"","����⣺�����ڴˣ���ʦ�ܻ�ȥ�������ա�")
--	else										-- ��������
		Talk(1,"","Ta �ang c� ch�t v�n �� ��y, ��ng c� qu�y r�y ta!")
--	end
end

function skills_update()			-- �ȸ�������ȼ�ɾ�������¼��뼼�ܣ�Ȼ�󲹻ؼ��ܵ�
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
	add_wd(the_lvl)			-- �ӻ�Ӧѧ��ļ���
	-- �����ܵ����� = (�ȼ�-1) + �Ӽ������� + �Ӽ��ܵ��� - ����δ�������				�����弼�ܣ���
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,25)
	Talk(1,"UpdateSkill","Ng��i c� v� ngh� ng�i tr��c �i, ta s� c� c�ch!")
end
