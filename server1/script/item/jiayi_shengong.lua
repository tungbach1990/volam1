
-- ====================== �ļ���Ϣ ======================

-- ������Եonline ת������ ��������������ƪ ����
-- FileName: jiayi_shengong.lua
-- Edited: �ӷ���
-- 2007-03-30	20:14:00

-- ======================================================

Include("\\script\\task\\metempsychosis\\task_func.lua")

function main()
	
	if (check_zhuansheng_level() == 1) then
		
		if (GetTask(TSK_ZHUANSHENG_FLAG) == 0) then
			Msg2Player(format("�� h�c ���c %s, v� c�n ph�i h�c %s m�i c� th� c�ng th�nh danh to�i ���c.", "<B�c ��u Tr��ng Sinh Thu�t - C� S� Thi�n>", "<B�c ��u Tr��ng Sinh Thu�t - T�m Ph�p Thi�n>"));
			Say(format("�� h�c ���c %s,  nh�ng v� c�ng v�n ch�a ���c n�ng c�p, xem ra trong ��y v�n c� �i�u  b� �n v�n ch�a kh�m ph� ra. C� th� ��n %s<color=yellow> %s<color> t�m hi�u tin t�c th� xem.", 
							"<B�c ��u Tr��ng Sinh Thu�t - C� S� Thi�n>", "Minh Nguy�t Tr�n", "B�c ��u L�o Nh�n"), 0);
			
			SetTask(TSK_ZHUANSHENG_FLAG,1);
			
			WriteLog(format("[Nhi�m v� tr�ng sinh]\t%s\tName:%s\tAccount:%s\t C�p b�c h�c:%d, M�n ph�i:%d",
						GetLocalDate("%Y-%m-%d %X"),GetName(), GetAccount(),
						GetLevel(), GetLastFactionNumber()));
			return 0;
		else
			Msg2Player("�� h�c <B�c ��u Tr��ng Sinh Thu�t - C� S� Thi�n> r�i, ch� c�n h�c th�m <B�c ��u Tr��ng Sinh Thu�t - T�m Ph�p Thi�n> l� c� th� c�ng th�nh danh to�i ���c r�i.");
			return 1;
		end
	
	end
	return 1;
end
