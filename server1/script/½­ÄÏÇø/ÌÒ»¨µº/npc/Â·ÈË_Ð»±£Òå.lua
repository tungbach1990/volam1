-- ������ �һ��� ���� ·��_л����.lua
-- by: Dan_deng(2004-05-15)
-- Ϊ�������Ӽ����ʦ���Ӹ��¼���

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 3) then			-- ������¼���
--		del_all_skill()
--		Talk(1,"skills_update","л���壺С�ֵܣ������ĺ����Ǻܺð����������Ұ���˳˳����")
--	elseif (Uworld137 == 23) then		-- �Ѿ����¹�����
--		Talk(1,"","л���壺����������һ��ʱ�䣬�������Ϊ���кô���")
--	else										-- ��������
		Talk(1,"","C�i g� 'qu�c h�n',c�i g� 'gia c�u', h�ng tr�m n�m sau v�n ch� l� m�ng �o!")
--	end
end

function skills_update()			-- �ȸ�������ȼ�ɾ�������¼��뼼�ܣ�Ȼ�󲹻ؼ��ܵ�
	UTask = GetTask(3)
	if (GetTask(121) == 255) then		-- ѧ����90������
		the_lvl = 90
	elseif (HaveMagic(42) >= 0) then		-- �����ɾ�ѧ����
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
	add_tw(the_lvl)			-- �ӻ�Ӧѧ��ļ���
	-- �����ܵ����� = (�ȼ�-1) + �Ӽ������� + �Ӽ��ܵ��� - ����δ�������				�����弼�ܣ���
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,23)
	Talk(1,"UpdateSkill","Hay l�m! Ng��i h�y chuy�n t�m luy�n c�ng, nh�t ��nh s� th�m h�u! ")
end
