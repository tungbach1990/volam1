IncludeLib("FILESYS")


-- ��������ȡ�ļ�ʱ���ַ�������
TL_BUYGOODS = "TaskLink_BuyGoods"
TL_FINDGOODS = "TaskLink_FindGoods"
TL_SHOWGOODS = "TaskLink_ShowGoods"
TL_FINDMAPS = "TaskLink_FindMaps"
TL_UPGROUND = "TaskLink_UpGround"
TL_WORLDMAPS = "TaskLink_WorldMaps"


-- �������
function showrandraskdesc(nTaskIdx, nTaskGenre)
	local myTaskMainInfo,myTaskOrder,myTaskInfo1,myTaskInfo2,myTaskInfo3 -- ������ʾ��������˵�����ַ�
	
	local myTaskType = GetTask(1021)
	local myTaskCol = GetTask(1030)
	
	local myTaskCourse = GetTask(1028)
	
	local nNeedNum = 0;

	if (myTaskType == 0) then
		NewTask_TaskTextOut(nTaskGenre, "B�n ch�a ti�p nh�n nhi�m v� c�a D� T�u, c� th�i gian h�y ��n g�p �ng ta xem!")
		return 
	end
	
	if (myTaskType==1) then -- ����ǹ�����Ʒ������
	
		TabFile_Load("\\settings\\task\\tasklink_buygoods.txt",TL_BUYGOODS)
		
		myTaskInfo1 = TabFile_GetCell(TL_BUYGOODS,myTaskCol,"TaskInfo1")
		myTaskInfo2 = TabFile_GetCell(TL_BUYGOODS,myTaskCol,"TaskInfo")
		myTaskMainInfo = "��n  "..myTaskInfo2.." mua  "..myTaskInfo1.."  cho D� T�u."
			
	elseif (myTaskType==2) then -- �������ƷѰ�ҵ�����
		
		TabFile_Load("\\settings\\task\\tasklink_findgoods.txt",TL_FINDGOODS)
		
		-- ħ������
		myTaskOrder = TabFile_GetCell(TL_FINDGOODS,myTaskCol,"MagicCnName")
		-- ������������
		myTaskInfo1 = TabFile_GetCell(TL_FINDGOODS,myTaskCol,"TaskInfo")
		-- ��Сħ������
		myTaskInfo2 = TabFile_GetCell(TL_FINDGOODS,myTaskCol,"MinValue")
		-- ���ħ������
		myTaskInfo3 = TabFile_GetCell(TL_FINDGOODS,myTaskCol,"MaxValue")
		
		if (myTaskOrder=="n") then
			myTaskMainInfo = "�i t�m"..myTaskInfo1.." gi�p ta."
		else
			myTaskMainInfo = "�i t�m"..myTaskOrder.." th�p nh�t l� "..myTaskInfo2.." l�n nh�t l� "..myTaskInfo3.." "..myTaskInfo1.." v� cho D� T�u!"
		end
		
	elseif (myTaskType==3) then
	
		TabFile_Load("\\settings\\task\\tasklink_showgoods.txt",TL_SHOWGOODS)
	
			-- ħ������������
		myTaskOrder = TabFile_GetCell(TL_SHOWGOODS,myTaskCol,"MagicCnName")
		-- ħ�����Ե���Сֵ
		myTaskInfo1 = TabFile_GetCell(TL_SHOWGOODS,myTaskCol,"MinValue")
		-- ħ�����Ե����ֵ
		myTaskInfo2 = TabFile_GetCell(TL_SHOWGOODS,myTaskCol,"MaxValue")
		
		myTaskMainInfo = "�i t�m b� trang b� "..myTaskOrder.." th�p nh�t l� "..myTaskInfo1.." cao nh�t l� "..myTaskInfo2.." cho D� t�u!"
		
	elseif (myTaskType==4) then
	
		TabFile_Load("\\settings\\task\\tasklink_findmaps.txt",TL_FINDMAPS)
	
		-- ��ͼ������
		myTaskOrder = TabFile_GetCell(TL_FINDMAPS,myTaskCol,"TaskInfo1")
		-- ��Ҫ�ĵ�ͼ����
		myTaskInfo1 = TabFile_GetCell(TL_FINDMAPS,myTaskCol,"Num")		
		-- ��ͼ������
		myTaskInfo2 = TabFile_GetCell(TL_FINDMAPS,myTaskCol,"MapType")
		
		if (tonumber(myTaskInfo2) == 1) then
			myTaskInfo3 = "��a �� ch� "
		else
			myTaskInfo3 = "M�t ch� "
		end
		
		myTaskMainInfo = "��n <color=yellow>"..myTaskOrder.."<color> t�m <color=yellow>"..myTaskInfo1.."<color> quy�n"..myTaskOrder..myTaskInfo3.." v� cho D� T�u!".."B�n hi�n �� thu th�p ���c <color=yellow>"..GetTask(1025).."<color> t�m"..myTaskInfo3
		
	elseif (myTaskType==5) then

		TabFile_Load("\\settings\\task\\tasklink_upground.txt",TL_UPGROUND)

		-- ��Ҫ��������ֵ����
		myTaskOrder = TabFile_GetCell(TL_UPGROUND,myTaskCol,"NumericType")
		-- ��Ҫ��������ֵ����
		myTaskInfo1 = TabFile_GetCell(TL_UPGROUND,myTaskCol,"NumericValue")
		
		if (tonumber(myTaskOrder) == 1) then
			myTaskInfo2 = " c�p"
		elseif (tonumber(myTaskOrder) == 2) then
			myTaskInfo2 = "�i�m kinh nghi�m "
		elseif (tonumber(myTaskOrder) == 3) then
			nNeedNum = (myTaskInfo1 + GetTask(1026)) - GetRepute();
			
			if nNeedNum<0 then nNeedNum=0; end;
			
			myTaskInfo2 = "�i�m danh v�ng. Danh v�ng c�a b�n hi�n t�i l� "..GetRepute().." �i�m, c�n ph�i n�ng l�n"..nNeedNum.." �i�m,"
		elseif (tonumber(myTaskOrder) == 4) then
			nNeedNum = (myTaskInfo1 + GetTask(1026)) - GetTask(151);
			
			if nNeedNum<0 then nNeedNum=0; end;
			
			myTaskInfo2 = "�i�m ph�c duy�n. Ph�c duy�n c�a b�n hi�n t�i l� "..GetTask(151).." �i�m, c�n ph�i n�ng l�n"..nNeedNum.." �i�m,"
		elseif (tonumber(myTaskOrder) == 5) then
			myTaskInfo2 = "�i�m PK"
		elseif (tonumber(myTaskOrder) == 6) then
			nNeedNum = (myTaskInfo1 + GetTask(1026)) - GetTask(747);
			
			if nNeedNum<0 then nNeedNum=0; end;
			
			myTaskInfo2 = "�i�m th��ng T�ng Kim, �i�m th��ng c�a b�n hi�n l� "..GetTask(747).." �i�m, c�n ph�i n�ng l�n"..nNeedNum.." �i�m,"
		end
		
		myTaskMainInfo = "�i n�ng c�p   "..myTaskInfo1.." "..myTaskInfo2
		
	elseif (myTaskType==6) then
	
		TabFile_Load("\\settings\\task\\tasklink_worldmaps.txt",TL_WORLDMAPS)
	
		-- ��Ҫ�ռ���ɽ�����ͼ��Ƭ
		myTaskOrder = TabFile_GetCell(TL_WORLDMAPS,myTaskCol,"Num")
		
		myTaskMainInfo = "��n ��a D� T�u "..myTaskOrder.." m�nh b�n �� S�n H� X� T�c.".."B�n hi�n �� thu th�p ���c <color=yellow>"..GetTask(1027).."<color> t�m."
		
	end
	
	if (myTaskCourse==1) then
		NewTask_TaskTextOut(nTaskGenre, AEXP_TASKDESCWORKING..myTaskMainInfo)
	elseif (myTaskCourse==2) or (myTaskCourse==3) then
		NewTask_TaskTextOut(nTaskGenre, AEXP_TASKDESCCOMPLETE..myTaskMainInfo)
	end
	
end