IncludeLib("FILESYS")


-- ��������ȡ�ļ�ʱ���ַ�������
TL_BUYGOODS = "TaskLink_BuyGoods"
TL_FINDGOODS = "TaskLink_FindGoods"
TL_SHOWGOODS = "TaskLink_ShowGoods"
TL_FINDMAPS = "TaskLink_FindMaps"
TL_UPGROUND = "TaskLink_UpGround"
TL_WORLDMAPS = "TaskLink_WorldMaps"


-- �������
function randtaskdesc()
	local myTaskMainInfo,myTaskOrder,myTaskInfo1,myTaskInfo2,myTaskInfo3 
	
	local myTaskType = GetTask(1021)
	local myTaskCol = GetTask(1030)
	
	local myTaskCourse = GetTask(1028)
	
	local nNeedNum = 0;

	if (myTaskType == 0) then
		myTaskMainInfo = "B�n ch�a ti�p nh�n nhi�m v� c�a D� T�u, c� th�i gian h�y ��n g�p �ng ta xem!"
	elseif (myTaskType==1) then -- ����ǹ�����Ʒ������
	
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
			myTaskMainInfo = "�i t�m <color=yellow>"..myTaskInfo1.."<color> gi�p ta."
		else
			myTaskMainInfo = "�i t�m <color=yellow>"..myTaskInfo1..""..myTaskOrder.."t� "..myTaskInfo2.." ��n "..myTaskInfo3.."<color> v� cho D� T�u!"
		end
		
	elseif (myTaskType==3) then
	
		TabFile_Load("\\settings\\task\\tasklink_showgoods.txt",TL_SHOWGOODS)
	
			-- ħ������������
		myTaskOrder = TabFile_GetCell(TL_SHOWGOODS,myTaskCol,"MagicCnName")
		-- ħ�����Ե���Сֵ
		myTaskInfo1 = TabFile_GetCell(TL_SHOWGOODS,myTaskCol,"MinValue")
		-- ħ�����Ե����ֵ
		myTaskInfo2 = TabFile_GetCell(TL_SHOWGOODS,myTaskCol,"MaxValue")
		
		myTaskMainInfo = "�i t�m <color=yellow>trang b� "..myTaskOrder.."<color> t� <color=yellow>"..myTaskInfo1.." ��n "..myTaskInfo2.."<color> cho D� t�u!"
		
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
		
		if tonumber(myTaskInfo1) > GetTask(1025) then
			myTaskMainInfo = "��n <color=yellow>"..myTaskOrder.."<color> t�m <color=yellow>"..myTaskInfo1.." t�m "..myTaskInfo3.."<color>! �� thu th�p ���c <color=yellow>"..GetTask(1025).."<color> t�m."
		else
			myTaskMainInfo = "�� t�m ���c <color=yellow>"..GetTask(1025).."<color> t�m <color=yellow>"..myTaskOrder.." "..myTaskInfo3.."<color>! Mau v� t�m D� T�u ph�c m�nh."
		end
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
			
			myTaskInfo2 = "�i�m danh v�ng. Hi�n c� "..GetRepute().." �i�m, c�n th�m "..nNeedNum.." �i�m,"
		elseif (tonumber(myTaskOrder) == 4) then
			nNeedNum = (myTaskInfo1 + GetTask(1026)) - GetTask(151);
			
			if nNeedNum<0 then nNeedNum=0; end;
			
			myTaskInfo2 = "�i�m ph�c duy�n. Hi�n c� "..GetTask(151).." �i�m, c�n th�m "..nNeedNum.." �i�m,"
		elseif (tonumber(myTaskOrder) == 5) then
			myTaskInfo2 = "�i�m PK"
		elseif (tonumber(myTaskOrder) == 6) then
			nNeedNum = (myTaskInfo1 + GetTask(1026)) - GetTask(747);
			
			if nNeedNum<0 then nNeedNum=0; end;
			
			myTaskInfo2 = "�i�m th��ng T�ng Kim. Hi�n c� "..GetTask(747).." �i�m, c�n th�m "..nNeedNum.." �i�m,"
		end
		
		myTaskMainInfo = "�i n�ng c�p "..myTaskInfo1.." "..myTaskInfo2
		
	elseif (myTaskType==6) then
	
		TabFile_Load("\\settings\\task\\tasklink_worldmaps.txt",TL_WORLDMAPS)
	
		-- ��Ҫ�ռ���ɽ�����ͼ��Ƭ
		myTaskOrder = TabFile_GetCell(TL_WORLDMAPS,myTaskCol,"Num")
		
		myTaskMainInfo = "��a cho D� T�u "..myTaskOrder.." m�nh b�n ��, �ang c� <color=yellow>"..GetTask(1027).."<color> t�m."
		
	end	
	return myTaskMainInfo
end