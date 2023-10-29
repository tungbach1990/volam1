--2007�����˽�--õ�廨
--�����ĺ�õ��	6,1,1362,1,0,0
--��ͨ�ĺ�õ��	6,1,1363,1,0,0
--��õ�廨��	6,1,1364,1,0,0

Include("\\script\\event\\valentine2007\\head.lua");

function main(nItemIdx)
	if (checkValentine2007Date(20070306) ~= 1) then
		Say("Hoa h�ng n�y �� �� l�u, b�y gi� �� kh� h�o", 0);
		return 0;
	end;
	
	if (checkValentine2007Limit() ~= 1) then
		Say("Th�t ng�i qu�, ch� c� ng��i ch�i c�p tr�n 80 <color=yellow>�� n�p th�<color> m�i c� th� s� d�ng hoa h�ng.", 0);
		return 1;
	end;
	
	local ng, nd, np = GetItemProp(nItemIdx);
	local nexp = 1;
	if (np == 1362) then
		nexp = 1500000;
	elseif (np == 1363) then
		nexp = 1000000;
	elseif (np == 1364) then
		nexp = 500000;
	else
		print("Error!! It's not Rose for Valentine 2007!!");
		return 1;
	end;
	
	local ncurexp = GetTask(TSK_VALENTINE_ROSE_ADDEXP);
	if (ncurexp >= 100000000) then
		Say("B�n �� s� d�ng qu� nhi�u hoa h�ng, kh�ng th� s� d�ng ti�p t�c!", 0);
		Msg2Player("M�i ng��i s� d�ng hoa h�ng ch� nh�n ���c t�i �a l� 100 tri�u �i�m kinh nghi�m.");
		return 1;
	elseif ((ncurexp + nexp) > 100000000) then
		nexp = 100000000 - ncurexp
	end;
	
	AddOwnExp(nexp);
	SetTask(TSK_VALENTINE_ROSE_ADDEXP, ncurexp + nexp)
	Msg2Player(format("B�n nh�n ���c %d �i�m kinh nghi�m", nexp));
	local szlog = format("[L� t�nh nh�n 2007]\t%s\tName:%s\tAccount:%s\t s� d�ng %s nh�n ���c %d �i�m kinh nghi�m",
				GetLocalDate("%Y-%m-%d %H:%M:%S"),GetName(),GetAccount(),GetItemName(nItemIdx),nexp);
	WriteLog(szlog);
end;