--ʹ����Ч��׾���ű�
--2006.08.29
--80Сʱ�����й�ʱ��
--����Ϊԭ�׾Ե�2��

Include("\\script\\global\\baijuwanhead.lua")

function main(itemindex)
	SetTaskTemp(AEXP_TEMPOFFLINETASKID, itemindex)
	str=
	{	"<#>Thi�n tinh b�ch c�u ho�n, sau khi s� d�ng thu ���c <color=red>8 ti�ng<color> �y th�c r�i m�ng. Nh�n ���c kinh nghi�m g�p 5 l�n b�ch c�u ho�n th��ng.",
		"<#>S� d�ng thi�n tinh b�ch c�u ho�n/confirmlevel",
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
	{	"<#>��ng c�p c�a b�n th�p h�n <color=red>50<color>. V� th�, � tr�ng th�i �y th�c tr�n m�ng, b�n c� th� ti�n h�nh b�y b�n giao d�ch v� nh�n �i�m ph�c duy�n, nh�ng kh�ng th� nh�n ���c <color=red>�i�m kinh nghi�m<color>. B�n th�t s� mu�n s� d�ng B�ch C�u Ho�n ��c bi�t kh�ng#�",
		"<#> S� d�ng/use",
		"<#> �� ta suy ngh� l�i!/cancel",
		"<#> V� b�n kh�ng ph�i l� kh�ch h�ng n�p th�, n�n kh�ng th� s� d�ng ch�c n�ng r�i m�ng. Vui l�ng n�p th� r�i s� d�ng v�t ph�m n�y!",
		"<#>Ng��i ch�i ph�i c�p 50 tr� l�n v� �� chuy�n sinh m�i c� th� s� d�ng v�t ph�m n�y."
	};

    -- �俨�û�����ʹ�ô�׾���
	if (IsCharged()~=1) then
	    Talk(1, "", str[4]);
	    return
	end

	nLevel = GetLevel();

	if (nLevel < AEXP_NEEDLEVEL or ST_IsTransLife() ~= 1) then
		Talk(1, "", str[5]);
		return 
	end
	if (nLevel < AEXP_NEEDLEVEL) then
		Say(str[1], 2,str[2],str[3]);	
	else
		use();
	end
end

--ѡ��ʹ�����ǰ׾���
function use()
	local sparetime = GetTask(AEXP_TIANXING_TIME_TASKID);
	if (sparetime == nil) then
		sparetime = 0;	
	end

	--showtime = floor(sparetime / (FRAME2TIME * 60));		--���û���ʾ��ʾ������
	if ((sparetime + AEXP_BIGCHANGE) > AEXP_MAXTIME) then
		local hours, minutes = getFrame2MinAndSec(sparetime);
		Say("Th�i gian �y th�c c�n l�i c�a thi�n tinh b�ch c�u ho�n l�  <color=red>"..hours.."<color>gi�<color=red>"..minutes.."<color> ph�t. Th�i gian �y th�c kinh nghi�m t�ch l�y kh�ng ���c v��t qu� <color=red>10000 gi�<color>.", 0);
	else	
		itemindex = GetTaskTemp(AEXP_TEMPOFFLINETASKID);
		if (IsMyItem(itemindex) ~= 1) then
			return
		end
		
		local g, d, p = GetItemProp(itemindex);
		
		if ( g ~= 6
			or d ~= 1
			or p ~= 2183) then
			return --������Ч��׾�
		end 
		
		nresult = RemoveItemByIndex(itemindex);

		if (nresult == 1) then 
			ntotaltime = sparetime + AEXP_BIGCHANGE;
			SetTask(AEXP_TIANXING_TIME_TASKID, ntotaltime);
			local hours, minutes = getFrame2MinAndSec(ntotaltime);
			Say("S� d�ng th�nh c�ng, th�i gian �y th�c c�a thi�n tinh b�ch c�u ho�n l� <color=red>"..hours.."<color>gi�<color=red>"..minutes.."<color> ph�t",0);
			writeUseBaiJulog("offlineitem_special", hours, minutes);
		else
			Say("Kh�ng c� thi�n tinh b�ch c�u ho�n c� th� s� d�ng", 0);	
		end
	end
end

--ѡ���ٿ��ǿ���
function cancel()
	return 0
end