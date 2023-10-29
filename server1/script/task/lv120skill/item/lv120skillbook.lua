-- 120����������120��������

Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\item\\skillbook.lua")

function main(idxItem)
	
	if GetLastFactionNumber()==-1 then	
		Msg2Player("<color=yellow>Ch�a gia nh�p m�n ph�i, kh�ng th� h�c k� n�ng n�y!<color>");
		return 1;
	end;
	
	if GetLevel()<120 then
		Msg2Player("<color=yellow>��ng c�p ch�a �� 120, kh�ng th� h�c k� n�ng n�y!<color>");
		return 1;
	end;
	
	if GetTask(LV120_SKILL_ID)>0 then
		Msg2Player("<color=yellow>�� l�nh h�i ���c k� n�ng 120 r�i, c�n mu�n h�c th�m n�a sao?<color>");
		return 1;
	end;
	
	if (LearnSkillByBook(GetLastFactionNumber(), LV120SKILL_LIST) == 0) then
		SetTask(LV120_SKILL_ID, LV120SKILL_LIST[GetLastFactionNumber()][1])
		WriteLog("[Ghi l�i vi�c h�c k� n�ng c�p 120]"..date(" [%y n�m %m th�ng %d ng�y  %H gi� %M ph�t]").." [m�t m�:"..GetAccount().."] [nh�n v�t:"..GetName().."] S� d�ng s�ch k� n�ng c�p 120, h�c ���c k� n�ng:"..GetLastFactionNumber());
		return 0
	end
	return 1
end
