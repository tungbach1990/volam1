-- ������ �һ��� ؤ�� ·��_����.lua
-- by: Dan_deng(2004-05-15)
-- Ϊؤ����Ӽ����ʦ���Ӹ��¼���

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 8) then			-- ������¼���
--		del_all_skill()
--		Talk(1,"skills_update","���ӣ����������һ������Ҳѧ��Щ���Ź��򣬿�С�ֵܸ��ʲ���ָ���㼸�аɡ�")
--	elseif (Uworld137 == 28) then		-- �Ѿ����¹�����
--		Talk(1,"","���ӣ�С�ֵܸ�����ѣ������������д�ɡ�С�ֵ�������һ������Ҫ�ڴ�ץס�Ǹ������ϸ��������ڡ�")
--	else										-- ��������
		Talk(1,"","C�i t�n gian t� Kim qu�c ��, ta nh�t ��nh s� kh�ng tha cho h�n ")
--	end
end

function skills_update()			-- �ȸ�������ȼ�ɾ�������¼��뼼�ܣ�Ȼ�󲹻ؼ��ܵ�
	UTask = GetTask(8)
	if (GetTask(128) == 255) then		-- ѧ����90������
		the_lvl = 90
	elseif (HaveMagic(128) >= 0) then		-- �����ɾ�ѧ����
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
	add_gb(the_lvl)			-- �ӻ�Ӧѧ��ļ���
	-- �����ܵ����� = (�ȼ�-1) + �Ӽ������� + �Ӽ��ܵ��� - ����δ�������				�����弼�ܣ���
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,28)
	Talk(1,"UpdateSkill","Ti�u huynh �� anh t�i xu�t ch�ng. N�u nh� c� mu�n � ��y luy�n c�ng th� c� ti�p t�c. Ta s� �i b�t c�i t�n gian t� Kim qu�c kia tr��c. S� g�p l�i sau nh�! ")
end
