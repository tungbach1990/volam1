GLB_BATTLESTATE = 30
function main()
	SetGlbValue(GLB_BATTLESTATE, 0) --���ø�ȫ�ֱ���Ϊ1����־��ǰ�������������ν�ս�۽׶Σ���ʱ������������ĳ��ڵ��Զ������ν�ս�۵ı����㣬����������ԭ�ν�ս����ͼ
	idx = SubWorldID2Idx(44);
	if (idx == -1) then 
	return
	end;
	
	SubWorld = idx;
	OpenMission(1);

end;