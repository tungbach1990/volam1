--战功花
--by 小浪多多
--2007-04-13
ZHANGONGHUA_EXP = 2557;		--经验变量，最多3E
function main(sel)
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (nDate > 070531) then
		return 0
	end;
	if (GetLevel() < 50) then
		Msg2Player("Ngi ch琲 c蕄 50 tr� l猲  n筽 th� m韎 c� th� s� d鬾g.");
		return 1;
	end;
	
	local nexp = GetTask(ZHANGONGHUA_EXP);
	local addexp = 1500000;
	if nexp >= 300000000 then
		Talk(1,"","Kinh nghi謒 b筺 nh薾 頲  qu� gi韎 h筺, t鑙 產 ch� nh薾 頲 300 tri謚 甶觤 kinh nghi謒.");
		return 1;
	end
	
	if nexp + addexp > 300000000 then
		addexp = 300000000 - nexp ;
		SetTask(ZHANGONGHUA_EXP,300000000);
	else
		SetTask(ZHANGONGHUA_EXP,tonumber(nexp+addexp));
	end
	
	AddOwnExp(addexp);
	Msg2Player("B筺 t╪g th猰 "..addexp.."甶觤 kinh nghi謒.");
	WriteLog(format("[ZhanGongHua]\t Date:%s\t Account:%s\t Name:%s\t Effect:GetExp %s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),addexp));
		
end