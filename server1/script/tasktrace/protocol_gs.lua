if MODEL_GAMESERVER ~= 1 then
	return 
end

Include("\\script\\script_protocol\\protocol_def_gs.lua")
Include("\\script\\task\\newtask\\map_index.lua")
Include("\\script\\tasktrace\\tasktrace.lua")

function proc_tasktrace(nOperation, nValue)
	Msg2Player("Operation "..nOperation.." and Value "..nValue)
	if nOperation == 1 then -- click vµo b¶ng
		if nValue == 1 then
			tl_moveToTaskMap()
		end
		open_task_trace()
	elseif nOperation == 2 then -- nót prev
		choose_task_trace()
		open_task_trace()
	elseif nOperation == 3 then -- nót next
		--switch_camp(1)
		open_task_trace()
	end	
end



function switch_camp(nValue)
	local desired_camp = mod((GetCamp() + nValue), 5)
	--Msg2Player("New camp is "..desired_camp)
	SetCurCamp(desired_camp)
	SetCamp(desired_camp)
end