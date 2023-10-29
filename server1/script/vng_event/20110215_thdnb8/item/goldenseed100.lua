IncludeLib("ITEM");
--huihuangzhiguo_level
MX_LANTERN_COUNT = 2;
GOLDFRUIT_MX_COUNT = 365;
TASKIDDAY = 2321;
TASKMAXEAT = 2314;
TASKEATCOUNT = 2322;
GOLDENSEED100_MAXCOUNT = 100;

function main(ItemIndex)
	if (GetLevel() < 120) then
		Say("<#> �� r�n luy�n c�a ng��i ch�a �� �� �n qu� n�y.", 0)
		return 1
	end
	local nDate = tonumber(GetLocalDate("%m%d"))
	if ( GetTask(TASKIDDAY) ~= nDate ) then
		SetTask(TASKIDDAY, nDate)
		SetTask(TASKEATCOUNT, 0);
	end
	
	if ( GetTask(TASKIDDAY) == nDate and MX_LANTERN_COUNT <= GetTask(TASKEATCOUNT)) then
		local szMsg = format("<#>H�m nay b�n �� �n %d qu� Ho�ng Kim, v� c�ng th�ng ti�n qu� nhanh d� g�y t�c d�ng ph�n ngh�ch, ng�y mai h�y ti�p t�c v�y.",MX_LANTERN_COUNT)
		Say(szMsg, 0)
		Msg2Player(szMsg)
		return 1
	end
	
	local n_param = tonumber(GetItemParam(ItemIndex,1)) + 1
	local itemname = "<color=yellow>"..GetItemName(ItemIndex).."<color>"
	SetSpecItemParam(ItemIndex,1,n_param)
	SyncItem(ItemIndex)
	if (n_param >= GOLDENSEED100_MAXCOUNT) then
		RemoveItemByIndex(ItemIndex)
		Msg2Player("<#> "..itemname.."<#> �� s� d�ng"..GOLDENSEED100_MAXCOUNT.."<#> l�n, kh�ng th� d�ng ���c n�a!")
	else
		Msg2Player("<#> "..itemname.."<#> c�n c� th� s� d�ng"..(GOLDENSEED100_MAXCOUNT - n_param).."<#> l�n")
	end
	
	SetTask(TASKMAXEAT, GetTask(TASKMAXEAT) + 1)	--��α�֤��1��ʼ�����أ���
	SetTask(TASKEATCOUNT, GetTask(TASKEATCOUNT) + 1)
	local award_exp = 50000000
	AddOwnExp(award_exp)
	return 1
end


function GetDesc(nItem)	
	local szDesc = ""
	local n_param = tonumber(GetItemParam( nItem, 1 ))
	szDesc = szDesc..format("\nC� th� s� d�ng<color=yellow>%d<color>l�n", (GOLDENSEED100_MAXCOUNT - n_param));
	return szDesc;
end