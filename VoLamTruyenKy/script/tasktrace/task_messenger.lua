function messengerdesc() --闯关任务之信使任务
	local myTaskInfo = ""
	local Uworld1204 = GetTask(1204)
	local Uworld1205 = GetTask(1205)
	if (Uworld1204 ~= 0 ) then
		local Uworld1201 = GetTask(1201)
		local Uworld1202 = GetTask(1202)
		local Uworld1203 = GetTask(1203)	
		if (Uworld1203 ~= 0 ) then -- 千宝库任务
			if ( Uworld1203 == 10 ) then
				myTaskInfo = myTaskInfo.."Ngi h穣 n b秐  <color=yellow>Thi猲 B秓 Kh�<color>."
			elseif ( Uworld1203 == 20 ) then
				local szTask,_ = get_task_string(Uworld1201)
				local szFinish,_ = get_task_string(Uworld1202)
				myTaskInfo = myTaskInfo.."Ngi ph秈 m� 5 B秓 Rng <color=yellow>["..szTask.."]<color>.<enter>"
				myTaskInfo = myTaskInfo.."Х m�: <color=yellow>["..szFinish.."]<color>."
			elseif ( Uworld1203 == 21 ) then
				local szTask,_ = get_task_string(Uworld1201)
				local szFinish,_ = get_task_string(Uworld1202)
				myTaskInfo = myTaskInfo.."Ngi ph秈 m� 5 B秓 Rng <color=yellow>["..szTask.."]<color>.<enter>"
				myTaskInfo = myTaskInfo.."Х m�: <color=yellow>["..szFinish.."]<color>."
			elseif ( Uworld1203 == 25 ) then
				local szTask,_ = get_task_string(Uworld1201)
				local szFinish,_ = get_task_string(Uworld1202)
				myTaskInfo = myTaskInfo.."Х ho祅 th祅h nhi謒 v�,h穣 t譵 <color=yellow>Ti猽 Tr蕁<color>."
			elseif ( Uworld1203 == 30) then
				myTaskInfo = myTaskInfo.."Х <color=yellow>ho祅 th祅h <color>nhi謒 v�, h穣 t譵 <color=yellow>D辌h quan<color>."
			end
		else
			if (Uworld1201==10) then
				myTaskInfo = myTaskInfo.."Ngi h穣 n b秐  <color=yellow>Phong K�<color>."
			elseif (Uworld1201==20) then
				local nToaDo = GetTask(1207)
				myTaskInfo = myTaskInfo.."Ph秈 m� 5 t鋋  trinh s竧. Hi謓 t筰  m� 頲 <color=yellow>"..nToaDo.."<color> c竔."
			elseif (Uworld1201==30) then
				myTaskInfo = myTaskInfo.."Х <color=yellow>ho祅 th祅h <color>nhi謒 v�, h穣 t譵 <color=yellow>D辌h quan<color>."
			end
			if (Uworld1202==10) then
				myTaskInfo = myTaskInfo.."Ngi h穣 n b秐  <color=yellow>S琻 Th莕 Mi誹<color>."
			elseif (Uworld1202==20) then
				local nBoss = GetTask(1207)
				myTaskInfo = myTaskInfo.."C莕 gi誸 2 t猲 o Y猽. Hi謓 t筰  ti猽 di謙 <color=yellow>"..nBoss.."<color> con."
			elseif (Uworld1202==30) then
				myTaskInfo = myTaskInfo.."Х <color=yellow>ho祅 th祅h <color>nhi謒 v�, h穣 t譵 <color=yellow>D辌h quan<color>."
			end
		end
	else
		myTaskInfo = "Hi謓 c� <color=yellow>"..Uworld1205.."<color> 甶觤 thng. Nh薾 nhi謒 v� t筰:"
		myTaskInfo = myTaskInfo.."<enter><color=yellow>Phong K�<color>: Bi謓 Kinh, Dng Ch﹗"
		myTaskInfo = myTaskInfo.."<enter><color=yellow>S琻 Th莕 Mi誹<color>: Phng Tng, L﹎ An"
		myTaskInfo = myTaskInfo.."<enter><color=yellow>Thi猲 B秓 Kh�<color>: Tng Dng, Th祅h Й"
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