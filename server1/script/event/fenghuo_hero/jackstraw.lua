IncludeLib("TONG")
Include("\\script\\tong\\tong_header.lua")

function main()
	local _, nTongID = GetTongName();
	if (nTongID == 0) then
		Msg2Player("��y h�nh nh� l� ng��i r�m (ch�a gia nh�p bang kh�ng th� tham gia ho�t ��ng Phong H�a Anh H�ng L�nh)");
	else
		if (TONG_GetTaskValue(nTongID, TONGTSK_HEROLING) < 120) then
			Msg2Player("Phong H�a Anh H�ng L�nh c�a bang h�i t�ch l�y kh�ng �� 120 c�i, kh�ng th� ki�m tra ng��i r�m.");
		else
			Msg2Player("Ki�m tra xong ng��i r�m, c�n kho�ng 5 ph�t");
		end;
	end;
end;