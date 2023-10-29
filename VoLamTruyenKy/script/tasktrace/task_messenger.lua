function messengerdesc() --��������֮��ʹ����
	local myTaskInfo = ""
	local Uworld1204 = GetTask(1204)
	local Uworld1205 = GetTask(1205)
	if (Uworld1204 ~= 0 ) then
		local Uworld1201 = GetTask(1201)
		local Uworld1202 = GetTask(1202)
		local Uworld1203 = GetTask(1203)	
		if (Uworld1203 ~= 0 ) then -- ǧ��������
			if ( Uworld1203 == 10 ) then
				myTaskInfo = myTaskInfo.."Ng��i h�y ��n b�n �� <color=yellow>Thi�n B�o Kh�<color>."
			elseif ( Uworld1203 == 20 ) then
				local szTask,_ = get_task_string(Uworld1201)
				local szFinish,_ = get_task_string(Uworld1202)
				myTaskInfo = myTaskInfo.."Ng��i ph�i m� 5 B�o R��ng <color=yellow>["..szTask.."]<color>.<enter>"
				myTaskInfo = myTaskInfo.."�� m�: <color=yellow>["..szFinish.."]<color>."
			elseif ( Uworld1203 == 21 ) then
				local szTask,_ = get_task_string(Uworld1201)
				local szFinish,_ = get_task_string(Uworld1202)
				myTaskInfo = myTaskInfo.."Ng��i ph�i m� 5 B�o R��ng <color=yellow>["..szTask.."]<color>.<enter>"
				myTaskInfo = myTaskInfo.."�� m�: <color=yellow>["..szFinish.."]<color>."
			elseif ( Uworld1203 == 25 ) then
				local szTask,_ = get_task_string(Uworld1201)
				local szFinish,_ = get_task_string(Uworld1202)
				myTaskInfo = myTaskInfo.."�� ho�n th�nh nhi�m v�,h�y t�m <color=yellow>Ti�u Tr�n<color>."
			elseif ( Uworld1203 == 30) then
				myTaskInfo = myTaskInfo.."�� <color=yellow>ho�n th�nh <color>nhi�m v�, h�y t�m <color=yellow>D�ch quan<color>."
			end
		else
			if (Uworld1201==10) then
				myTaskInfo = myTaskInfo.."Ng��i h�y ��n b�n �� <color=yellow>Phong K�<color>."
			elseif (Uworld1201==20) then
				local nToaDo = GetTask(1207)
				myTaskInfo = myTaskInfo.."Ph�i m� 5 t�a �� trinh s�t. Hi�n t�i �� m� ���c <color=yellow>"..nToaDo.."<color> c�i."
			elseif (Uworld1201==30) then
				myTaskInfo = myTaskInfo.."�� <color=yellow>ho�n th�nh <color>nhi�m v�, h�y t�m <color=yellow>D�ch quan<color>."
			end
			if (Uworld1202==10) then
				myTaskInfo = myTaskInfo.."Ng��i h�y ��n b�n �� <color=yellow>S�n Th�n Mi�u<color>."
			elseif (Uworld1202==20) then
				local nBoss = GetTask(1207)
				myTaskInfo = myTaskInfo.."C�n gi�t 2 t�n �ao Y�u. Hi�n t�i �� ti�u di�t <color=yellow>"..nBoss.."<color> con."
			elseif (Uworld1202==30) then
				myTaskInfo = myTaskInfo.."�� <color=yellow>ho�n th�nh <color>nhi�m v�, h�y t�m <color=yellow>D�ch quan<color>."
			end
		end
	else
		myTaskInfo = "Hi�n c� <color=yellow>"..Uworld1205.."<color> �i�m th��ng. Nh�n nhi�m v� t�i:"
		myTaskInfo = myTaskInfo.."<enter><color=yellow>Phong K�<color>: Bi�n Kinh, D��ng Ch�u"
		myTaskInfo = myTaskInfo.."<enter><color=yellow>S�n Th�n Mi�u<color>: Ph��ng T��ng, L�m An"
		myTaskInfo = myTaskInfo.."<enter><color=yellow>Thi�n B�o Kh�<color>: T��ng D��ng, Th�nh ��"
	end
	return myTaskInfo
end

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