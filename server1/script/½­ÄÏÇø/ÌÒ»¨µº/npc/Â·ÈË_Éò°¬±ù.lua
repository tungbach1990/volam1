-- ������ �һ��� ���� ·��_�򰬱�.lua
-- by: Dan_deng(2004-05-15)
-- Ϊ���̵��Ӽ����ʦ���Ӹ��¼���

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 6) then			-- ������¼���
--		del_all_skill()
--		Talk(1,"skills_update","�򰬱������ã�������ж��δ���Ѱ�����հհա������ŵĽ����ǣ��ɲ����������ǿ���Ц��������������������ô�ã���֪���Ź����Ƿ���Щ�������ý�����̽һ̽��")
--	elseif (Uworld137 == 26) then		-- �Ѿ����¹�����
--		Talk(1,"","�򰬱������ù�����¯���࣬������ָ���ˣ�Ҳϣ�������ҵ��Լ��ĺù��ޡ�")
--	else										-- ��������
		Talk(1,"","V�n Phi�u sa; nguy�t quang m�ng �o ��o Hoa ��o; ��o Hoa ��o, ��u ��u th�o s�c, Ti�u ��o h�ng ti�u ")
--	end
end

function skills_update()			-- �ȸ�������ȼ�ɾ�������¼��뼼�ܣ�Ȼ�󲹻ؼ��ܵ�
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
	add_cy(the_lvl)			-- �ӻ�Ӧѧ��ļ���
	-- �����ܵ����� = (�ȼ�-1) + �Ӽ������� + �Ӽ��ܵ��� - ����δ�������				�����弼�ܣ���
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,26)
	Talk(1,"UpdateSkill","C� nhi�u ch� ng��i luy�n v�n c�n ch�a ��ng, nh�ng c�ng kh�ng tr� ng�i g� l�m. Ch� c�n n�m ch�c ���c nh�ng kh�u quy�t n�y th� c� th� th�nh c�ng. ")
end
