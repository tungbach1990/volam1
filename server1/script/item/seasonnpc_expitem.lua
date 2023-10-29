
Include("\\script\\task\\task_addplayerexp.lua");

function main(nItemIdx)
	--ƣ��״̬
	local nDate = (GetItemParam(nItemIdx, 2)+2000) * 10000 + GetItemParam(nItemIdx, 3);
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nCurDate > nDate) then
		Say("V�t ph�m n�y �� qu� h�n s� d�ng!", 0);
		return 0;
	else
		if (GetTiredDegree() == 2) then
			Say("�ang � tr�ng th�i m�t m�i, kh�ng th� s� d�ng v�t ph�m n�y.", 0);
			return 1;
		else
			local nExp= GetItemParam(nItemIdx, 1) * 1000;
			tl_addPlayerExp(nExp);
			Msg2Player(format("B�n nh�n ���c %d �i�m kinh nghi�m", nExp));
			WriteLog(format("[T�ch l�y D� T�u]\t%s\tName:%s\tAccount:%s\t nh�n ���c %d �i�m kinh nghi�m.",
					GetLocalDate("%Y%m%d %X"),
					GetName(),
					GetAccount(),
					nExp));
			return 0;
		end;
	end;
	return 1;
end;

function GetDesc(nItemIdx)
	local nExp= GetItemParam(nItemIdx, 1) * 1000;
	local nYear = (GetItemParam(nItemIdx, 2)+2000)
	local nMMDD = GetItemParam(nItemIdx, 3)
	local nMonth = floor(nMMDD / 100);
	local nDate = mod(nMMDD , 100);
	
	return format("�i�m kinh nghi�m: %d<enter>Th�i h�n s� d�ng: %d-%d-%d", nExp, nYear, nMonth,nDate);
end;