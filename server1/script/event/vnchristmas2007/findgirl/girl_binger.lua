Include("\\script\\event\\vnchristmas2007\\head.lua")
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\event\\mid_autumn\\autumn_portal.lua")
function main()
	local arytalk = 
	{
		[1]="<dec><npc>Gi�ng sinh vui v�! ta l� thi�u n� gi�ng sinh B�ng Nhi, c�ch ��y v�i h�m trong l�c ph�t qu� gi�ng sinh, ba t� mu�i �i c�ng v�i ta l� ��ng Nhi, B�ch Nhi, Tuy�t Nhi �� b� th�t l�c. N�u nh� ��i hi�p c� th� t�m th�y h�, ta nh�t ��nh s� c� l� v�t ��p t�.",
		[2]="Ta mu�n t�m thi�u n� gi�ng sinh/xmas2007_binger_join",
		[3]="T�m hi�u ho�t ��ng thi�u n� Gi�ng sinh/xmas2007_binger_about",
		[4]="�i Minh Nguy�t tr�n/autumn_enter",
		[5]="Tho�t ra/NoChoice",
	}
	CreateTaskSay(arytalk)
	
	
end
function xmas2007_binger_about()
local arytalk = 
	{
		[1]="<dec><npc>T� <color=red>08-12-2007 ��n 13-01-2008<color>, m�i ng�y trong th�i gian <color=red>8:00-9:00, 15:00-16:00, 22:00-23:00<color>, thi�u n� gi�ng sinh s� ng�u nhi�n xu�t hi�n t�i <color=yellow>Th�t ��i th�nh th� ho�c Tr��ng B�ch S�n Nam, Tr��ng B�ch S�n B�c<color>. Sau khi h� th�ng c�ng b�, v� l�m nh�n s� c� th� ��n g�p <color=yellow>B�ng Nhi<color> �� b�o danh tham gia, v� l�n l��t t�m c�c thi�u n� gi�ng sinh <color=yellow>��ng Nhi, B�ch Nhi, Tuy�t Nhi<color>. Ba v� ��i hi�p ��u ti�n t�m ���c h� c� th� ��n <color=yellow>Tuy�t Nhi<color> �� nh�n th��ng.",
		[2]="Ha ha, ta hi�u r�i/main"
	}	
	CreateTaskSay(arytalk)
end
function xmas2007_binger_join()
	if xmas2007_findgirl_checktime() == 0 or GetGlbValue(xmas2007_findgirl_gblvalue_taskID)~=1 then
		CreateTaskSay({"<dec><npc>Ho�t ��ng v�n ch�a b�t ��u, l�c kh�c h�y ��n v�y!","Tho�t ra/NoChoice"})
		return
	end
	
	local ntaskdate = GetTask(xmas2007_findgirl_limit_taskID)
	local ndate = xmas2007_findgirl_returndate()
	if ntaskdate ~= ndate then
		SetTask(xmas2007_findgirl_limit_taskID,ndate)
		SetTask(xmas2007_findgirl_taskID,0)
	end
	if GetTask(xmas2007_findgirl_taskID) == 4 then
		CreateTaskSay({"<dec><npc>Xin �a t�, c�c t� mu�i �� ��ng �� � ��y r�i, h�n g�p l�n sau nh�!","Tho�t ra/NoChoice"})
		return		
	end
	if GetTask(xmas2007_findgirl_taskID) ~= 0 then
		CreateTaskSay({"<dec><npc>H�y mau �i t�m thi�u n� th�n b�.","Tho�t ra/NoChoice"})
		return
	end
		SetTask(xmas2007_findgirl_taskID,1)
		CreateTaskSay({"<dec><npc>H�y gi�p ta t�m ��ng Nhi v� ��y!","Tho�t ra/NoChoice"})
end

function xmas2007_findgirl_checktime()
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	if ndate < 07120800 or ndate > 08011324 then
		return 0
	end	
	
	local nhm = tonumber(GetLocalDate("%H%M"))
	if nhm >= 800 and nhm < 920 then
		return 1
	elseif nhm >= 1500 and nhm < 1620 then
		return 1
	elseif nhm >= 2200 and nhm < 2320 then
		return 1
	else
		return 0
	end
end
