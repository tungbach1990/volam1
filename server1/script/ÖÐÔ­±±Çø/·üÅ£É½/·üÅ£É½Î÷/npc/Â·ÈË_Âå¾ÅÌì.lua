-- ��ԭ���� ��ţɽ ��ţɽ�� ·��_�����.lua����ȭ����������(Ұ��ȭ����)��
-- By: Dan_Deng(2004-05-24)

Include("\\script\\global\\repute_head.lua")

function main(sel)
	Uworld75 = GetTask(75)
	U75_sub1 = GetTask(52)
	U75_sub2 = GetTask(53)
	U75_sub3 = GetTask(54)
	U75_sub4 = GetTask(55)
	U75_sub5 = GetTask(56)
--	if (Uworld75 < 10) and (GetLevel() >= 30) and (GetCamp() == 0) and (GetReputeLevel(GetRepute()) >= 3) then		-- ��������
--		Talk(10,"U75_get","����죺ȭ���죬�Ʒ��أ�ָ���ġ�Ϧ����ս��Ұ������һȭ�����������������������ʱ����֮����ӿ���ƾ��������Σ�ȭ�����£�����������£�ȭ��Ұ��","��ң�������ݸո������ʲô������Ϊ���������徭�д�δ��ʶ��","����죺�ǣ�С����֪������ǰ�������񻰡�ȭ���������µ��Դ���","��ң���������˵ǰ�����������еġ�һǹ��������׷����ʹɱ��ǹ������֪������˵��������֮�������ƣ�","����죺����������������С���������������ԡ����ϵ�����۶ɺ�����������ս��������������Ȼ������Ұ��ȭ�������о�ɱ������ʵΪ�Ž��һ�ˣ����Ǻεȵĺ��£���С��ǹ������������������Ӱ�Ӷ�û������","��ң�û�뵽�����л���������������Ϊ�δ�δ��˵��","����죺����������Ϊ�أ�����������������С�����̨�г��֡����ο�����ȭ�����º󣬽����ڵ��ĵ����ѣ��̻̲������ա���ʮ���̫ƽʢ��������ֵ���������ٳ�ȭ��","��ң���Ȼ��������У���֪���������ô���ȭ�����䡣","����죺������ĳ��������ʦ���ӣ�Ҳ��ϰ��Ƥë��","��ң��������������ң�")
	if (Uworld75 == 10) and (U75_sub1 == 20) and (U75_sub2 == 20) and (U75_sub3 == 20) and (U75_sub4 == 20) and (U75_sub5 == 20) and (HaveItem(384) == 1) then			-- �������
		DelItem(384)
		Talk(2,"U75_prise","H�o ti�u t�! Qu� nhi�n ta kh�ng nh�n l�m ng��i! ��n ��y n�o! H�c nhanh th�i."," V� h�c nh�t ��o, thi�n ngo�i h�u thi�n. Ng��i ph�i kh�ng ng�ng luy�n t�p, b�n c�nh c� c�i bia th� c�ng phu c� th� th� c�ng l�c. Ch� c�n tung m�t quy�n c� th� ��nh v� n�, l�c �� quy�n n�ng c�a ng��i �� thu�c v�o b�c th�n ti�n c�a thi�n h� r�i. ")
	elseif (Uworld75 == 10) and (HaveItem(384) == 0) then			-- �����У��Ŷ���
		AddEventItem(384)
		Msg2Player("L�i nh�n ���c b�c th� gi�i thi�u c�a L�c C�u Thi�n. ")
		Talk(1,"","C� l�m m�t th� n�y, sao c� th� l�m chuy�n l�n ���c? Th�i ���c, cho ng��i th�m m�t c� h�i n�a, ta vi�t l�i m�t b�c th� kh�c cho ng��i, nh� ��ng l�m m�t n�a nh�!")
	elseif (Uworld75 == 10) then
		Talk(1,""," Tr��c ti�n ng��i ph�i v��t qua n�m s� �� kh�c, ta m�i c� th� d�y cho ng��i!")
	elseif (Uworld75 == 255) then
		Talk(1,""," D� C�u Quy�n ph�i luy�n t�p h�ng ng�y m�i c� th� luy�n th�nh t�i ���c, ng��i c�n c� l�ng nh�n n�i.")
	else
		Talk(1,""," Quy�n Ph�p Thi�n, Ch��ng Ph�p ��a, Ch� Ph�p T�m. Quy�n Ph�p....kh� nh� qu�!")
	end
