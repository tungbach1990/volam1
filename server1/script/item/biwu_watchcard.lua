IncludeLib("ITEM")
function main( nItemIdx )
	local nMon =  GetItemParam(nItemIdx,1)
	local nDay =  GetItemParam(nItemIdx,2)
	--Say("��Ĺ���ȯ��ʹ������Ϊ<color=yellow>2005��"..nMon.."��"..nDay.."��<color>������ȯֻ��ʹ��һ�Σ�ʹ�ú󣬼����ڹ���ȯ������ʱ���ڵ������ִ���ܾ�������������ս��������Ч����ȷ��Ҫ����ʹ����", 2, "��Ҫ����ʹ��/#sure2usewatchcard("..nItemIdx..")", "�����ԵȰ�/OnCancel")
	Say("Xin l�i! V� c�a b�n s� �� qu� h�n s� d�ng!",0);
end

function sure2usewatchcard(nItemIdx)
	local count = CalcEquiproomItemCount( 6, 1, 443, 1 )
	if ( count == 0 ) then
		Say("V� c�a b�n ��u? Kh�ng c� th� kh�ng d�ng ���c!", 0)
		return
	end
	local nMon =  GetItemParam(nItemIdx,1)
	local nDay =  GetItemParam(nItemIdx,2)
	local nDate = nMon * 100 + nDay
	AddExtPoint(1,nDate)
	Say("V� theo d�i c� h�n s� d�ng l� <color=yellow>2005-"..nMon.."nguy�t "..nDay.." ng�y<color>, Xin ��ng k� m�y d�ch v� thi ��u ��i h�i V� l�m trong ng�y c� hi�u l�c �� xem thi ��u!", 0)
	DelCommonItem(6,1,443)
end

function GetDesc( nItem )
	local szDesc;
	local nIssueID, nIDCount;
	local nPayYear1, nPayMonth1, nPayDay1, nPayYear2, nPayMonth2, nPayDay2;
		
	nPayYear1 = 2005
	nPayMonth1 = GetItemParam( nItem, 1 )
	nPayDay1 = GetItemParam( nItem, 2 )

	szDesc = ""
	szDesc = szDesc..format( "\nV� tham quan v� l�m ��i h�i: <color=yellow>%04d-%02d-%02d<color=>, c� ng�y", nPayYear1, nPayMonth1, nPayDay1 );
	return szDesc;
end

