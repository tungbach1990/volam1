-- Խ������Ƭ���ջ
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");

function guoguan_xunbao()
	Say("Nhi�p Th� Tr�n: T� 19/06/2009 ��n 24:00 19/07/2009 ��i hi�p c� th� ti�p nh�n nhi�m v� �Qu� quan t�m b�o� t� ta.Sau khi nh�n nhi�m v�, khi ��i hi�p tham gia �V��t �i cao c�p� s� c� th� nh�n ���c t�n v�t khai m�n �H�ng T�m Ki�m�, �H�ng T�m Ki�m� nh�n ���c n�y  c� s� l��ng nhi�u hay �t t�y thu�c v�o vi�c ��i hi�p c� th� v��t qua ���c �i 15, 20, 25 hay 29.", 3,
		"Nh�n nhi�m v� �Qu� quan t�m b�o�/gettask_chuangguan",
		"Ta ��n tr� nhi�m v� �Qu� quan t�m b�o�/fullfilltask_chuangguan",
		"Ta ch� ��n xem./OnCancel");
end

function gettask_chuangguan()
	if (GetLevel() < 90) then
		Say("Nhi�p Th� Tr�n: ��i hi�p ch�a �� �i�u ki�n �� nh�n nhi�m v� n�y.", 0);
		return
	end
	
	if (GetTask(tbBirthday0905.tbTask.tsk_toll_cg_state) == 1) then
		Say("Nhi�p Th� Tr�n: ��i hi�p �� nh�n nhi�m v� n�y r�i.", 0);
		return
	end
	
	Say("Nhi�p Th� Tr�n: T�t qu�, ch�c ��i hi�p tham gia v��t �i th�nh c�ng.", 0);
	SetTask(tbBirthday0905.tbTask.tsk_toll_cg_state, 1);
	SetTask(tbBirthday0905.tbTask.tsk_toll_cg_passcount, 0);
end

function fullfilltask_chuangguan()
	if (GetTask(tbBirthday0905.tbTask.tsk_toll_cg_state) == 0) then
		Say("Nhi�p Th� Tr�n: ��i hi�p v�n ch�a nh�n nhi�m v� \"Qu� quan t�m b�o\".", 0);
		return
	end
	
	if (CalcFreeItemCellCount() < 10) then
		Say("Nhi�p Th� Tr�n: �� b�o ��m s� an to�n cho v�t ph�m, xin m�i h�y �� h�nh trang th�a 10 � tr�ng.", 0);
		return
	end
	
	local nToll = GetTask(tbBirthday0905.tbTask.tsk_toll_cg_passcount);
	if (nToll < 15) then
		Say("Nhi�p Th� Tr�n: Ng��i kh�ng th� ho�n th�nh nhi�m v� n�y �?", 0);
		return
	end
	
	local nAwardCount = 0;
	if (nToll >= 29) then
		nAwardCount = 5;
	elseif (nToll >= 25) then
		nAwardCount = 3;
	elseif (nToll >= 20) then
		nAwardCount = 2;
	else
		nAwardCount = 1;
	end
	Say("Nhi�p Th� Tr�n: T�t l�m, ��y l� ph�n th��ng x�ng ��ng d�nh cho ��i hi�p!", 0);
	Msg2Player(format("Nh�n ���c %d H�ng T�m Ki�m.", nAwardCount));
	SetTask(tbBirthday0905.tbTask.tsk_toll_cg_state, 0);
	SetTask(tbBirthday0905.tbTask.tsk_toll_cg_passcount, 0);
	for i = 1, nAwardCount do
		AddItem(6, 1, 2070, 1, 0, 0);
	end
end

function OnCancel()

end