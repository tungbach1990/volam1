-- ���� ·��NPC ���⣨��������
-- by��Dan_Deng(2003-07-28)

function main()
	Uworld30 = GetByte(GetTask(30),2)
	if (Uworld30 == 10) and (HaveItem(74) == 0) then		--���������в���û�и���Ʒ
		Say("Ph�i khen th� n�o ��y?",4,"T��ng m�o /prise_1","H�c th�c /prise_2","B�n b� /prise_3","R�i kh�i/prise_exit")
	else					--����ͨ�Ի��и�һ���������ʾ��
		i = random(0,2)
		if (i == 0) then
			Talk(1,"","��n �ng t� 8 tu�i tr� l�n, 80 tu�i tr� xu�ng ��u qu� m�p tr��c s�c ��p c�a b�n c� n��ng!")
		elseif (i == 1) then
			Talk(1,"","Ti�u n� tuy v� ��i nh�ng l�i c� ��c")
		else
			Talk(1,"","V� sao h� lu�n ghen gh�t s�c ��p c�a ta? L� n�o ��p c�ng l� c�i t�i hay sao?")
		end
	end
end;

function prise_1()
--	if (GetSex() == 1) then		--����ҽ�ɫ��Ů�ԣ��Ի�Ӧ���޸ġ��������ӿڣ�������Դ��Ժ��ٸġ�
--		Talk(4,"","��ң���λ����ü����𣬼����ѩ���������أ����纬������֮һ����̫������֮һ����̫�̡�������̫�ף�ʩ����̫�ࡣ��������ʩ֮ò������֮�ݰ���","Ů�ӣ��������۹⣬�����Һų����ݵ�һ���ˣ��������ϣ���ʮ�����£�ֻҪ�����ˣ�û�в��ݵ��ڱ������ȹ�µģ�","��ң����������ң����ܼ�ʶ�����ݵ�һ��Ů����֪�����ܷ�����һ�����������Ҽ�������ˣ���Զ��ס�������ò��","Ů�ӣ����к��ѣ�")
--	else
		Talk(4,"","V� c� n��ng n�y m�i nh� ph� th�y, da tr�ng nh� tuy�t, r�ng tr�ng nh� ng�c kh�ng thua k�m g� T�y Thi, Qu� Phi!","Ng��i th�t bi�t nh�n, b�n c� n��ng hi�u x�ng l� D��ng Ch�u �� nh�t m� nh�n. ��n �ng t� 8 tu�i tr� l�n,80 tu�i tr� xu�ng ��u qu� m�p d��i ch�n b�n c� n��ng!","Ta qu� th�t vinh h�nh, cu�i c�ng c�ng c� th� chi�m ng��ng v� ��p c�a �� nh�t m� nh�n D��ng Ch�u. Ch�ng hay c� n��ng c� th� t�ng ta 1 chi�c kh�n tay? Ta mu�n nh�n kh�n nh� nh�n th�y ng��i, m�i m�i ghi nh� n�t xinh ��p m� mi�u c�a c� n��ng!","V�y c� g� kh�?")
--	end
	AddEventItem(74)
	Msg2Player("Th� Sinh t�ng b�n chi�c qu�t ")
	AddNote("���c t�ng m�t mi�ng Th� Ph�ch. ")
end;

function prise_2()
	Talk(2,"","V� c� n��ng n�y kh� ch�t thanh khi�t, ch�c l� con nh� tr�m anh th� ki�t, h�c v�n uy�n th�m! Th�t l� 1 n� trung Tr�ng nguy�n.","Ti�u n� kh�ng c� t�i th� c�ng c� ��c. Ch� ngh�a th� l�m ���c g�? Ch� gi�u sang ph� qu� l� ���c r�i!")
end;

function prise_3()
	Talk(2,"","V� c� n��ng n�y th�t d� m�n! Ch�c c� n��ng c� r�t nhi�u b�ng h�u?","H�! B�n h� �� k� ta xinh ��p h�n h� n�n ta m�i kh�ng k�t b�n v�i h� th�i!")
end;

function prise_exit()
end;
