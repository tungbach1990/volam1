--��ԭ���� �꾩�� ·��6�׹��ӶԻ�

function main(sel)
	x = GetTask(12)
	Uworld123 = GetTask(123)
	if (x > 0) and (x < 256) and (HaveItem(231+x) == 1) and (GetLevel() >= 20) and (GetRepute() >= 20) then			-- �ȼ���20��������20�����������ź��ܶ�Ӧ�ϣ����Կ�ʼ����
		if (GetSex() == 0) then		-- ������н�ɫ
			Talk(2,"W12_sale_get","V� thi�u hi�p n�y phong th�i ung dung, l� ng��i b�t ph�m. Kh�p v�ng Ho�ng H� n�y ai c�ng bi�t ti�ng. B�n thi�u gia v�n c�ng ng��ng m� �� l�u. ","Gh�t. Ng��i mu�n g� th� c� n�i ra �i. ��ng c� r�o tr��c ��n sau n�a ")
		else
			Talk(2,"W12_sale_get","V� c� n��ng n�y xin ��p nh� hoa, chim sa nh�n l�c. Kh�p v�ng Ho�ng H� n�y ai c�ng bi�t ti�ng. B�n thi�u gia v�n c�ng ng��ng m� �� l�u. ","Gh�t. Ng��i mu�n g� th� c� n�i ra �i. ��ng c� r�o tr��c ��n sau n�a ")
		end
	elseif (Uworld123 == 20) and (HaveItem(379) == 1) then		-- �Ʋ�Ⱦ���������������ź�
		Talk(3,"Uworld123_step1","Th� c�a b�t Nhi�m c�ng t� cu�i c�ng �� ��n! �� ��i l�u qu� r�i, �� ta xem xem huynh n�i g�!","Th� ra l� v�y! Th�t hay qu�! Qu� l� tr�i kh�ng ph� l�ng ng��i! ��i ��, ta s� l�p t�c vi�t th� cho huynh �y!","Xong r�i! Xin chuy�n b�c th� n�y cho B�t Nhi�m c�ng t�.")
	elseif (Uworld123 == 30) and (HaveItem(380) == 0) then		-- �Ŷ���
		Talk(1,"","Ng��i l�m vi�c nh� th� �? Th� ch�a l�y m� �� v�i v�ng �i r�i?")
		AddEventItem(380)
		Msg2Player("Quay l�i �� nh�n th� c�a B�ch C�ng t� ")
	else
		Talk(1,"","Tr�m v�n thi�t m� c�a ch�ng ta m�t khi �� Nam h� th� b�n ng��i T�ng kia l�m sao c� th� ch�ng �� ���c? L�c �� th� c� giang s�n, g�m v�c v� m� n� c�a b�n ch�ng ��u thu�c v� b� t�c N� Ch�n c�a ta! ha ha ha! ")
	end
end;

function W12_sale_get()
	Say("N�u �� nh� v�y T�i h� xin n�i th�ng. Xin h�i ng��i c� th� cho ta xem b�c m�t h�m trong ng��i c�a ng��i kia ���c kh�ng? � ��y t�i h� c� 20000 l��ng g�i l� c� ch�t l�ng th�nh.",2,"Th� l�i. Ta ph�i nghe theo l�i d�n c�a D�ch quan, kh�ng giao b�c m�t h�m n�y cho ng��i kh�c /W12_sale_no","V�y n�u nh� ta t�ng ng��i 20000 l��ng b�c v� t�m �o da n�y th� th� n�o? /W12_sale_yes")
end

function W12_sale_yes()
	if (GetSex() == 0) then
		Talk(1,"","Huynh ��i ��ng l� ng��i r�ng r�i! Sau n�y khi ��i Kim c�ng ph� ���c L�m An nh�t ��nh s� m�i huynh ��n t� x� �� u�ng tr�! ")
	else
		Talk(1,"","C� n��ng th�t l� ng��i r�ng r�i!.Sau n�y khi ��i Kim c�ng ph� ���c L�m An nh�t ��nh s� m�i c� n��ng ��n t� x� �� u�ng tr�! ")
	end
	x = GetTask(12)
	DelItem(231 + x)		-- ɾ������
	SetTask(12,GetGameTime()+7200)			-- ����ʱ��2Сʱ������ظ���������
	Earn(20000)
	Msg2Player("Ng��i �em b�c m�t h�m c�a D�ch quan, b�n cho ng��i Kim. Danh ti�ng c�a ng��i �� b� gi�m xu�ng ")
	AddNote("Ng��i �em b�c m�t h�m c�a D�ch quan, b�n cho ng��i Kim. Danh ti�ng c�a ng��i �� b� gi�m xu�ng ")
	i = GetRepute()
	if (i >= 20) then			-- ������20�㣬����20�Ϳ۹⣨С��10�Ļ�ǰ�����趨��������
		AddRepute(-1 * 20)
	else
		AddRepute(-1 * i)
	end
end

function W12_sale_no()
	Talk(1,"","H� t�t ph�i c� ch�p nh� v�y?Nh�ng k� kh�ng hi�u ���c th�i th�, li�u c� �ch g�? T�n trung b�o qu�c kh�ng b�ng vinh hoa ph� qu� h��ng su�t ��i! Cho d� l� Nh�c Phi c�ng ��nh nu�t h�n � Phong Ba ��nh!")
end

function Uworld123_step1()
	AddEventItem(380)
	SetTask(123,30)
	DelItem(379)
	Msg2Player("Nh�n ���c th� c�a B�ch c�ng t� ")
end

function no()
end
