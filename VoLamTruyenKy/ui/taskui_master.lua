IncludeLib("FILESYS")


--��������tabfile·��
AEXP_PASSTASK_1			=	"\\settings\\task\\newtask\\mastertask\\mainpasstask.txt"
AEXP_PASSAUXTASK_1		= 	"\\settings\\task\\newtask\\branch\\auxpasstask.txt"

--��������tabfile����
AEXP_PASSTASK_TASKID	= 	"TaskId"
AEXP_PASSTASK_LEVEL		= 	"Level"
AEXP_PASSTASK_VALUE 	= 	"Value"
AEXP_PASSTASK_DESC		= 	"Desc"
AEXP_PASSTASK_TEXT		= 	"Text"
AEXP_PASSTASK_TITLE		=	"Title"
AEXP_PASSTASK_MINLEVEL	= 	"MinLevel"
AEXP_PASSTASK_MAXLEVEL	= 	"MaxLevel"
AEXP_PASSTASK_PARENTID	=	"ParentTaskId"

--�������Ϊ��ֵ��ô��ʾ��TaskId�������Ѿ����
--�������ļ��в���Ҫд1000������������ʾ
AEXP_COMPLETE_VALUE = 1000

function showpasstaskdesc_tutor(nTaskIdx, nTaskGenre)
	showpasstaskdesc(nTaskIdx, nTaskGenre, 1000);
end

function showpasstaskdesc_zheng(nTaskIdx, nTaskGenre)
	showpasstaskdesc(nTaskIdx, nTaskGenre, 1001);
end

function showpasstaskdesc_zhong(nTaskIdx, nTaskGenre)
	showpasstaskdesc(nTaskIdx, nTaskGenre, 1002);
end

function showpasstaskdesc_xie(nTaskIdx, nTaskGenre)
	showpasstaskdesc(nTaskIdx, nTaskGenre, 1003);
end

--����������ʾ��������
function showpasstaskdesc(nTaskIdx, nTaskGenre, nTaskValueID)
	--���ȵõ���ǰ���������
	local nMyTaskValue = GetTask(nTaskValueID)
	if (0 == nMyTaskValue) then
		NewTask_TaskTextOut(nTaskGenre, "Hi�n b�n v�n ch�a ti�p nh�n nhi�m v�!")
		return 
	end
	
	--����������Ϊ���
	if (AEXP_COMPLETE_VALUE == nMyTaskValue) then
		NewTask_SetFinishedTask(nTaskGenre, nTaskIdx)
	end
	
	--���������tabfile
	if (TabFile_Load(AEXP_PASSTASK_1, AEXP_PASSTASK_1) == 0) then
		print("Load TabFile Error!"..AEXP_PASSTASK_1)
		return
	end
	--��֧�������fileҲ���򿪰�
	if (TabFile_Load(AEXP_PASSAUXTASK_1, AEXP_PASSAUXTASK_1) == 0) then
		print("Load TabFile Error!"..AEXP_PASSAUXTASK_1)
		return
	end

	local blnFindTask = 0
	local nRowCount = tonumber(TabFile_GetRowCount(AEXP_PASSTASK_1))
	local nRowAuxCount = tonumber(TabFile_GetRowCount(AEXP_PASSAUXTASK_1))
	local nPreLevel = -1		--��������Ҫ��¼ǰһ��������ȼ������ȼ�����ʱ��ʾ֧���������Ϣ
	--���������������Ӧ��ID
	for nIndex = 2, nRowCount do
		local nFileTaskID = tonumber(TabFile_GetCell(AEXP_PASSTASK_1, nIndex, AEXP_PASSTASK_TASKID))
		--����Ѿ�������Ҫ�ҵ�TaskId��ô����
		if (blnFindTask == 1 and nFileTaskID > nTaskValueID) then
			break
		end
		
		if (nFileTaskID == nTaskValueID) then
			local nFileTaskValue = tonumber(TabFile_GetCell(AEXP_PASSTASK_1, nIndex, AEXP_PASSTASK_VALUE))
			if (nMyTaskValue < nFileTaskValue) then
				--��Ȼ���Ҷ�С�����ٱ��� �������Ѿ��д�������
				break
			end
		
			local nFileLevel = tonumber(TabFile_GetCell(AEXP_PASSTASK_1, nIndex, AEXP_PASSTASK_LEVEL))
			
			if (nFileLevel ~= nPreLevel) then
				--����ʾ��һ���ȼ�֧������
				
				showauxpass(nFileTaskID, nPreLevel, nRowAuxCount)
				--��ʾ������������Լ�����								
				local strTaskTitle = TabFile_GetCell(AEXP_PASSTASK_1, nIndex, AEXP_PASSTASK_TITLE)
				local strTaskDesc = TabFile_GetCell(AEXP_PASSTASK_1, nIndex, AEXP_PASSTASK_DESC)
				if (strTaskTitle~=nil and strTaskTitle ~= "") then
					NewTask_DetailTextOut(nTaskGenre, "<enter>")
					NewTask_DetailTextOut(nTaskGenre, strTaskTitle)	
				end
				if (strTaskDesc ~= nil and strTaskDesc ~= "") then
					NewTask_DetailTextOut(nTaskGenre, strTaskDesc)
					NewTask_DetailTextOut(nTaskGenre, "<enter>")
				end
				nPreLevel = nFileLevel
			end
				
			--������ļ����ҵ��͵�ǰ���һ����TaskValue��Ҫ������ʾ��������ʾ֧���������Ϣ
			local strTaskText = TabFile_GetCell(AEXP_PASSTASK_1, nIndex, AEXP_PASSTASK_TEXT)
			if (nMyTaskValue == nFileTaskValue) then
				NewTask_TaskTextOut(nTaskGenre, parasestring(AEXP_TASKDESCWORKING..strTaskText))
				--��ʾ��ǰ�ȼ���֧������
				showauxpass(nFileTaskID, nFileLevel, nRowAuxCount)
				break
			else
				--����϶���С�ڣ�ǰ��϶�Ҫ����ɵķ���
				NewTask_TaskTextOut(nTaskGenre, parasestring(AEXP_TASKDESCCOMPLETE..strTaskText))
			end			
						
			blnFindTask = 1		
		end
	end	
	
	--������ɺ����һ�仰
	if (AEXP_COMPLETE_VALUE == nMyTaskValue) then
		NewTask_DetailTextOut(nTaskGenre, "Nhi�m v� �� ho�n th�nh.")
	end
	
	--������Բ��ͷ�
	--TabFile_UnLoad(AEXP_PASSTASK_1)	
	--TabFile_UnLoad(AEXP_PASSAUXTASK_1)
