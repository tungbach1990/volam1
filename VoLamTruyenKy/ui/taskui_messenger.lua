
--���������ת�����ַ���
function get_task_string(nCode)
	local szRet = ""
	local nCount = 0
	if nCode then
		while(nCode > 0) do
			local nDigit = mod(nCode, 10)
			nCode = floor(nCode/10)
			if 0==nCount then
				szRet = format("%d",nDigit)
			else
				szRet = format("%d,%s",nDigit,szRet)
			end
			nCount = nCount+1
		end
	end
	return szRet,nCount
end

function showmessengerdesc(nTaskIdx, nTaskGenre) --��������֮��ʹ����
	Uworld1201 = GetTask(1201)
	Uworld1202 = GetTask(1202)
	Uworld1203 = GetTask(1203)
	Uworld1204 = GetTask(1204)
--	Uworld1205 = GetTask(1205)
--	Uworld1206 = GetTask(1206)
--	Uworld1207 = GetTask(1207)
--	Uworld1208 = GetTask(1208)
--	Uworld1209 = GetTask(1209)
--	Uworld1210 = GetTask(1210)
--	Uworld1211 = GetTask(1211)
--	Uworld1212 = GetTask(1212)
--	Uworld1213 = GetTask(1213)
--	Uworld1214 = GetTask(1214)
--	Uworld1215 = GetTask(1215)
--	Uworld1216 = GetTask(1216)
--	Uworld1218 = GetTask(1218)
	
	NewTask_TaskTextOut(nTaskGenre, "<color=red>Ch�o m�ng b�n v�o giao di�n nhi�m v�:<color>")
--	NewTask_TaskTextOut(nTaskGenre, "���ڷ�֮���ͼ���ۻ������ı�־Ϊ��"..Uworld1208)
--	NewTask_TaskTextOut(nTaskGenre, "����ɽ�����ͼ���ۻ��ɵ��ĵ���Ϊ��"..Uworld1209)
--	NewTask_TaskTextOut(nTaskGenre, "����ǧ�����ͼ���ۻ������ı���Ϊ��"..Uworld1210)
--	NewTask_TaskTextOut(nTaskGenre, "��Ŀǰ����ʹ����Ϊ��"..Uworld1205)
	NewTask_TaskTextOut(nTaskGenre, "  <enter>")
	
	if ( Uworld1204 ~= 0 ) then
		NewTask_TaskTextOut(nTaskGenre, "Ng��i �� nh�n ���c nhi�m v� T�n S� Thi�n B�o Kh�.")
			
