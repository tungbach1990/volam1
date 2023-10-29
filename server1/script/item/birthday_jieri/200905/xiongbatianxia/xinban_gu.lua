-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ�ϰ� - �°��
-- �ļ�������xinban_gu.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-05-21 15:19:32

-- ======================================================

Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\lib\\awardtemplet.lua")

function main(nItemIdx)
	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIdx)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then
		Msg2Player("V�t ph�m qu� h�n s� d�ng, t� ��ng m�t �i.")
		return 0;
	end
	
	local bRet, szFailMsg = tbBirthday0905:IsPlayerEligible();
	
	if bRet ~= 1 then
		Talk(2, "", szFailMsg, "Ng��i ch�a �� �i�u ki�n �� nh�n v�t ph�m n�y");
		return 1;
	end
	
	if CalcFreeItemCellCount() < 10 then
		Talk(1,"", format("Ch� tr�ng h�nh trang kh�ng �� %d ch�, h�y s�p x�p l�i.", 10));
		return 1;
	end
	
	if tbBirthday0905.tbTask:get_task(tbBirthday0905.tbTask.tsk_zhuhe_maxexp) == 0 or tbBirthday0905.tbTask:get_task(tbBirthday0905.tbTask.tsk_zhuhe_maxexp) == nil then
		tbBirthday0905.tbTask:add_zhuhe_maxexp();
	end	
	
	if (tbBirthday0905.tbTask:get_task(tbBirthday0905.tbTask.tsk_zhuhe_curexp) >= tbBirthday0905.tbTask:get_task(tbBirthday0905.tbTask.tsk_zhuhe_maxexp)) then
		Msg2Player("�� nh�n kinh nghi�m gi�i h�n cao nh�t.");
		return 1;
	end
	
	local n_exp = tbBirthday0905.nxinbangu_addexp
	AddOwnExp(n_exp);
	tbBirthday0905.tbTask:add_task(tbBirthday0905.tbTask.tsk_zhuhe_curexp, floor(n_exp / tbBirthday0905.expbase));
	Msg2Player(format("Nh�n ���c kinh nghi�m kh�ng c�ng d�n %d.", n_exp ));
	
end
