allbrother_0801_Date_S				= 091113--2008��03��08�յ�2008��03��16��24��
allbrother_0801_Date_E				= 091129
allbrother_0801_szActName			= "T� h�i giai huynh ��"
allbrother_0801_TeamSizeLimit		= 8
TSK_allbrother_0801_TaskState		= 1958;
TSK_allbrother_0801_TaskTime		= 1959;
TSK_allbrother_0801_TaskLimit		= 1960;
TSK_allbrother_0801_TaskTeamLimit	= 1961;
TSKV_allbrother_0801_TaskLimit		= 8
TSKV_allbrother_0801_TaskTeamLimit	= 8
TSKV_allbrother_0801_TaskTime		= 60*60*3


function allbrother_0801_IsAct()
	
	local nWeek = tonumber(GetLocalDate("%w"))
	if (nWeek == 5 or nWeek == 6 or nWeek == 0) then
		return 1
	end
end