-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ�ϰ� - ����β
-- �ļ�������longfeng_wei.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-05-21 12:05:35

-- ======================================================

Include("\\script\\event\\birthday_jieri\\200905\\class.lua");

function main()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	if 20090619 > nCurDate or nCurDate > 20090727 then	
		Talk(1, "", "Ho�t ��ng �� k�t th�c.");
		return 0;
	end
	
	if tbBirthday0905.tbTask:get_task(tbBirthday0905.tbTask.tsk_zhuhe_maxexp) == 0 or tbBirthday0905.tbTask:get_task(tbBirthday0905.tbTask.tsk_zhuhe_maxexp) == nil then
		tbBirthday0905.tbTask:add_zhuhe_maxexp();
	end	
	
	if (tbBirthday0905.tbTask:get_task(tbBirthday0905.tbTask.tsk_zhuhe_maxexp) == tbBirthday0905.tbTask.nmaxexpfromzhuhe) then
		tbBirthday0905.tbTask:add_zhuhe_maxexp();
		Msg2Player("N�ng c�p thu ���c gi�i h�n kinh nghi�m c�a hai v�t ph�m [T�n B�n C�] v� [T�n B�n K�] l� 3000000000 Exp")
	else
		
		Talk(1, "", "Kh�ng ���c s� d�ng v�t ph�m n�y.");
		return 1;
		
	end
end