end

--֧���������ʾ
--֧���������ʾ����2004-12-31 14;25
--������ҵȼ���Χ�ڵ�֧����������Ѿ����(value = 1000)��ô��������ʾ���������û����ɣ���ô��ʾ"���������Ѿ��޷�����";���������Ϊ0��ôʲô����Ҫ��ʾ����
--�������ڵȼ���Χ֮�ڣ���ô��ʾ����ͬ��������һ������ʾ����ǰ���� 
--��Ҫ�ж��������ĵȼ���֧�߷�Χ֮��
function showauxpass(nParentId, nLevel, nRowCount)
	--����ȼ���-1��ô����ʾ֧��������Ϊ-1��ʾ��һ�γ��ֵȼ���ת
	
	if (nLevel == -1 ) then
		return
	end
	
	local nFirst = 0
	local nMyAuxValue = 0
	for nIndex = 2, nRowCount do
		local nFileParentTaskID = tonumber(TabFile_GetCell(AEXP_PASSAUXTASK_1, nIndex, AEXP_PASSTASK_PARENTID))
		local nFileMinLevel =  tonumber(TabFile_GetCell(AEXP_PASSAUXTASK_1, nIndex, AEXP_PASSTASK_MINLEVEL))		
		if (nFileParentTaskID > nParentId) then
			break
		end
		--����ҵ���parent����nLevel���������ô�Ѿ����˱�����Χ������
		if (nFirst == 1 and nFileMinLevel ~= nLevel) then
			break
		end
		
		if (nFileParentTaskID == nParentId and nLevel == nFileMinLevel) then			
			local nFileMinLevel = tonumber(TabFile_GetCell(AEXP_PASSAUXTASK_1, nIndex, AEXP_PASSTASK_MINLEVEL))
			local nFileMaxLevel =  tonumber(TabFile_GetCell(AEXP_PASSAUXTASK_1, nIndex, AEXP_PASSTASK_MAXLEVEL))
			local nMyLevel = GetLevel()
				
			if (nFirst == 0) then
				local nMyAuxTaskId = tonumber(TabFile_GetCell(AEXP_PASSAUXTASK_1, nIndex, AEXP_PASSTASK_TASKID))
				nMyAuxValue = GetTask(nMyAuxTaskId)
				if (nMyAuxValue == 0) then
					--û�н��ܸõȼ���֧����������ȥ
					--NewTask_DetailTextOut(nTaskGenre, AEXP_TASKDESAUX.."û�н�����Ӧ�ȼ���֧������")
					break
				end				
				local strTaskTitle = TabFile_GetCell(AEXP_PASSAUXTASK_1, nIndex, AEXP_PASSTASK_TITLE)
				--����ǵ�һ����ô��ʾ֧������ı������ϸ��Ϣ(����������)				
				local strTaskDesc = TabFile_GetCell(AEXP_PASSAUXTASK_1, nIndex, AEXP_PASSTASK_DESC)
				NewTask_DetailTextOut(nTaskGenre, AEXP_TASKDESAUX..strTaskTitle)
				NewTask_DetailTextOut(nTaskGenre, AEXP_TASKDESAUX..strTaskDesc)
				if (nMyLevel < nFileMinLevel or nMyLevel >= nFileMaxLevel) then
					--�ȼ�������Χ���������������ô��ȫ��ʾ,������ʾһ�仰Ȼ������
					if (nMyAuxValue == AEXP_COMPLETE_VALUE) then
						--��ɣ���ʾ����
					else
						--û�����												
						if (nMyLevel < nFileMaxLevel and nMyAuxValue ~= 0) then
							NewTask_DetailTextOut(AEXP_PASSAUXTASK_1,AEXP_TASKDESAUX.."B�n kh�ng th� nh�n nhi�m v� cao h�n ��ng c�p y�u c�u!")
							break
						else
							NewTask_DetailTextOut(AEXP_PASSAUXTASK_1,(AEXP_TASKDESAUX.."Nhi�m v� ph� tuy�n n�y b�n �� ho�n th�nh ���c m�y b��c, nh�ng hi�n gi� kh�ng th� ti�p t�c ���c n�a"))
						end 												
					end
				end  
				nFirst = 1
			end-- end of (nFirst == 0)
			--��ʾ����������
			local nFileAuxValue = tonumber(TabFile_GetCell(AEXP_PASSAUXTASK_1, nIndex, AEXP_PASSTASK_VALUE))
			local strTaskText = TabFile_GetCell(AEXP_PASSAUXTASK_1, nIndex, AEXP_PASSTASK_TEXT)
			
			if (nMyAuxValue == AEXP_COMPLETE_VALUE) then
				NewTask_TaskTextOut(nTaskGenre, parasestring(AEXP_TASKDESAUX..AEXP_TASKDESCCOMPLETE..strTaskText))
			elseif (nMyAuxValue == nFileAuxValue and (nFileMinLevel <= nMyLevel and nMyLevel < nFileMaxLevel)) then
				--��ֵ���,���ҷ��ϵȼ�
				--�����Ӹ�����ʾ
				NewTask_TaskTextOut(nTaskGenre, parasestring(AEXP_TASKDESAUX..AEXP_TASKDESCWORKING..strTaskText))
				break
			elseif (nMyAuxValue == nFileAuxValue and (nMyLevel < nFileMinLevel  or nFileMaxLevel <= nMyLevel)) then
				--��ֵ���,�������ϵȼ�
				NewTask_TaskTextOut(nTaskGenre, parasestring(AEXP_TASKDESAUX..AEXP_TASKDESCCOMPLETE..strTaskText))
				break
			else
				--��ʾ���
				NewTask_TaskTextOut(nTaskGenre, parasestring(AEXP_TASKDESAUX..AEXP_TASKDESCCOMPLETE..strTaskText))
			end
		end 		
	end--end of for)
	
	--��ʾһ����ɵĻ�
	if (nMyAuxValue == AEXP_COMPLETE_VALUE) then
		NewTask_DetailTextOut(AEXP_PASSAUXTASK_1,AEXP_TASKDESAUX.."B�n �� ho�n th�nh nhi�m v� ph� tuy�n n�y ")
	end
end

------------����[]�м���ַ���ת��Ϊ���������ֵ
function parasestring(strMsg)
	if (strMsg == nil or strMsg == "" ) then
		return ""
	end
	
	nFirstPos = strfind(strMsg,"{")
	if (nFirstPos == nil)then		
		return strMsg
	end
	
	local strNew = ""
	local nLen = strlen(strMsg)
	local nStart = 0
	local nEnd = 0	
	local nStart = 0	
	
	for i=1,nLen do 
		local szOne = strsub(strMsg,i,i)
		if (szOne == "{") then			
			strTemp = strsub(strMsg, nStart, i-1)			
			strNew = strNew..strTemp
			nStart = i+1
		elseif (szOne == "}") then
			if (nStart ~= 0) then				
				strTaskId = strsub(strMsg, nStart, i-1)
				if (strTaskId ~= nil and strTaskId ~= "") then
					strNew = strNew..GetTask(tonumber(strTaskId))
				end
				nStart = i+1				
			end
			nEnd = i+1
		end
	end
	strNew = strNew..strsub(strMsg,nEnd,nLen)
	return strNew
end