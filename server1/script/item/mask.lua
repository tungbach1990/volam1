--��ߴ���
--���� ��1:�������, 0:�����������
Include("\\script\\lib\\pay.lua");

MARK_DAJIANGJUN_TASK_NO = 2620
MARK_YUANSUAI_TASK_NO = 2621

function CanEquip(nParticular)	
	--VLDNB 10 - Kh�ng cho mang m�t n� TK trng ��u tr��ng - 20111017
	if nParticular == 482 or nParticular == 447 or nParticular == 450 or nParticular == 446 then
		local tbMapID = {
			605, 608, 609,
			606, 610, 611,
			607, 612, 613,
		}
		local nW, _, _ = GetWorldPos()
		for i = 1, getn(tbMapID) do
			if tbMapID[i] == nW then
				return 0
			end
		end
	end
	local nTripMode = GetTripMode()
	-- �󽫾�����
	if (nParticular == 446 or nParticular == 450 or nParticular == 454 or nParticular == 455) then
		
		if nTripMode ~= 2 and (IsCharged() ~= 1) then
			Say("Ch� c� ng��i ch�i c�p tr�n 50 �� n�p th� m�i c� th� s� d�ng.", 0)
			return 0;
		end
		return 1;
	end

	-- Ԫ˧����
	if (nParticular == 447) then
		
		if nTripMode ~= 2 and (IsCharged() ~= 1) then
			Say("Ch� c� ng��i ch�i c�p tr�n 50 �� n�p th� m�i c� th� s� d�ng.", 0)
			return 0;
		end	
		return 1;
	end
	return 1;
end;
		