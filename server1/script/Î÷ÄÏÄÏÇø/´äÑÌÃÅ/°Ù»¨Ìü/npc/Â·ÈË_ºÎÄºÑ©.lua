-- ������ ��ĺѩ 30������
-- by��Dan_Deng(2003-07-26)
-- update: Dan_Deng(2003-08-07)
-- update by xiaoyang (2004\4\20)

Include("\\script\\global\\skills_table.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(5) == 1 then
		allbrother_0801_FindNpcTaskDialog(5)
		return 0;
	end
	UTask_cy = GetTask(6)
   Uworld121 = GetTask(121)
	if (GetSeries() == 2) and (GetFaction() == "cuiyan") then
		if (UTask_cy == 30*256+40) and (HaveItem(2) == 1) and (HaveItem(3) == 1) and (HaveItem(4) == 1) then
			L30_prise()
		elseif ((UTask_cy == 30*256) and (GetLevel() >= 30)) then		--30����������
			Talk(1,"L30_get","Tr��c ��y kh�ng l�u ta c� duy�n may g�p m�t lo�i hoa tr� g�i l� ' V� Y Ngh� Th��ng', lo�i hoa tr� n�y v� c�ng qu� hi�m v� kh� tr�ng. N�u nh� kh�ng n�m v�ng ���c b� quy�t, th� r�t kh� th�nh c�ng, ta b�y gi� �ang lo l�ng ��y! ")
		elseif (UTask_cy > 30*256) and (UTask_cy < 40*256) then
			Talk(1,"","Th� n�o? �ng ta �� n�i v�i ng��i c�ch tr�ng 'V� Y Ngh� Th��ng' ch�a?")
		elseif (UTask_cy >= 40*256) then
			Talk(1,"","V� Y Ngh� Th��ng r�t mau ra hoa, ��n l�c �� c�ng nhau xem hoa tr�! ")
		else
			Talk(1,"","�ng �y c�ng th�ch xem hoa tr� sao?")
		end
	elseif(Uworld121 == 10) and (HaveItem(373) == 1) then		--�ж������Ƿ������Լ�������ʱ������СȪ����
		Talk(8,"Uworld121_lose","H� Ti�n T�! � ��y c� 1 c�y k�o Tr��ng Ti�u Tuy�n.","C�m �n!","��ng kh�ch s�o! ���c th�y di�n m�o c�a Ti�n T� l� vinh h�nh c�a t�i h�."," (B�n v�n ph�i ti�p t�c n�i, th�y M� Tuy�t vung k�o l�n, gi�ng nh� V�n T� ph�t k�o nhi�u l�n) ","H� c� n��ng! C� � ��y l�m g�?"," Ta v� ng��i v�n kh�ng quen bi�t nhau, ng��i l�i b�ng l�ng nh�n l�i �i xa ng�n d�m �em k�o t�ng ta, c�n �ng �y th� sao?","�ng ta l� ai?",".....C� th� gi�p M� Tuy�t th�m m�t chuy�n ���c kh�ng?")
	elseif(Uworld121 == 10 ) then										--�������������û��������߼���
		Talk(1,"","C�y k�o n�y l� ta nh� Tr��ng Ti�u Tuy�n s� b� ch�u kh� r�n cho ta, ng��i xem c� ph�i �� �� � ch� �ng ta hay kh�ng?.")
	elseif (Uworld121 == 20) and (HaveItem(10) == 0) then		-- ͷ������
		AddEventItem(10)
		Msg2Player("L�i t�m ���c m�t ch�m t�c ")
		Talk(1,"","Qu�n mang theo t�c r�i.")
	elseif (Uworld121 >= 20) and (Uworld121 < 30) then			--��������Ի�ǰ
		Talk(1,"","Hy v�ng ng��i chuy�n l�i gi�m M� Tuy�t. Xin �a t�!")
	elseif(Uworld121 == 30) then
		Talk(8,"Uworld121_Step4","H� c� n��ng!","Kh�ng c�n n�i n�a! Ta hi�u r�i.","H� c� n��ng �� hi�u l�m r�i, C�n L�n m�u �� b� v��ng, D��ng H�u s� ��i m�i vi�c k�t th�c r�i s� l�n Thu� Y�n M�n g�p n�ng.","H�n th�t s� c� ��p �ng y�u c�u c�a ta kh�ng?",".....Vi�c n�y th� �ng ta kh�ng n�i.","Ha ha ha! H� M� Tuy�t �i H� M� Tuy�t, t�i sao ng��i l�i m� m�ng h�o huy�n nh� v�y?","H� c� n��ng.....","Ng��i ta sinh ra th� ch�a c� ta, ��n l�c c� ta th� ng��i �� gi�! �i!.....")
	elseif(Uworld121 == 40) and (HaveItem(376) == 0) then
		Talk(1,"","Ch�a c� l�y kh�n th�u, Kh�u Anh ch�c l� kh�ng �� � ��n c� n��ng r�i.")
		AddEventItem(376)
		Msg2Player("�o�t l�i kh�n th�u. ")
	else
		Talk(1,"","T�m nguy�n l�n nh�t c�a ta l� tr�ng ���c hoa tr� ��p nh�t thi�n h�.")
	end
end;

function L30_get()
	Say(" Nghe n�i � th�nh ��i L� c� m�t ng��i tr�ng hoa h� �o�n, bi�t tr�ng hoa tr�. Nh�ng m� t�nh t�nh h�n k� l�, c� r�t nhi�u ng��i ��n th�nh gi�o, nh�ng ��u ph�i u�ng c�ng quay v�.",2,"�� ta ngh� c�ch gi�p ng��i t�m c�ch /L30_get_yes","M�i ng��i ��u �ang g�p tr� ng�i, e r�ng ta c�ng kh�ng c� c�ch n�o kh�c. /L30_get_no")
end;

function L30_get_yes()
	Talk(1,"","Th�t c�m �n ng��i!")
	SetTask(6,30*256+10)
	AddNote("G�p �o�n l�o n�ng � th�nh ��i L� �� th�nh gi�o ph��ng ph�p nu�i d��ng V� Y Ngh� Th��ng. ")
	Msg2Player("G�p �o�n l�o n�ng � th�nh ��i L� �� th�nh gi�o ph��ng ph�p nu�i d��ng V� Y Ngh� Th��ng. ")
end;

function L30_get_no()
end;

function L30_prise()
	Talk(1,"","Ho� ra v�n c�n b� quy�t nh� v�y, �a t� ti�u mu�i! Ta phong mu�i l� Nh�t Ph�m Hoa S�.")
	SetTask(6,40*256)
	SetRank(34)
	DelItem(2)
	DelItem(3)
	DelItem(4)
--	AddMagic(105)
--	AddMagic(113)
	add_cy(40)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng b�n! �� ���c phong th�nh Nh�t Ph�m Hoa S�! H�c xong v� c�ng V� �� L� Hoa, Ph� V�n T�n Tuy�t. ")
	AddNote("�o�t ���c b� quy�t tr�ng hoa V� Y Ngh� Th��ng, ho�n th�nh nhi�m v�, ���c phong l�: Nh�t Ph�m Hoa S�. ")
end;

function Uworld121_lose()
	Talk(5,"","C� n��ng c� n�i.","Xin ng��i h�y ��a m� t�c n�y cho H�u S� D��ng H� c�a Thi�n V��ng Bang, n�i v�i �ng �y r�ng n�u tr��c th�ng 7 �ng �y kh�ng ��n Thu� Y�n m�n th� t� ��y v� sau ta v� h�n xem nh� kh�ng c�n c� h�i g�p l�i.","Qu� nhi�n l� D��ng H�! D��ng H�u S� v�n t�i v� ��c ch� l� s� l�a ch�n nh�t th�i, l� nh�n trung long ph�ng. H� c� n��ng xin ngh� l�i.","Ng��i c�ng kh�ng mu�n gi�p ta? Hu hu...."," ���c r�i! Ta �i.")
	DelItem(373)
	AddEventItem(10)
	Msg2Player("Nh�n l�i H� M� Tuy�t, gi�p c� �y chuy�n l�i ��n D��ng H�, nh�n ���c m�t kh�c l�a c�a H� M� Tuy�t. ")
	AddNote("Nh�n l�i H� M� Tuy�t, gi�p c� �y chuy�n l�i ��n D��ng H�. ")
	SetTask(121,20) --�����������Ϊ20
end

function Uworld121_Step4()
	Talk(4,"Uworld121_sijin",".....�.","Tuy h�n b�t nh�n nh�ng ta c�ng kh�ng th� b�t ngh�a. � ��y c� m�t c�i kh�n th�u, ng��i h�y d�t h�n �i t�m Kh�u Anh C�n L�n ph�i. Xem nh� ta gi�p h�n l�n cu�i c�ng.","V�y ta �i.....mong Ti�n c� ngh� l�i."," ��ng nhi�u l�i!")
end

function Uworld121_sijin()
	AddEventItem(376)
	Msg2Player("Nh�n chi�c kh�n th�u. ")
	AddNote("Nh�n ���c chi�c kh�n th�u c�a H� M� Tuy�t, �em �i t�m Kh�u Anh c�a C�n L�n ph�i. ")
	SetTask(121,40) --�����������Ϊ40
end
