
-- ��ʾͬ������������Ϣ

Include("\\UI\\task_plane.lua");

function showpartnermaster(nTaskIdx, nTaskGenre)

local strMaster = OutMasterInfo();
local strRewind = OutRewindInfo();

local i=0;

	for i=1, getn(strMaster) do
		NewTask_TaskTextOut(1, strMaster[i]);
	end;
	
	NewTask_TaskTextOut(1,"<enter>");

	for i=1, getn(strRewind) do
		NewTask_TaskTextOut(1, strRewind[i]);
	end;
	
	NewTask_TaskTextOut(1,"<enter>");
	NewTask_TaskTextOut(1,"<enter>");

end;