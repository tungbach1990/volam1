--ս����
--by С�˶��
--2007-04-13
ZHANGONGHUA_EXP = 2557;		--������������3E
function main(sel)
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (nDate > 070531) then
		return 0
	end;
	if (GetLevel() < 50) then
		Msg2Player("Ng��i ch�i c�p 50 tr� l�n �� n�p th� m�i c� th� s� d�ng.");
		return 1;
	end;
	
	local nexp = GetTask(ZHANGONGHUA_EXP);
	local addexp = 1500000;
	if nexp >= 300000000 then
		Talk(1,"","Kinh nghi�m b�n nh�n ���c �� qu� gi�i h�n, t�i �a ch� nh�n ���c 300 tri�u �i�m kinh nghi�m.");
		return 1;
	end
	
	if nexp + addexp > 300000000 then
		addexp = 300000000 - nexp ;
		SetTask(ZHANGONGHUA_EXP,300000000);
	else
		SetTask(ZHANGONGHUA_EXP,tonumber(nexp+addexp));
	end
	
	AddOwnExp(addexp);
	Msg2Player("B�n t�ng th�m "..addexp.."�i�m kinh nghi�m.");
	WriteLog(format("[ZhanGongHua]\t Date:%s\t Account:%s\t Name:%s\t Effect:GetExp %s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),addexp));
		
end