--description: ���ִ�_�Ŵ�Ԫ
--author: wangzg	
--date: 2003/7/22
--update 2003/7/28 yuanlan

function main()
	UTask_world44=GetTask(72)
	if (UTask_world44==2) then
		Talk(8,"","Huynh c� ph�i l� Tr��ng ��i Nguy�n kh�ng?"," L� ta ��y, c� chuy�n g� kh�ng?","Doanh Doanh c� n��ng nh� ta ��a cho huynh chi�c kh�n tay n�y, nh� ta n�i l�i, canh ba ��m nay, ch� c�, kh�ng g�p kh�ng v�.","C�i g�? Tr��ng ��i Nguy�n! Anh v�n c�n giao du v�i � th� may �y �?"," L�m g� c�? Ta ��u c� chuy�n g� v�i c� �y, n��ng t� h�y tin ta.","Nh�ng....."," N�y, ng��i ��ng t�y ti�n vu c�o ng��i t�t ch�!",".....�.")
		SetTask(72,4)
		Msg2Player("Kh�ng ng� ch� v� m�t chi�c kh�n tay g�m m� b� m�ng ch�i, quay l�i n�i v�i Doanh Doanh. ")
		AddNote("T�m th�y Tr��ng ��i Nguy�n, chuy�n l�i l�i c�a Doanh Doanh, kh�ng ng� anh ta l� ng��i �� c� v�, kh�ng ��a ���c chi�c kh�n tay uy�n ��ng, m� c�n b� ch�i. ")		
	elseif (UTask_world44==4)  then
		Talk(1,"","��ng t�y ti�n vu c�o ng��i t�t ch�!")
	else
		Talk(1,"","L�m ng��i th�t kh�ng d�, l�m ��n �ng c�ng kh�ng d�, l�m ng��i ��n �ng ��o hoa l�i c�ng kh� h�n.")
	end
end
