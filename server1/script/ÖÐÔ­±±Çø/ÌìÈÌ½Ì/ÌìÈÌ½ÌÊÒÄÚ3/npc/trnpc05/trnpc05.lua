--description: ���̷̽�����������ѩ��
--author: yuanlan	
--date: 2003/5/19
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-14)
-- Update: xiaoyang(2004\4\12) ����90����������

Include("\\script\\global\\skills_table.lua")

Include("\\script\\item\\skillbook.lua")

function main()
	UTask_tr = GetTask(4);
	Uworld127 = GetTask(127)
	if(GetSeries() == 3) and (GetFaction() == "tianren") then
		if(UTask_tr == 30*256) and (GetLevel() >= 30) then
			Say("Ch� v�i ng�y n�a l� sinh nh�t M� ta - Ho�ng h�u n��c ��i Kim, b�n ���ng ch� d� ��nh t�ng M�u h�u m�t chi�c �o ng�c, nh�ng c�n thi�u b�n lo�i �� qu�: <color=Red>C�p Huy�t H�ng, B�ng Tinh Lam, T� M�u L�c, V�n M�ng T�<color>. Ta nghe n�i � <color=Red>T�n L�ng<color> c� r�t nhi�u ng�c qu�, ng��i c� mu�n gi�p ta �i t�m kh�ng?", 2, "Vinh h�nh l�m vi�c cho c�ng ch�a /L30_get_yes", "Thu�c h� v�n c�n m�t chuy�n kh�c. /L30_get_no")
		elseif(UTask_tr == 30*256+20) and (HaveItem(59) == 1) and (HaveItem(60) == 1) and (HaveItem(61) == 1) and (HaveItem(62) == 1) then
			L30_prise()
		elseif(UTask_tr > 30*256) and (UTask_tr < 40*256) then					--�Ѿ��ӵ�30��������δ���
			Talk(1,"","Ng��i c� th� nh� <color=Red>� ��n Ch�<color> ��a ��n <color=Red>T�n L�ng<color>, h�y nh� b�n lo�i �� qu� m� ta c�n <color=Red>C�p Huy�t H�ng<color>, <color=Red>B�ng Tinh Lam<color>, <color=Red>T� M�u L�c<color>, <color=Red>V�n M�ng T�<color>.")
		else					--�Ѿ����30��������δ��ʦ��ȱʡ�Ի���
			Talk(1,"","Ph� v��ng c�n ta gi�p ng��i thu ph�c V� l�m Trung Nguy�n, n�u Thi�n Nh�n gi�o kh�ng ���c s� �ng h� t� Ph� v��ng ta, th� kh�ng th� ph�t tri�n nh� th� n�y.")
		end
	elseif(Uworld127 == 10) and (HaveItem(374) == 1) then
		Talk(15,"Uworld127_killer","Cung k�nh Th�t c�ng ch�a �i�n h�.","Ng��i kia t� ��u ��n, t�i sao ��n ��y? Ng��i mu�n ch�t sao?","T�i h� kh�ng d�m �em t�nh m�ng m�nh ra ��a.","A! Ng��i to gan th�t. Ng��i ��u! K�o h�n ra cho ch� �n.","Nghe n�i c�ng ch�a �ang t�m ki�m m�t con ��i �i�u?","�m�.Ng��i bi�t � ��u c� sao?","Tuy t�i h� kh�ng bi�t, nh�ng ch� c�n ng�i ��p �ng m�t �i�u ki�n, ta s� c� ngay con ��!","�m�.L�i m�t t�n ch� bi�t n�i su�ng.","Binh m� ��i Kim h�ng h�u, sao kh�ng s� ch�t ���c? L�m sao ta d�m l�a Th�t c�ng ch�a?","�..Ng��i c�n �i�u ki�n g�?","Cho ��n l�c ta quay l�i, kh�ng ���c gi�t ng��i n�o trong ph�.","Th�t bu�n cu�i, n�u m�t n�m sau ng��i v�n ch�a quay l�i th� sao?","��m b�o ta s� quay l�i trong m�t th�ng.","���c! Qu�n t� nh�t ng�n. Sau m�t th�ng n�u kh�ng g�p ng��i, b�n ch�ng s� ch�t h�t!","S� kh�ng c� ng�y �� ��u.")
	elseif(Uworld127 == 10) then
		Talk(1,"","Kh�ng c� l�nh b�i m� ng��i d�m v�o ph� c�ng ch�a �? Qu� l� gan d�. Tha cho ng��i kh�ng c� �c �, mau ra kh�i ��y. L�n sau ��ng c� tr�ch.")
	elseif(Uworld127 == 20) and (HaveItem(374) == 0) then
		Talk(1,"","T�n ti�u t� n�y, mau c�t �i! Ch�y cho nhanh n�u kh�ng ta c�t ch�n ng��i b�y gi�!")
	elseif(Uworld127 == 30)and(HaveItem(369) == 1) then
		DelItem(369)
		Talk(6,"Uworld127_over","Tuy�t Y c�ng ch�a, ��y l� con ��i �i�u ng�i c�n.","T�t t�t! Ng��i qu� th�t kh�ng t�!","Nh�ng v�n c� nh�ng ng��i kh�ng bi�t g� ��i l�y ��u ta.","��ng t�nh to�n v�i b�n �y l�m g�, sau n�y ng��i ch� c�n theo ta l� ���c.","Xin th� l�i, t�i h� lang thang giang h� quen r�i. Kh�ng mu�n theo ai c�.",".....D�m n�i th� tr��c m�t ta, tr��c gi� ch� c� m�nh ng��i.")
	elseif(Uworld127 == 30) then
		Talk(1,"","con ��i �i�u ��u? L�y ���c r�i mau ��a ra ch�!")
	elseif(Uworld127 == 255) then
		if(GetSex() == 0) then
			Talk(1,"","H�o t� t�, l�n sau h�y ��n ch�i v�i Tuy�t Y.")
		else
			Talk(1,"","H�o huynh, l�n sau h�y ��n ch�i v�i Tuy�t Y.")
		end
	elseif(UTask_tr >= 70) then							--�Ѿ���ʦ
		Talk(1,"","Ng��i th�t l� nh�n t�i hi�m c�, hy v�ng ch�ng ta s� l� huynh �� ch� kh�ng ph�i k� th�, c� c� h�i ta s� ti�n c� ng��i v�i Ph� v��ng, ph�c v� cho ��i Kim ta, cho t�n ho�ng �� Nam tri�u kia ph�i ��n m�ng ch�?")
	else
		Talk(1,"","Gi�o ch� Thi�n Nh�n gi�o l� qu�c s� ��i Kim ta, Ph� v��ng r�t qu� tr�ng �ng ta, v� th� cho ta gia nh�p b�n gi�o l�m ���ng ch� nh� b�y gi�.")
	end
