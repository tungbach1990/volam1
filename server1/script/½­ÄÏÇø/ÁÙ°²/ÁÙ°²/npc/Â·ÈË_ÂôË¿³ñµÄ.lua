-- �ٰ���·�ˡ���˿���
-- by��Dan_Deng(2003-09-16)

function main()
	i = random(0,3)
	if (i == 0) then
		Talk(1,"","T� l�a th��ng h�ng ��y! T� l�a th��ng h�ng ��y! Kh�ng mua s� ti�c ho�i ��y!")
	elseif (i == 1) then
		Talk(1,"","Ta c� t�t c� nh�ng th� tuy�t h�o tr�n ��i ��y: l�a, �, t�, g�m, v�c, v�i, ��nh...mu�n t�m th� g� c�ng c�. Xin c� t�y � l�a ch�n!")
	elseif (i == 2) then
		Talk(1,"","N�o h�y nh�n ��y! Th� n�y g�i l� 'Tinh Quang ��nh', Ng��i xem! �ng � d�u m�t, m��t m� nh� d�i ng�n h�, qu�n tinh h�i t�, t�ng t�ng �nh s�ng. ��y ch�nh l� tuy�t ph�m c�a b�n gia!")
	else
		Talk(1,"","T�m n�y l� 'C� h��ng ��nh', ���c d�t b�ng l�ng chim v� tr�m th� c� th�m. Ng��i c� phong th�i ��nh ��c, kho�c l�n l�i c�ng sang tr�ng. Sao h�? Th�ch t�m n�y ch�?")
	end
end;
