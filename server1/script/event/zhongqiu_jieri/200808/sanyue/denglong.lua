--zhongchaolong

--����5���ӵĵ���


function main()	--�Ի����
	
	local tbSay = 
	{
		"L�ng ��n n�y ��p qu�.",
		"L�ng ��n n�y l�p l�nh ��p qu�",
		"Trung thu ng�m l�ng ��n th�t l� vui.",
		"Trung thu th�t l�ng m�n, l�m ta nh� n�ng qu�."
	}
	
	Say(tbSay[random(1,getn(tbSay))], 0)
end;

function OnTimer(nNpcIdx, nTimeOut)
	if (nTimeOut == nil or nTimeOut > 0 ) then
		DelNpc(nNpcIdx)
		return 0;
	end;
	DelNpc(nNpcIdx)
end;