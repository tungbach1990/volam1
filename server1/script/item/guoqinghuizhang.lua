--�������
--by С�˶��
--2007-08-8
TASK_EXP = 1832;					--������������4E,������
TASK_TOP_EXP = 400000000;	--���ɵþ���
TASK_GET_EXP = 2091945;		--һ�λ�þ���
TASK_LEVEL = 50						--�ȼ�����
TASK_DATE_END = 07092324--ʹ�ý���ʱ��
function main(sel)
	nDate = tonumber(GetLocalDate("%y%m%d%H"))
	if TASK_DATE_END < nDate then
		Talk(1,"","Th�t ��ng ti�c, v�t ph�m n�y �� qu� h�n s� d�ng.")
		return 0
	end
	if GetLevel() < TASK_LEVEL then
		Talk(1,"","Ch� c� ng��i ch�i c�p t� 50 tr� l�n m�i c� th� s� d�ng huy ch��ng Qu�c Kh�nh.")
		return 1
	end
	local nexp = GetTask(TASK_EXP);
	local addexp = TASK_GET_EXP;
	if nexp >= TASK_TOP_EXP then
		Talk(1,"","Ch� c� th� nh�n ���c t�i �a 400 tri�u �i�m kinh nghi�m!!!")
		return 1
	end
	
	if nexp + addexp > TASK_TOP_EXP then
		addexp = TASK_TOP_EXP - nexp ;
		SetTask(TASK_EXP,TASK_TOP_EXP);
	else
		SetTask(TASK_EXP,tonumber(nexp+addexp));
	end
	
	AddOwnExp(addexp);
	Msg2Player(format("B�n nh�n ���c %d �i�m kinh nghi�m.",addexp));
	WriteLog(format("[GuoQingHuiZhang]\t Date:%s\t Account:%s\t Name:%s\t Effect:GetExp %s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),addexp));
		
end