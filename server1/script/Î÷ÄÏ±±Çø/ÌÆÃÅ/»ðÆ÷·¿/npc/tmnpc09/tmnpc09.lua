--description: �������� 30������ 
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tm = GetTask(2);
	if (GetFaction() == "tangmen") and (GetSeries() == 1) then
		if ((UTask_tm >= 30*256+50) and (UTask_tm <= 30*256+60) and (HaveItem(42) == 1)) then		--30������
			L30_prise()
		elseif (UTask_tm >= 40*256) and (GetFaction() == "tangmen") then					--�Ѿ����30��������δ��ʦ
			Talk(1,"","Ng��i �� gi�p ta b�o m�i th� n�y, ng��i c�n g�? Ta nh�t ��nh gi�p ng��i!")
		else								--û�����30������ȱʡ�Ի���
			Talk(1,"","Ti�u Xuy�n, ��a con t�i nghi�p c�a ta�.Th� h�n n�y��ng�y n�o ch�a tr�, ta ch�t kh�ng nh�m m�t!")
		end
	elseif (UTask_tm >= 70*256) then							--�Ѿ���ʦ
		Talk(1,"","Giang h� hi�m �c, m�t m�nh h�nh hi�p giang h� ph�i h�t s�c c�n th�n! ")
	else
		Talk(1,"","B�nh sinh ta v�n th� h�n b�n th� ph� gi�t ng��i c��p b�c!")
	end
end;

function L30_prise()
	Talk(2, "", "���ng V�n s� th�c, t�i h� �� t�m ���c nh�ng t�n Th� Ph� b�o th� cho �ng v� �o�t v� 'H�a Kh� Ph�'. Ch� c�n �ng giao cho Ch��ng m�n s� kh�ng ph�i ch�u h�nh ph�t n�a!", "Ta lu�n ��i ��n ng�y n�y. Ng��i n�i xem ng��i c�n g�? Ta s� ��p �ng!")
	DelItem(42)
	SetRank(28)
	SetTask(2, 40*256)
--	AddMagic(50)
--	AddMagic(54)
--	AddMagic(47)
--	AddMagic(343)
	add_tm(40)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng b�n! B�n �� ���c th�ng l�m ���ng M�n Gi�i Ti�n H� V�, h�c ���c: Truy T�m Ti�n, M�n Thi�n Hoa V�, Xuy�n T�m Th�ch. ")
	AddNote("V� ��n H�a Kh� ph�ng, giao Ho� Kh� Ph� cho ���ng V�n, ho�n th�nh nhi�m v� Ho� Kh� Ph�, th�ng l�: Gi�i Ti�n H� V�. ")
end;
