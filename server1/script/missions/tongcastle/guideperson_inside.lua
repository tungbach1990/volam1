--�׻����ý����ˣ������ã�

function main()
	local tbSel = {
		"Ta mu�n r�i kh�i Th�nh B�o Bang H�i" .. "/OnLeave",
		"Ta xem th�" .. "/OnCancel",
	};
	Say("��i hi�p! Ng��i mu�n r�i kh�i ��y sao?", getn(tbSel), tbSel);
end

function OnLeave()
	UseTownPortal();
end

function OnCancel()
end

