--ʹ�ü��ܴ�׾���ű�
--2004.11.24
Include("\\script\\global\\baijuwanhead.lua")

function main(itemindex)
	SetTaskTemp(AEXP_TEMPOFFLINETASKID, itemindex)
	str=
	{	"<#>B�ch C�u Ho�n k� n�ng, s� d�ng s� nh�n ���c <color=red>8 gi�<color> �y th�c.",
		"<#>S� d�ng B�ch C�u Ho�n k� n�ng /use",
		"<#> �� ta suy ngh� l�i!/cancel",
		"<#> Tra xem th�i gian treo m�y c�n l�i c�a ta/get_left_time",
		"<#> Ch�n k� n�ng r�i m�ng v�n treo m�y/#selectofflineskill('cancel')",
		"<#> Gi�i thi�u chi ti�t v� c�ch ch�i treo m�y/help"
	};
	Say(str[1], 4,str[2],str[3],str[4],str[5]);
	return 1
end

--ѡ��ʹ�ü��ܰ׾���
function use()
	local sparetime = GetTask(AEXP_SMALL_SKILL_TASKID);
	if (sparetime == nil) then
		sparetime = 0;	
	end

	if ((sparetime + AEXP_SKILLCHANGE) > AEXP_MAXTIME) then
		local hours, minutes = getFrame2MinAndSec(sparetime);
		Say("Th�i gian r�i m�ng v�n treo m�y c�n l�i c�a b�n l� <color=red>"..hours.."<color>gi�<color=red>"..minutes.."<color> ph�t. Th�i gian t�ch l�y �y th�c k� n�ng kh�ng ���c v��t qu� <color=red>10000 gi�<color>.", 0);
    else	
		itemindex = GetTaskTemp(AEXP_TEMPOFFLINETASKID);
		if (IsMyItem(itemindex) ~= 1) then
			return
		end
		
		nresult = RemoveItemByIndex(itemindex);

		if (nresult == 1) then 
			ntotaltime = sparetime + AEXP_SKILLCHANGE;
			SetTask(AEXP_SMALL_SKILL_TASKID, ntotaltime);
			local hours, minutes = getFrame2MinAndSec(ntotaltime);
			Say("Th�nh c�ng s� d�ng, th�i gian r�i m�ng v�n treo m�y c�a b�n l� <color=red>"..hours.."<color>gi�<color=red>"..minutes.."<color> ph�t",0);
			writeUseBaiJulog("skillofflineitem_small", hours, minutes);
		else
			Say("Kh�ng c� B�ch C�u Ho�n k� n�ng, c� th� s� d�ng ", 0);	
		end
	end
end

--ѡ���ٿ��ǿ���
function cancel()
	return 0
end