--ʹ�ð׾���ű�
--2004.11.24
Include("\\script\\global\\baijuwanhead.lua")

function main(itemindex)
	SetTaskTemp(AEXP_TEMPOFFLINETASKID, itemindex)
	str=
	{	"<#>S� d�ng s� nh�n ���c <color=red>8 gi�<color> �y th�c.",
		"<#> S� d�ng B�ch C�u ho�n/confirmlevel",
		"<#> �� ta suy ngh� l�i!/cancel",
		"<#> Tra xem th�i gian treo m�y c�n l�i c�a ta/get_left_time",
		"<#> Gi�i thi�u chi ti�t v� c�ch ch�i treo m�y/help"
	};
	Say(str[1], 4,str[2],str[3],str[4],str[5]);
	return 1
end

--�жϵȼ��ٴ�ȷ��
function confirmlevel()
	str=
	{	"<#> V� ��ng c�p c�a b�n th�p h�n <color=red>c�p 50<color>, n�n trong tr�ng th�i r�i m�ng, b�n c� th� ti�n h�nh giao d�ch b�y b�n, v� nh�n ���c Ph�c Duy�n nh�ng kh�ng th� nh�n ���c <color=red>kinh nghi�m<color>. B�n c� th�t s� mu�n s� d�ng B�ch C�u ho�n?",
		"<#> S� d�ng/use",
		"<#> �� ta suy ngh� l�i!/cancel",
		"<#> V� b�n kh�ng ph�i l� kh�ch h�ng n�p th�, n�n kh�ng th� s� d�ng ch�c n�ng r�i m�ng. Vui l�ng n�p th� r�i s� d�ng v�t ph�m n�y!"
	};

    -- �俨�û�����ʹ�ð׾���
	if (IsCharged()~=1) then
	    Talk(1, "", str[4]);
	    return
	end
	
	nLevel = GetLevel();
	if (nLevel < AEXP_NEEDLEVEL) then
		Say(str[1], 2,str[2],str[3]);	
	else
		use();
	end
end

--ѡ��ʹ�ð׾���
function use()
	sparetime = GetTask(AEXP_SMALL_TIME_TASKID);
	if (sparetime == nil) then
		sparetime = 0;
	end

	--showtime = floor(sparetime /(FRAME2TIME * 60));		--���û���ʾ��ʾ������
	if ((sparetime + AEXP_SMALLCHANGE) > AEXP_MAXTIME) then
		local hours, minutes = getFrame2MinAndSec(sparetime);
		Say("Hi�n th�i gian r�i m�ng t�ng �i�m kinh nghi�m c�n l�i l�<color=red>"..hours.."<color>gi�<color=red>"..minutes.."<color> ph�t, nh�ng th�i gian r�i m�ng t�ng �i�m kinh nghi�m c�a b�n t�ng th�m kh�ng qu� <color=red>10000gi�<color>, xin h�y ch� th�m 1 th�i gian n�a m�i ti�p t�c s� d�ng B�ch C�u ho�n.", 0);
	else
		itemindex = GetTaskTemp(AEXP_TEMPOFFLINETASKID);
		if (IsMyItem(itemindex) ~= 1) then
			return
		end
		
		smallgeneraltype,smalldetailtype,smallpartype = GetItemProp(itemindex);
		if ( smallgeneraltype ~= AEXP_SMALL_NGENTYPE
			or smalldetailtype ~= AEXP_SMALL_DETAILTYPE
			or smallpartype ~= AEXP_SMALL_PARTYPE) then
			return 
		end 
		
		nresult = RemoveItemByIndex(itemindex);
		
		if (nresult > 0) then 
			ntotaltime=sparetime + AEXP_SMALLCHANGE;
			SetTask(AEXP_SMALL_TIME_TASKID, ntotaltime);
			local hours, minutes = getFrame2MinAndSec(ntotaltime);
			Say("s� d�ng th�nh c�ng, th�i gian treo m�y c�a b�n c�n l�i l� <color=red>"..hours.."<color>gi�<color=red>"..minutes.."<color> ph�t",0);
			writeUseBaiJulog("offlineitem_small", hours, minutes);
		else
			Say("Kh�ng c� B�ch C�u ho�n c� th� s� d�ng ", 0);	
		end
	end
end

--ѡ���ٿ��ǿ���
function cancel()
	return 0
end