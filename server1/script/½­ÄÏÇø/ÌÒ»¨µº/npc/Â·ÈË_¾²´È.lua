-- ������ �һ��� ���� ·��_����.lua
-- by: Dan_deng(2004-05-15)
-- Ϊ���ҵ��Ӽ����ʦ���Ӹ��¼���

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 1) then			-- ������¼���
--		del_all_skill()
--		Talk(1,"skills_update","���ȣ�ʦֶԶ��������������ȭ�Ź������кβ���֮�������ѯ�ʡ�")
--	elseif (Uworld137 == 21) then		-- �Ѿ����¹�����
--		Talk(1,"","���ȣ����м�����ϰ���ԣ���Ҳ����ʲô�󰭣��ողſھ����ԣ��ڼ���ϰ���ɡ�ʦֶ�������⣬���½�ҪС�ġ�")
--	else										-- ��������
		Talk(1,"","Kh�ng bi�t tr�n ��i l�an c�a hai m��i n�m tr��c,b�y gi� m�y ai c�n nh�? ")
--	end
end

function skills_update()			-- �ȸ�������ȼ�ɾ�������¼��뼼�ܣ�Ȼ�󲹻ؼ��ܵ�
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
	add_em(the_lvl)			-- �ӻ�Ӧѧ��ļ���
	-- �����ܵ����� = (�ȼ�-1) + �Ӽ������� + �Ӽ��ܵ��� - ����δ�������				�����弼�ܣ���
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,21)
	Talk(1,"UpdateSkill","C� nhi�u ch� ng��i luy�n v�n c�n ch�a ��ng, nh�ng c�ng kh�ng tr� ng�i g� l�m. Ch� c�n n�m ch�c ���c nh�ng kh�u quy�t n�y th� c� th� th�nh c�ng. ")
end
