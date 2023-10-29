-- Խ������Ƭ���ջ
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\lib\\awardtemplet.lua")
tbBirthday0905_msg_award =
{
	[1]	= {szName="B� V��ng Th��ng", tbProp={6, 1, 2071, 1, 0, 0}, nCount = 2},
	[2]	= {szName="B� V��ng Th��ng", tbProp={6, 1, 2071, 1, 0, 0}, nCount = 1},
	[3]	= {szName="B� V��ng Th��ng", tbProp={6, 1, 2071, 1, 0, 0}, nCount = 1},
	[4]	= {szName="Thi�n T�n �ao", tbProp={6, 1, 2072, 1, 0, 0}, nCount = 1},
	[5]	= {szName="Thi�n T�n �ao", tbProp={6, 1, 2072, 1, 0, 0}, nCount = 2},
	[6]	= {szName="Thi�n T�n �ao", tbProp={6, 1, 2072, 1, 0, 0}, nCount = 3},
	[7]	= {szName="H� Nh�t Cung", tbProp={6, 1, 2073, 1, 0, 0}, nCount = 1 },
	[8]	= {szName="H� Nh�t Cung", tbProp={6, 1, 2073, 1, 0, 0}, nCount = 1},
};
tbBirthday0905_msg_tskgoal =
{
	500, 6,100,100,1,1,2,100,
};

function birthday0905_settask_message(nIdx)
	if (nIdx == 0) then
		return
	end
	
	if (GetLevel() < 120) then
		Say("D�ch Quan: ��i hi�p ch�a �� �i�u ki�n �� nh�n nhi�m v� n�y", 0);
		return
	end
	
	local ndate 	= tonumber(GetLocalDate("%y%m%d"));
	local ntskid 	= GetTask(tbBirthday0905.tbTask.tsk_msg_curtsk);
	local ntskdate	= GetTask(tbBirthday0905.tbTask.tsk_msg_date+nIdx); 
	if (ntskid == 0) then
		if (ntskdate ~= ndate) then
			Say("D�ch Quan: ��i hi�p h�y c� g�ng v��t qua th� th�ch n�y!", 0);
			SetTask(tbBirthday0905.tbTask.tsk_msg_curtsk, nIdx);
		else
			Say("D�ch Quan: ��i hi�p �� ho�n th�nh �� s� l��ng nhi�m v� trong ng�y h�m nay r�i. Ng�y sau h�y quay l�i nh�.", 0);
		end
	else
		if (ntskid == nIdx) then
			Say("D�ch Quan: ��i hi�p �� nh�n nhi�m v� n�y r�i.", 0);
		else
			Say("D�ch quan: M�t l�n ch�  c� th� nh�n ���c 1 nhi�m v� t�n s�.", 0);
		end
	end
end

function birthday0905_gettask_message(nIdx)
	local ndate 	= tonumber(GetLocalDate("%y%m%d"));
	local ntskid 	= GetTask(tbBirthday0905.tbTask.tsk_msg_curtsk);
	local ntskdate	= GetTask(tbBirthday0905.tbTask.tsk_msg_date+nIdx); 
	local ntskcount	= GetTask(tbBirthday0905.tbTask.tsk_msg_needcount);
	if (ntskid ~= nIdx) then
		Say("D�ch quan: Ng��i v�n ch�a nh�n nhi�m v� n�y.", 0);
		return
	end
	
	if (ntskcount < tbBirthday0905_msg_tskgoal[nIdx]) then
		Say("D�ch Quan: Ng��i kh�ng �� s�c m�nh v� l�ng tin �� v��t qua th� th�ch n�y sao?", 0);
		return
	end
	
	if (CalcFreeItemCellCount() < 10) then
		Say("D�ch quan: �� b�o ��m s� an to�n cho v�t ph�m, xin m�i h�y �� h�nh trang th�a 10 � tr�ng.", 0);
		return
	end
	
	SetTask(tbBirthday0905.tbTask.tsk_msg_curtsk, 0);
	SetTask(tbBirthday0905.tbTask.tsk_msg_date + nIdx, ndate);
	SetTask(tbBirthday0905.tbTask.tsk_msg_needcount, 0);
	Say("D�ch Quan: L�m t�t l�m, ��y l� ph�n th��ng x�ng ��ng d�nh cho ��i hi�p!", 0);
	tbAwardTemplet:GiveAwardByList(tbBirthday0905_msg_award[nIdx], "Hoat dong SNVLTK_Phan thuong nhiem vu tin su")
end

function birthday0905_cancel_message()
	local ntsk 	= tbBirthday0905.tbTask.tsk_msg_curtsk;
	if (GetTask(tbBirthday0905.tbTask.tsk_msg_curtsk) == 0) then
		Say("D�ch quan: Hi�n t�i ��i hi�p v�n ch�a nh�n nhi�m v� m�!", 0);
		return
	end
	SetTask(tbBirthday0905.tbTask.tsk_msg_curtsk, 0)
	SetTask(tbBirthday0905.tbTask.tsk_msg_needcount, 0);
	Say("D�ch quan: ��i hi�p �� h�y b� th�nh c�ng nhi�m v� hi�n t�i!", 0);
end