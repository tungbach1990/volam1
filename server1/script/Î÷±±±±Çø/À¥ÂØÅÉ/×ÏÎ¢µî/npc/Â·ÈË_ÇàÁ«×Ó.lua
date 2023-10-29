-- ���� ���� ������ 40������
-- by��Dan_Deng(2003-07-30)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_kl = GetTask(9);
	if (GetSeries() == 4) and (GetFaction() == "kunlun") then
		if ((UTask_kl == 40*256+20) and (HaveItem(9) == 1)) then		--40���������
			Talk(2,"L40_prise","H� ph�p! ��y c� ph�i l� Huy�t H�n Th�n Ki�m","H�o ki�m! Th�t l� h�o ki�m! Ha! Ha! Ha! B�n t�a �� kh�ng nh�n l�m ng��i, ng��i ��ng l� c� t�i! ���c! B�n t�a s� th�ng ng��i th�nh ��i �� t� c�p 40!")
		elseif (UTask_kl == 40*256) and (GetLevel() >= 40) then		--40������
			Say("N�i C�n L�n v� ph�a b�c c� ��nh Ki�n T�nh phong, truy�n thuy�t tr�n ��nh c�t gi�u 1 thanh tuy�t th� h�o ki�m Huy�t H�n Th�n Ki�m, r�t nhi�u ng��i v� mu�n ��t ���c thanh ki�m n�y m� �� b� m�ng ho�ng tuy�n, ng��ic� gan �i �o�t l�y thanh b�o ki�m n�y kh�ng?",2,"�� t� ch�p nh�n th� 1 phen. /L40_get_yes","�� t� v� c�ng y�u k�m, s� kh�ng l�m n�i chuy�n n�y /L40_get_no")
		elseif (UTask_kl >= 50*256) then
			Talk(1,"","B�o ki�m ��n tay, tr��c h�t l� tr� kh� l�o s� huynh ��ng gh�t, sau �� l� ti�u di�t t�n s� �� hay c�n tr�. ch� c�n ��i 1 c� h�i..Ha! Ha! Ha! ")
		else
			Talk(1,"","Ch� c�n Huy�t H�n Th�n Ki�m ��n tay, ta s� c� th�....Ha! Ha! Ha! ")
		end
	else
		Talk(1,"","C�n L�n ph�i ch�ng ta r�t �o�n k�t th��ng y�u nhau. ��c bi�t l� ta v� ch��ng m�n Tuy�n C� T�, Ng�c Ho�nh T��")
	end
end;

function L40_get_yes()
	Talk(1,"","Ch� c�n l�y ���c Huy�t H�n Th�n Ki�m, ta s� th�ng c�p ng��i th�nh �� t� c�p 40!")
	SetTask(9,40*256+10)
	AddNote("Nh�n nhi�m v� c�p 40 C�n L�n ph�i: T�i ��nh Ki�n T�nh �o�t l�y thanh Huy�t H�n b�o ki�m. ")
	Msg2Player("Nh�n nhi�m v� c�p 40 C�n L�n ph�i: T�i ��nh Ki�n T�nh �o�t l�y thanh Huy�t H�n b�o ki�m. ")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(1,"","�a t� H� ph�p! ")
	DelItem(9)
	SetTask(9,50*256)
	SetRank(23)
--	AddMagic(175)
--	AddMagic(181)
	add_kl(50)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng B�n! �� ���c th�ng c�p th�nh C�n L�n ph�i Th�i Vi H� Ph�p! H�c ���c v� c�ng Khi H�n Ng�o Tuy�t, Kh� T�m ph� ")
	AddNote("�o�t ���c Huy�t H�n Th�n Ki�m, ho�n th�nh nhi�m v� c�p 40 c�a C�n L�n ph�i, th�ng ti�n th�nh Th�i Vi H� Ph�p. ")
end;
