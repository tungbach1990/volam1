--�������� ɳĮ�Թ�to�����
--TrapID��ɳĮ�Թ�1

function main(sel)
	
	local nSubWorldId = SubWorldIdx2ID(SubWorld);
	if nSubWorldId == 919 or nSubWorldId == 920 then
		local nW, nX, nY = RevID2WXY(GetPlayerRev());
		NewWorld(nW, nX/32, nY/32);
		return
	end
	
	SetFightState(1);
	NewWorld(136, 1716, 3144)
	AddTermini(195)			-- ��Ȼ�����˶������ص��¼����ֻ��80�����ϲ���ֱ���߽���
end;