end;

function L30_get_yes()
	Talk(1,"","Phong ���ng ���ng ch� T�t qu�, nh�ng nghe n�i ���ng ��n T�n L�ng r�t nguy hi�m, nhi�u ng��i �i t�m ch�u b�u ph�i b� m�ng, ng��i c� th� ��n Bi�n Kinh �i xa phu, nh�ng <color=Red>� ��n Ch�<color> th�ng th�o khu v�c T�y B�c, ng��i c� th� nh� h�n ��a ng��i �i.")
	SetTask(4, 30*256+20)
	AddNote("T�i t�ng h�m th� 3 c�a Thi�n Nh�n gi�o g�p Phong ���ng ���ng ch� Ho�n Nhan Tuy�t Y (213, 201) , nh�n <color=red>nhi�m v� B�o Th�ch<color>. �i T�n L�ng t�m 4 lo�i �� qu�. ")
	Msg2Player("T�i t�ng h�m th� 3 c�a Thi�n Nh�n gi�o g�p Phong ���ng ���ng ch� Ho�n Nhan Tuy�t Y (213, 201) , nh�n <color=red>nhi�m v� B�o Th�ch<color>. �i T�n L�ng t�m 4 lo�i �� qu�. ")
end;

function L30_get_no()
	Talk(1,"","..........� ")
end;

function L30_prise()
	Talk(1,"","Ng��i th�t t�i, lo�i �� qu� th� n�y m� c�ng t�m ���c! M�u h�u h�n s� r�t th�ch chi�c �o ng�c!")
	SetRank(58)
	DelItem(59)
	DelItem(60)
	DelItem(61)
	DelItem(62)
	SetTask(4, 40*256)
--	AddMagic(141)
--	AddMagic(138)
--	AddMagic(140)
	add_tr(40)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("��a b�n lo�i �� qu� cho Phong ���ng ���ng ch� Ho�n Nhan Tuy�t Y, ho�n th�nh nhi�m v� B�o Th�ch. ���c phong: U Minh T� S�. H�c ���c v� c�ng: Li�t H�a T�nh Thi�n, Th�i s�n �i�n H�i, Phi H�ng V� T�ch. ")
	AddNote("Quay l�i Thi�n Nh�n gi�o, ��a b�n lo�i �� qu� cho Phong ���ng ���ng ch� Ho�n Nhan Tuy�t Y, ho�n th�nh nhi�m v� B�o Th�ch. Tr� th�nh U Minh T� S�. ")
end;

function Uworld127_killer()
	DelItem(374)
	SetTask(127,20)
	AddNote("Nh�n nhi�m v�: ��n Ki�m c�c b�t ��i �i�u ")
	Msg2Player("Nh�n nhi�m v�: ��n Ki�m c�c b�t ��i �i�u ")
end

function Uworld127_over()
	if (GetTask(4) >= 70*256) and (GetTask(4) ~= 75*256) then		-- �����̳�ʦ����
		Talk(2,"","H�m s�ch m�t c�a Thi�n Nh�n ta giao cho ng��i, n�u t� ch�i ta s� gi�t ng��i, quy�t kh�ng nu�t l�i.","�� nh� v�y, t�i h� kh�ng th� kh�ng nh�n l�i.")
		if (HaveMagic(361) == -1) then		-- ����û�м��ܵĲŸ�����
      	AddMagic(361,1)
		end
		if (HaveMagic(362) == -1) then		-- ����û�м��ܵĲŸ�����
   	   AddMagic(362,1)
		end
		if (HaveMagic(391) == -1) then		-- ����û�м��ܵĲŸ�����
	      AddMagic(391)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("��a ��i �i�u cho Ho�n Nhan Tuy�t Y, h�c ���c k� n�ng V�n Long K�ch, Thi�n Ngo�i L�u Tinh, Nhi�p H�n Lo�n T�m. Quay l�i b�o tin cho L�u l�o gia. ")
		SetTask(127,110)
	else
		Talk(1,"","���c!l�n sau nh� ��n th�m Tuy�t Y!")
		SetTask(127,100)
		Msg2Player("��a ��i �i�u cho Ho�n Nhan Tuy�t Y, quay l�i b�o tin cho L�u l�o gia ")
	end
end
