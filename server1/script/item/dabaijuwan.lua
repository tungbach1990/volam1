--ʹ�ô�׾���ű�
--2004.11.24
Include("\\script\\global\\baijuwanhead.lua")

function main(itemindex)
	SetTaskTemp(AEXP_TEMPOFFLINETASKID, itemindex)
	str=
	{	"<#>M�t vi�n ��i b�ch c�u ho�n, sau khi s� d�ng ���c <color=red>8 ti�ng<color> �y th�c r�i m�ng.  D��i c�p 130 thu ���c kinh nghi�m g�p 1.5 l�n b�ch c�u ho�n th��ng, c�p 130 tr� l�n thu ���c kinh nghi�m g�p 2.5 l�n.",
		"<#> S� d�ng B�ch C�u ho�n l�n/confirmlevel",
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
	{	"<#> V� ��ng c�p c�a b�n th�p h�n <color=red>c�p 50<color>, n�n trong tr�ng th�i treo m�y, b�n c� th� ti�n h�nh giao d�ch b�y b�n, h�n n�a nh�n ���c Ph�c Duy�n nh�ng kh�ng th� nh�n ���c <color=red>�i�m kinh nghi�m<color>. B�n c� mu�n s� d�ng B�ch C�u ho�n l�n kh�ng?",
		"<#> S� d�ng/use",
		"<#> �� ta suy ngh� l�i!/cancel",
		"<#> V� b�n kh�ng ph�i l� kh�ch h�ng n�p th�, n�n kh�ng th� s� d�ng ch�c n�ng r�i m�ng. Vui l�ng n�p th� r�i s� d�ng v�t ph�m n�y!"
	};

    -- �俨�û�����ʹ�ô�׾���
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

--ѡ��ʹ�ô�׾���
function use()
	sparetime = GetTask(AEXP_TASKID);
	if (sparetime == nil) then
		sparetime = 0;	
	end

	--showtime = floor(sparetime / (FRAME2TIME * 60));		--���û���ʾ��ʾ������
	if ((sparetime + AEXP_BIGCHANGE) > AEXP_MAXTIME) then
		local hours, minutes = getFrame2MinAndSec(sparetime);
		Say("Th�i gian �y th�c r�i m�ng B�ch C�u Ho�n c�n l�i l�: <color=red>"..hours.."<color>gi�<color=red>"..minutes.."<color>ph�t, nh�ng th�i gian r�i m�ng t�ng �i�m kinh nghi�m c�a b�n t�ng th�m kh�ng qu�<color=red>10000gi�<color>. Vui l�ng sau 1 th�i gian h�y s� d�ng B�ch C�u ho�n l�n!", 0);
    else	
		itemindex = GetTaskTemp(AEXP_TEMPOFFLINETASKID);
		if (IsMyItem(itemindex) ~= 1) then
			return
		end
		
		biggeneraltype,bigdetailtype,bigpartype = GetItemProp(itemindex);
		
		if ( biggeneraltype ~= AEXP_BIG_NGENTYPE
			or bigdetailtype ~= AEXP_BIG_DETAILTYPE
			or bigpartype ~= AEXP_BIG_PARTYPE) then
			return 
		end 
		
		nresult = RemoveItemByIndex(itemindex);

		if (nresult == 1) then 
			ntotaltime = sparetime + AEXP_BIGCHANGE;
			SetTask(AEXP_TASKID, ntotaltime);
			local hours, minutes = getFrame2MinAndSec(ntotaltime);
			Say("S� d�ng th�nh c�ng! Th�i gian �y th�c r�i m�ng B�ch C�u Ho�n c�n l�i l�: <color=red>"..hours.."<color>gi�<color=red>"..minutes.."<color> ph�t",0);
			writeUseBaiJulog("offlineitem_normal", hours, minutes);
		else
			Say("kh�ng c� B�ch C�u ho�n l�n c� th� s� d�ng", 0);	
		end
	end
end

--ѡ���ٿ��ǿ���
function cancel()
	return 0
end