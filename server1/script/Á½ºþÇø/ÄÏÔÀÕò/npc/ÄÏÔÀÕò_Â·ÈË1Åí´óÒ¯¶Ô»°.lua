-- ������·�ˡ����ү (���Ա�������)
-- 2004/4/17 ���Ա������� by fangjieying

Include("\\script\\global\\repute_head.lua")

function main()
	Uworld76 = GetTask(76)
--	if (GetLevel() >= 60) and (Uworld76 == 0) then       -- ������������
--		Talk (8,"","��ң��ϴ�ү�����Ĳ�����һ�ڱ�������������ȫ�ް���","���ү��������˵��С�϶���ʮ��Ĺ��򣬶������������ˡ�","��ң����¾��걼���������ն�֮������������ȵ��������裬������һ���","���ү��Ī�����ǽ������ˣ�","��ң������ϴ�ү����Ŀ����档","���ү����ѽ��̫���ˡ�С�ֵܣ��Ҽ���Ӣ�����ˣ����ǽ������ѡ�С�϶�����һ�����������æ�����ܳ�����������֮��Ҳ�Կɽ⡣","��ң���ү����Ī��ɷС�ӣ����¾���˵��","���ү��С�ֵܿ��������ƥ��")
--		SetTask(76,10)
--		Msg2Player("̽�����ү��ߵ���")
	if (Uworld76 == 10) then
		Talk (1,"","�ng h�y xem con ng�a b�n c�nh ta n�y. ")
	elseif (Uworld76 == 20) then
		SetTask(76,25)
		Talk (3,"W76_get","M�u l�ng thu�n khi�t, k� li�t nh� ho�, b�n v� kh�e m�nh, ch�y nhanh nh� bay. ��y l� con ng�a tuy�t v�i. ","Ng��i th�t l� c� m�t nh�n, con B�n H�a n�y l� c�a m�t ti�u l�o ��. Sau khi �ng �y qua ��i th� do ta thay th� ch�m s�c. Ch� ti�c l� c�ch ��y kh�ng l�u, Ho� Nhi m�c b�nh n�n ng�y c�ng y�u, c�n ph�i nhanh ch�ng tr� li�u. ","�i. ��ng ti�c t�i h� kh�ng ph�i l� th�y thu�c, kh�ng �� s�c gi�i quy�t. ")
	elseif (Uworld76 == 25) then				-- �жϺ��ؽ�����Ĵ���
		Talk(1,"W76_get","Th� n��? ��ng � gi�p l�o kh�ng?")
	elseif (Uworld76 == 60) then
		Talk(1,"W76_prise","Qu� nhi�n �� ch�a l�nh, kh�ng bi�t ta ph�i t� �n ng��ith� n�o ��y!")
	elseif (Uworld76 == 30) then				-- ���������
		if (HaveItem(393) == 0) then         -- ���Ŷ�ʧ����
			Talk (1,"","Kh�ng ng� ti�u huynh �� l�i b�t c�n th�, th�i ���c r�i �� ta vi�t l�i b�c th� v�y. ")
			AddEventItem(393)			-- ͨ������
		else
			Talk (1,"","Ti�u huynh ��, b�nh c�a B�n Ho� kh�ng th� ��i l�u ���c n�a ph�i nhanh l�n th�i ")
		end
	elseif (Uworld76 == 70) then			-- �����Ѿ����
		Talk(1,"","Tuy B�n Ho� kh�ng bi�t n�i nh�ng ta nh�n th�y n� r�t nh� ng��i")
	else
		Talk(1,"","B�n r�! Kh�ng c� vi�c g� th� n�n h�c m�t ch�t ngh� nghi�p, kh�ng n�n c� ng�y v�c ki�m ch�m ch�m gi�t gi�t. ")
	end
end

function W76_get()
	Say("Kh�ng c�n ti�u huynh �� ra tay. L�o H�n c� quen m�t ng��i, y thu�t tinh th�ng, ch� b� tay v�i nh�ng ch�ng b�nh qu� nghi�m tr�ng, l�i kh�ng t�m ���c ng��i ��ng tin c�y. Mong ng��ic� th� gi�p l�o m�t tay!",2,"Kh�ng c� v�n �� g�, nh�t ��nh s� l�m ���c /W76_get_yes","H�m nay ta c� vi�c, hay l� �� l�n sau /no")
end

function W76_get_yes()                                        -- ��������
	Talk(2,"","���c! Ta c� b�c th� n�y, n�m x�a ng��i �� �� ch�u �n ��c c�a l�o, ng��i h�y giao cho ng��i ��, �ng ta nh�t ��nh s� ��n. Sau khi tr� xong cho B�n H�a, ta s� xin �ng ta d�y cho ng��i thu�t 'H�i Th� �� Tinh'","D��c V��ng C�c? B� ��o Nh�n? Ha ha! Ti�u t� v� �ng ta c�ng c� duy�n ��y! L�n n�y nh�t ��nh s� ���c, n�u kh�ng s� kh�ng c�n m�t m�i �� g�p �ng.")
	SetTask(76,30)
	AddEventItem(393)			-- ͨ������
	Msg2Player("Nh�n ���c m�t b�c th� ch� B�nh ��i Gia, �i ��n D��c V��ng C�c c�u s�ng con ng�a qu� B�n Ho� ")
	AddNote("Nh�n ���c m�t b�c th� ch� B�nh ��i Gia, �i ��n D��c V��ng C�c c�u s�ng con ng�a qu� B�n Ho� ")
end

function W76_prise()
	Talk(1,"","B�nh ��i Gia kh�ng c�n kh�ch kh�, ta c�ng nh� �� m� h�c ���c �t nhi�u b�n l�nh, c�ng ���c l�i ph�n n�o")
	SetTask(76,70)
	add_repute = ReturnRepute(40,70,3)			-- �������������40�㣬��70����ÿ���ݼ�3%
	AddRepute(add_repute)
	Msg2Player("Nhi�m v� ho�n th�nh, danh v�ng c�a b�n ���c t�ng l�n "..add_repute.."�i�m.")
	AddNote("Ch�a kh�i b�nh cho con ng�a B�n Ho�, ho�n th�nh nhi�m v� ")
end

function no()
end
