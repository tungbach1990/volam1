--�Զ���ͭǮ�����ĺ��
IncludeLib("ITEM")

function main(nItemIdx)		
	local nMoney = GetItemParam(nItemIdx,1)
	AddStackItem(nMoney,4,417,1,1,0,0,0)
	Msg2Player("B�n ��t ���c "..nMoney.."Ti�n ��ng")
end

function GetDesc(nItemIdx)
	local nMoney = GetItemParam(nItemIdx, 1)
	--local szDesc = ""
	local szDesc = "\nTrong bao l� x� c� <color=yellow>"..nMoney.."<color=> ti�n ��ng"
	return szDesc;
end