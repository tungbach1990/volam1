-- ������ �һ��� ���� ·��_�ջ�.lua
-- by: Dan_deng(2004-05-15)
-- Ϊ���ֵ��Ӽ����ʦ���Ӹ��¼���

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 7) then			-- ������¼���
--		del_all_skill()
--		Talk(1,"skills_update","�ջݣ����Ĵ˷���ɽ������Ѱ�Ҿ���֮�����ڴ�����Ҳ�ǻ�Ե�ɺϡ�")
--	elseif (Uworld137 == 27) then		-- �Ѿ����¹�����
--		Talk(1,"","�ջݣ�̰����ŭ����ի�ƽ䡣������£���Ҫ�����Ź���ɣ��������Ž̻塣")
--	else										-- ��������
		Talk(1,"","Thi�n tai! C�i g�i l� ki�p s�, ��u l� thi�n m�nh, kh� �i ch� l� m�t ki�p s� m� th�i. ")
--	end
end

function skills_update()			-- �ȸ�������ȼ�ɾ�������¼��뼼�ܣ�Ȼ�󲹻ؼ��ܵ�
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
	add_sl(the_lvl)			-- �ӻ�Ӧѧ��ļ���
	-- �����ܵ����� = (�ȼ�-1) + �Ӽ������� + �Ӽ��ܵ��� - ����δ�������				�����弼�ܣ���
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,27)
	Talk(1,"UpdateSkill","N�u h� t�m l�c n�o c�ng ho�i ni�m v� nh�n t�m, v� ng��i h�nh thi�n th� s� kh�ng u�ng ph� t�m huy�t c�a l�o n�p. ")
end
