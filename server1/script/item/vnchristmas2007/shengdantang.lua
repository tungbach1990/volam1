-- 2007ʥ��� ʥ����
-- ʹ��ʱ�� 2007/11/23   00��00~24��00
-- ʥ���ǣ���С��	6	1	1622
-- ʥ���ǣ�С��	6	1	1623
-- ʥ���ǣ��У�	6	1	1624
-- ʥ���ǣ���	6	1	1625
-- ʥ���ǣ�����	6	1	1626
-- ʹ�þ�������	1��

XMASCANDY2007_DATE	=	20071224	-- ʥ����ʹ������
XMASCANDY2007_EXPLM	=	100000000	--ʥ���Ǿ�������
TSK_XMASCANDY2007_EXP	=	1861	-- ʥ���Ǿ����ۼƼ�¼����

function main(nItemIdx)
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	
	if (nDate > XMASCANDY2007_DATE) then		--ʹ��ʱ���ж�
		Msg2Player("�� qu� h�n s� d�ng, n�u ti�p t�c s� d�ng s� g�y h�i, c�n ph�i v�t b�!");
		Say("�� qu� h�n s� d�ng, n�u ti�p t�c s� d�ng s� g�y h�i, c�n ph�i v�t b�!", 0);
		WriteLog(format("[XMASCANDY2007]\t%s\t%s\t%s\t%s",
						GetLocalDate("%Y%m%d %X"),
						GetName(),
						GetAccount(),
						"Delete_Dated_XMASCANDY"	));
		return 0;
	end;
	
	local tb_candy_exp = {
		[1622]	=	15000,
		[1623]	=	25000,
		[1624]	=	40000,
		[1625]	=	50000,
		[1626]	=	100000,
			};
	local ng, nd, np = GetItemProp(nItemIdx);
	local szItemName = GetItemName();
	if (tb_candy_exp[np]) then
		local nCurExp = tb_candy_exp[np] + GetTask(TSK_XMASCANDY2007_EXP);
		if (nCurExp >= XMASCANDY2007_EXPLM) then
			Msg2Player("�i�m kinh nghi�m nh�n ���c �� ��t gi�i h�n 100 tri�u �i�m, kh�ng th� s� d�ng n�a.");
			Say("�i�m kinh nghi�m nh�n ���c �� ��t gi�i h�n 100 tri�u �i�m, kh�ng th� s� d�ng n�a.");
			return 1;
		else
			AddOwnExp(tb_candy_exp[np]);
			SetTask(TSK_XMASCANDY2007_EXP, nCurExp);
			WriteLog(format("[XMASCANDY2007]\t%s\t%s\t%s\t%s%d",
						GetLocalDate("%Y%m%d %X"),
						GetName(),
						GetAccount(),
						"Use_XMASCANDY_Exp:",
						tb_candy_exp[np]	));
		end;
	else
		return 1;
	end;
end;