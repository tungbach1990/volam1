--description: ���ִ�_����
--author: wangzg	
--date: 2003/7/21
--update 2003/7/25 yuanlan
-- Update: Dan_Deng(2003-08-07)
-- Update: Dan_Deng(2003-09-20)

function main()
	UTask_world69=GetTask(69)
	if (UTask_world69 == 2) and (HaveItem(190) == 1) then
		Talk(4,"W69_step1","Xu�n H��ng c� n��ng! C� ng��i nh� ta mang giao cho c� m�n n�y","C�i n�y...l� ai ��a cho ng��i v�y?","C� n��ng ngh� nh� l�i xem! Nh�t ��nh l� s� bi�t ai l� ng��i ��a m�n �� n�y.","N�u v�y th�...ng��i �y th��ng ��c c�u th� 'Y ��i thi�n khoan chung b�t h�i' nh�ng anh ta kh�ng bi�t t�c gi� Li�u V�nh c� t�n g�i l� g�, ��ng kh�ng?")
	elseif (UTask_world69 == 6) then
		Say("Anh ta s� tr� l�i th� n�o? T�c gi� Li�u V�nh c�a c�u th� 'Y ��i thi�n khoan chung b�t h�i' c�n g�i l� g�?",4,"Li�u Th�t Bi�n /W69_false","Li�u Bi�n /W69_false","Li�u Th�t /W69_true","Li�u Tam Bi�n /W69_false")
	else
		Talk(1,"","Ta t� nh� �� � ��y, l�n l�n � ��y. Tr��c gi� ch�a bi�t th� gi�i b�n ngo�i ra sao.")
	end
end;

function W69_step1()
	DelItem(190)
	SetTask(69,4)
	AddNote("Mang hoa sen giao cho Xu�n H��ng truy�n ��t t�m � c�a L� D� ��i v�i n�ng ta. Xu�n H��ng m�t �� thi: Y ��i thi�n khoan chung b�t h�i, t�c gi� Li�u V�nh c�a c�u th� tr�n c�n ���c g�i l� g�?  ")
	Msg2Player("Mang hoa sen giao cho Xu�n H��ng truy�n ��t t�m � c�a L� D� ��i v�i n�ng ta. Xu�n H��ng m�t �� thi: Y ��i thi�n khoan chung b�t h�i, t�c gi� Li�u V�nh c�a c�u th� tr�n c�n ���c g�i l� g�?  ")
end

function W69_true()
	Talk(1,"","���c r�i! H�y n�i v�i huynh �y: ng�y mai ��n nh� ta l�m kh�ch!")
	SetTask(69,8)
	AddNote("Tr� l�i ch�nh x�c, Xu�n H��ng nh� chuy�n l�i m�i L� D� mai ��n nh� c� �y ch�i. ")
	Msg2Player("Tr� l�i ch�nh x�c, Xu�n H��ng nh� chuy�n l�i m�i L� D� mai ��n nh� c� �y ch�i. ")
end

function W69_false()
	Talk(1,"","Sai r�i! Cho huynh �y th�i gian �� suy ngh�!")
	Msg2Player("Ng��i tr� l�i sai r�i, c� l�n, ��ng �� m�i th�m t�nh c�a L� D� b� b� l�. ")
end