end;

function U75_get()
	Say(" B� quy�n ph�p n�y kh�ng th� c�ng luy�n t�p v�i c�c chi�u n�i c�ng kh�c. N�u ng��i mu�n gia nh�p v�o c�c m�n ph�i kh�c, th� kh�ng th� h�c ���c. Ng��i �� c�n nh�c k� ch�a?",2,"Ta �� ngh� k� r�i, h�y cho ta h�c D� C�u Quy�n. /U75_get_yes","�� ta suy ngh� l�i!/no")
end

function U75_get_yes()
	Talk(5,"U75_go","T�i mu�n h�c D� C�u Quy�n, kh�ng mu�n nh�p ph�i kh�c."," Ha ha! ��ng l� Thi�n t� k� t�i! Ta th�y g�n c�t ng��i r�t kh�e, th�t hi�m c� tr�n ch�n giang h�. Nh�ng t�t ph�i nh� ��n c�c huynh �� kh�c m�i c� th� d�y ng��i ���c.","�a t� S� ph�! ","� ��y ta c� m�t b�c th�, ng��i �em ��n Th�nh ��, ��i L�, Ph��ng T��ng, Bi�n Kinh t�m Ph��ng Th�ch, Hoa N�ng, Th�i ��i th�c, Ph� Nam B�ng v� Tr��ng Tu�n. N�m ng��i n�y c� v� ��u �� ��ng � cho ng��i luy�n t�p k� n�ng n�y. ","V�ng! S� b�.")
end

function U75_go()
	Talk(1,""," ���ng �i r�t hi�m tr� kh� kh�n, ng��i n�n chu�n b� k�. T� x�a ��n nay nh�ng ng��i l�m n�n nghi�p l�n, ch�a ai l� ch�a t�ng n�m qua �au kh�. ")
	AddEventItem(384)				-- ����������
	SetTask(75,10)
	SetTask(52,0)					-- �ӱ�����ʼ��
	SetTask(53,0)
	SetTask(54,0)
	SetTask(55,0)
	SetTask(56,0)
	AddNote("Nh�n nhi�m v� Quy�n Khuynh Thi�n H�: C�m th� gi�i thi�u c�a L�c C�u Thi�n, �i Th�nh �� t�m ph��ng Th�ch, ��i L� t�m Hoa N�ng, Ph��ng T��ng t�m Th�i ��i th�c, Bi�n Kinh t�m Ph� Nam B�ng, L�m An t�m Tr��ng Tu�n, c�u h�c D� C�u Quy�n. ")
	Msg2Player("Nh�n nhi�m v� Quy�n Khuynh Thi�n H�: C�m th� gi�i thi�u c�a L�c C�u Thi�n, �i Th�nh �� t�m ph��ng Th�ch, ��i L� t�m Hoa N�ng, Ph��ng T��ng t�m Th�i ��i th�c, Bi�n Kinh t�m Ph� Nam B�ng, L�m An t�m Tr��ng Tu�n, c�u h�c D� C�u Quy�n. ")
end

function U75_prise()
	Talk(1,"","�� t� xin nh�n l�i ch� d�y.")
	DelItem(384)
	SetTask(75,255)
	AddRepute(30)
	if (HaveMagic(395) == -1) then		-- ����û�м��ܵĲŸ�����
		AddMagic(395)
	end
	AddNote("Nhi�m v� Quy�n Khuynh Thi�n H�: Nhi�m v� ho�n th�nh, h�c ���c k� n�ng D� C�u Quy�n, danh v�ng c�a b�n t�ng th�m 30 �i�m. ")
	Msg2Player("Nhi�m v� Quy�n Khuynh Thi�n H�: Nhi�m v� ho�n th�nh, h�c ���c k� n�ng D� C�u Quy�n, danh v�ng c�a b�n t�ng th�m 30 �i�m. ")
end

function no()
end
