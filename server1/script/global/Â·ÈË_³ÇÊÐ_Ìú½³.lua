--���������������
--by ��־ɽ

if (not __H_CHAT_CITY_SMITH__) then
	__H_CHAT_CITY_SMITH__ = 1;


function main(sel)
	local tab_Content = {
		"Ta mu�n mua v�i m�n binh kh�/tj_default_chat",		--ԭ�����������
		"Nh�n ti�n gh� qua th�i/oncancel",
	};
	
	-- ����ʱ��,�����Ի�,���¾���
--	if (isEventDay() ==1) then
--		tinsert(tab_Content,1, "�μӻ/onEventMain");
--	end;
	
	if (getn(tab_Content) > 2) then		--����л����Ի�

		Say("Th� r�n: Kh�ch quan t�m ta c� vi�c g�?", getn(tab_Content), tab_Content);

	else					--û�лֱ�ӽ���ԭ�Ի�

		tj_default_chat();

	end;
end;

function oncancel()
end;

end; --// end of __H_CHAT_CITY_SMITH__;