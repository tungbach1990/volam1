-- ����Ƿ����ν��ͼ
-- LiuKuo
-- 2004.12.22
IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
tbCD_MAP = {516, 517, 580, 581}	--��������سǵ�ͼ

function main(nItemIdx)

--	W,X,Y = GetWorldPos();
	nMapId = SubWorldIdx2MapCopy(SubWorld)
	for i = 1, getn(tbBATTLEMAP) do 
		if ( nMapId == tbBATTLEMAP[i] ) then
			
			if BT_GetGameData(GAME_BATTLEID) == 2 then
				Msg2Player("��o c� n�y kh�ng th� s� d�ng t�i chi�n tr��ng qu�c chi�n T�ng Kim");
				return 1;
			end
			
			if (EatMedicine(nItemIdx) == -1) then
				return 1
			else
				return 0
			end
		end
	end
	
	for i = 1, getn(tbCD_MAP) do
		if (nMapId == tbCD_MAP[i]) then
			if (EatMedicine(nItemIdx) == -1) then
				return 1
			else
				return 0
			end
		end
	end
	Msg2Player("V�t ph�m n�y ch� c� th� s� d�ng � Chi�n tr��ng T�ng Kim");
	return 1;
end