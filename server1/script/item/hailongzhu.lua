Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua")
function main()
	local ndate = tonumber(GetLocalDate("%y%m%d"));
	if (ndate ~= GetTask(jf0904_TSK_hailongzhu_ndate)) then
		SetTask(jf0904_TSK_hailongzhu_ndate, ndate);
		SetTask(jf0904_TSK_hailongzhu_UseTime, 0);
		if (ndate~= GetTask(jf0904_TSK_denggao_ndate)) then
			SetTask(jf0904_TSK_denggao_ndate, ndate);
			SetTask(jf0904_TSK_shuizei_FulfilTaskTime, 1);
		end
	end
	
	if (GetTask(jf0904_TSK_hailongzhu_UseTime) >= 2) then
		Say("M�i ng�y ch� c� th� s� d�ng 2 H�i Long Ch�u", 0);
		return 1
	end
	
	SetTask(jf0904_TSK_hailongzhu_UseTime, GetTask(jf0904_TSK_hailongzhu_UseTime)+1);
	SetTask(jf0904_TSK_shuizei_FulfilTaskTime, GetTask(jf0904_TSK_shuizei_FulfilTaskTime)+1);
	Say("Thu ���c c� h�i th�m m�t l�n tham gia Ti�u di�t th�y t�c!", 0);
end

