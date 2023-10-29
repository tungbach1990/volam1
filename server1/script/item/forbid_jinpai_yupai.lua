Include("\\script\\battles\\battlehead.lua");

tbForbidMap =
{
	--seven city
	926,
	927,
	928,
	929,
	930,
	931,
	932,
	
	336,	--Phong L�ng ��
	341,	--M�c B�c Th�o Nguy�n
	337,	--B�n thuy�n 1
	338,	--B�n thuy�n 2
	339,	--B�n thuy�n 3
	319,	--L�m Du Quan
	333,	--Hoa S�n ph�i
	37,	--Bi�n Kinh
	44,	--Chi�n tr��ng T�ng Kim
}

function ForbidMap()
	nSubWorldID = SubWorldIdx2ID();
	W,X,Y = GetWorldPos();

	local nMapId = W;
	
	for i = 1, getn(tbBATTLEMAP) do --map Tong Kim
		if ( nMapId == tbBATTLEMAP[i] ) then
			Msg2Player("L�c n�y b�n kh�ng th� s� d�ng v�t ph�m n�y");
			return 1;
		end
	end	
	
	for i = 1, getn(tbForbidMap) do 
		if (nSubWorldID == tbForbidMap[i]) then
			Msg2Player("Xin l�i! B�n hi�n � khu v�c ��c bi�t, kh�ng th� s� d�ng v�t ph�m!");
			return 1
		end
	end
	
	if (nSubWorldID >= 375 and nSubWorldID <= 386) then --map Tong Kim
		Msg2Player("Xin l�i! B�n hi�n � khu v�c ��c bi�t, kh�ng th� s� d�ng v�t ph�m!");
		return 1
	end
	
	if (nSubWorldID >= 416 and nSubWorldID <= 511) then --Phong Lang Do
		Msg2Player("Xin l�i! B�n hi�n � khu v�c ��c bi�t, kh�ng th� s� d�ng v�t ph�m!");
		return 1
	end
	
	return 0
	
end