--		if ( Uworld1201 ~= 0 ) then -- ��֮������
--			if ( Uworld1201 == 10 ) then
--				NewTask_TaskTextOut(nTaskGenre, "�����ȥ��<color=red>����<color>���������ﾭ�������ݵ�ͼ<color=red>��֮��<color>�������ŵص㡣")
--				NewTask_TaskTextOut(nTaskGenre, "<enter>")
--			elseif ( Uworld1201 == 20 ) then
--				NewTask_TaskTextOut(nTaskGenre, "���ڸùؿ���Ҫ����<color=red>5ö����־<color>���˳��ͨ������Ȼ�����������ѡ�����ڱ��ص�ʱ�䣬ֻҪ�ڹ涨ʱ����ͨ���������ż㽻��Ŀ�������ٴ����ɡ�")
--				NewTask_TaskTextOut(nTaskGenre, "<enter>")
--			elseif ( Uworld1201 == 30 ) then
--				NewTask_TaskTextOut(nTaskGenre, "����<color=red>�ﵽ<color>���صĹ���Ҫ���뾡������ʹ��ϵ��")
--				NewTask_TaskTextOut(nTaskGenre, "<enter>")
--			end
--			NewTask_TaskTextOut(nTaskGenre, "����Ҫ����<color=red>5ö����־<color>��Ŀǰ���Ѵ�����<color=red>"..Uworld1207.."<color>ö")
--		end
--		
--		if ( Uworld1202 ~= 0 ) then -- ɽ��������
--			if ( Uworld1202 == 10 ) then
--				NewTask_TaskTextOut(nTaskGenre, "�����ȥ��<color=red>����<color>���������ﾭ�������ݵ�ͼ<color=red>ɽ����<color>�������ŵص㡣")
--				NewTask_TaskTextOut(nTaskGenre, "<enter>")
--			elseif ( Uworld1202 == 20 ) then
--				NewTask_TaskTextOut(nTaskGenre, "���ڸùؿ���Ҫ�ɵ�<color=red>��������<color>���˳��ͨ������Ȼ�����������ѡ�����ڱ��ص�ʱ�䣬ֻҪ�ڹ涨ʱ����ͨ���������ż㽻��Ŀ�������ٴ����ɡ�")
--				NewTask_TaskTextOut(nTaskGenre, "<enter>")
--			elseif ( Uworld1202 == 30 ) then
--				NewTask_TaskTextOut(nTaskGenre, "����<color=red>�ﵽ<color>���صĹ���Ҫ���뾡������ʹ��ϵ��")
--				NewTask_TaskTextOut(nTaskGenre, "<enter>")
--			end
--			NewTask_TaskTextOut(nTaskGenre, "����Ҫ�ɵ�<color=red>��������<color>��Ŀǰ����ɱ����<color=red>"..Uworld1207.."<color>��")
--		end
		
		if ( Uworld1203 ~= 0 ) then -- ǧ��������
			if ( Uworld1203 == 10 ) then
				NewTask_TaskTextOut(nTaskGenre, "Ng��i c� th� �i t�m<color=yellow> Xa Phu <color>, t� ch� c�a �ng ta �i qua b�n �� Kho�i Ti�p<color=yellow>Thi�n B�o Kh�<color> ��n ��a �i�m ��a tin.")
				NewTask_TaskTextOut(nTaskGenre, "<enter>")
			elseif ( Uworld1203 == 20 ) then
				local szTask,_ = get_task_string(Uworld1201)
				local szFinish,_ = get_task_string(Uworld1202)
				NewTask_TaskTextOut(nTaskGenre, "T�i nhi�m v� c�a �i n�y ng��i c�n c� <color=yellow>["..szTask.."]<color>Th� t� m� 5 B�o R��ng")
				NewTask_TaskTextOut(nTaskGenre, "Ng��i �� m� B�o R��ng: <color=yellow>["..szFinish.."]<color>.")
				NewTask_TaskTextOut(nTaskGenre, "<enter>")
			elseif ( Uworld1203 == 21 ) then
				local szTask,_ = get_task_string(Uworld1201)
				local szFinish,_ = get_task_string(Uworld1202)
				NewTask_TaskTextOut(nTaskGenre, "Ng��i c� th� t�m<color=yellow> Xa Phu<color> ��a ng��i �i ��n b�n �� nhi�m v� Thi�n B�o Kh�.")
				NewTask_TaskTextOut(nTaskGenre, "<enter>")
				NewTask_TaskTextOut(nTaskGenre, "T�i nhi�m v� c�a �i n�y ng��i c�n c� <color=yellow>["..szTask.."]<color>Th� t� m� 5 B�o R��ng")
				NewTask_TaskTextOut(nTaskGenre, "Hi�n t�i ng��i �� m� B�o R��ng: <color=yellow>["..szFinish.."]<color>.")
				NewTask_TaskTextOut(nTaskGenre, "<enter>")
			elseif ( Uworld1203 == 25 ) then
				local szTask,_ = get_task_string(Uworld1201)
				local szFinish,_ = get_task_string(Uworld1202)
				NewTask_TaskTextOut(nTaskGenre, "Ch�c m�ng ng��i �� ho�n th�nh nhi�m v�, nhanh ch�ng �i t�m<color=yellow>Ti�u Tr�n<color>�i.")
				NewTask_TaskTextOut(nTaskGenre, "<enter>")
			elseif ( Uworld1203 == 30) then
				NewTask_TaskTextOut(nTaskGenre, "Ng��i ��<color=yellow>��t ��n <color>y�u c�u v��t �i c�a �i n�y, h�y nhanh ch�ng li�n h� v�i T�n S�.")
				NewTask_TaskTextOut(nTaskGenre, "<enter>")
			end
		end
	else
		NewTask_TaskTextOut(nTaskGenre, "Ng��i v�n ch�a nh�n nhi�m v� T�n S� Thi�n B�o Kh�, c� th� ��n ��i L� ho�c Th�nh �� t�m<color=yellow>D�ch Quan<color>nh�n nhi�m v�.")
	end
end