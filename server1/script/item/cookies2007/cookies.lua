--2007���³���--�ձ�
--�������ձ�	6,1,1395,1,0,0
--��ͨ���ձ�	6,1,1396,1,0,0
--δ����ձ�	6,1,1397,1,0,0

Include("\\script\\event\\cookies2007\\head.lua");

function main(nItemIdx)
	if (checkcookies2007Date(20070506) ~= 1) then
		Say("B�nh n�y �� qu� h�n s� d�ng, h�y nhanh ch�ng v�t b�.", 0);
		return 0;
	end;
	
	if (checkcookies2007Limit() ~= 1) then
		Say("Th�t ng�i qu�, ch� c� ng��i ch�i <color=yellow>c�p tr�n 50 �� n�p th�<color> m�i c� th� �n b�nh.", 0);
		return 1;
	end;
	
	local ng, nd, np = GetItemProp(nItemIdx);
	local nexp = 1;
	if (np == 1395) then
		nexp = 800000;
	elseif (np == 1396) then
		nexp = 500000;
	elseif (np == 1397) then
		nexp = 300000;
	else
		print("Error!! It's not Rose for Valentine 2007!!");
		return 1;
	end;
	
	local ncurexp = GetTask(TSK_33_COOKIES_ADDEXP);
	if (ncurexp >= 300000000) then
		Say("B�n �� �n qu� nhi�u b�nh, kh�ng th� �n ���c n�a.", 0);
		Msg2Player("M�i ng��i ch� nh�n ���c t�i �a 300 tri�u �i�m kinh nghi�m khi �n b�nh.");
		return 1;
	elseif ((ncurexp + nexp) > 300000000) then
		nexp = 300000000 - ncurexp
	end;
	
	AddOwnExp(nexp);
	SetTask(TSK_33_COOKIES_ADDEXP, ncurexp + nexp)
	Msg2Player(format("B�n nh�n ���c %d �i�m kinh nghi�m", nexp));
	local szlog = format("[2007M�ng 3 th�ng 3]\t%s\tName:%s\tAccount:%s\t S� d�ng %s nh�n ���c %d �i�m kinh nghi�m",
				GetLocalDate("%Y-%m-%d %H:%M:%S"),GetName(),GetAccount(),GetItemName(nItemIdx),nexp);
	WriteLog(szlog);
end;