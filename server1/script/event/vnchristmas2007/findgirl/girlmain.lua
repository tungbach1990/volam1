Include("\\script\\event\\vnchristmas2007\\head.lua")
Include("\\script\\task\\system\\task_string.lua")


function xmas2007_getnextgirlname()
	local sznextgirl = ""
	local ntask = GetTask(xmas2007_findgirl_taskID)
	if ntask == 0 then
		sznextgirl = "B�ng Nhi"
	elseif ntask == 1 then
		sznextgirl = "��ng Nhi"
	elseif ntask == 2 then
		sznextgirl = "B�ch Nhi"
	elseif ntask == 3 then
		sznextgirl = "Tuy�t Nhi"
	end
	return sznextgirl
end
function main()
	--local nidx = GetNpcIdx()

	local tbarytalk = 
	{
		[1]= "<dec><npc>Ta v� c�c t� mu�i �� th�t l�c nhau r�i, ��i hi�p c� th� gi�p ta t�m mu�i mu�i ���c kh�ng? H�y gi�p ta t�m <color=yellow>B�ng Nhi<color> tr��c, c� th� mu�i �y �ang � trong th�nh.",
		[2]= "<dec><npc>Th� ra c�c t� mu�i ta nh� ��i hi�p �i t�m ta, nh�ng gi� v�n ch�a t�m ���c <color=yellow>%s<color> n�a, l�m phi�n ��i hi�p v�y!",
		[3]= "<dec><npc>��i hi�p, ch�ng t�i v�n ch�a t�m th�y <color=yellow>%s<color> n�a, phi�n ��i hi�p �i t�m m�t chuy�n n�a.",
		[4]= "<dec><npc>Xin ch�c m�ng, ��i hi�p �� nh�n ���c ph�n th��ng gi� tr�, hi v�ng l�n sau s� g�p l�i",
		[5]= "<dec><npc>Xin ch�c m�ng, ��i hi�p �� t�m ���c ch�ng t�i.",
		[6]= "Nh�n ���c <color=yellow>%s<color> �i�m kinh nghi�m",
		[7]= "<dec><npc>��i hi�p ��n qu� mu�n r�i, �� c� 3 ng��i �� t�m th�y t�i, l�n sau ��n s�m h�n nh�.",

	}
	local nidx = GetLastDiagNpc()
	local ngirl = GetNpcParam(nidx,1)
	local szgirl = GetNpcName(nidx)
	local ntask = GetTask(xmas2007_findgirl_taskID)
	local sznextgirl = ""
	sznextgirl = xmas2007_getnextgirlname()
	local ntaskdate = GetTask(xmas2007_findgirl_limit_taskID)
	local ndate = xmas2007_findgirl_returndate()
	if ntaskdate ~= ndate then
		SetTask(xmas2007_findgirl_limit_taskID,ndate)
		SetTask(xmas2007_findgirl_taskID,0)
		local arysay = {}
		arysay[1] = tbarytalk[1]
		arysay[2] = "���c!/NoChoice"
		CreateTaskSay(arysay)
		return
	end
	if ntask == 0 then
		local arysay = {}
		arysay[1] = tbarytalk[1]
		arysay[2] = "���c!/NoChoice"
		CreateTaskSay(arysay)
		return
	
	elseif ntask == 4 then
		local arysay = {}
		arysay[1] = tbarytalk[4]
		arysay[2] = "���c!/NoChoice"
		CreateTaskSay(arysay)		
		return
	end
	if ngirl == 1 then
		if ntask == 1 then
			SetTask(xmas2007_findgirl_taskID,2)
			sznextgirl = xmas2007_getnextgirlname()
			local arysay = {}
			arysay[1] = format(tbarytalk[2],sznextgirl)
			arysay[2] = "���c!/NoChoice"
			CreateTaskSay(arysay)
			return
		else
			local arysay = {}
			arysay[1] = format(tbarytalk[3],sznextgirl)
			arysay[2] = "���c!/NoChoice"
			CreateTaskSay(arysay)
			return
		end
		
	elseif ngirl == 2 then
		if ntask == 2 then
			SetTask(xmas2007_findgirl_taskID,3)
			sznextgirl = xmas2007_getnextgirlname()
			local arysay = {}
			arysay[1] = format(tbarytalk[2],sznextgirl)
			arysay[2] = "���c!/NoChoice"
			CreateTaskSay(arysay)
			return
		else
			local arysay = {}
			arysay[1] = format(tbarytalk[3],sznextgirl)
			arysay[2] = "���c!/NoChoice"
			CreateTaskSay(arysay)
			return
		end
	elseif ngirl == 3 then
		if ntask == 3 then
			
			local nsort = GetNpcParam(nidx,2)
			if nsort < 3 then
				SetTask(xmas2007_findgirl_taskID,4)
				SetNpcParam(nidx,2,(nsort+1))
				AddOwnExp(xmas2007_findgirl_exp)
				Msg2Player(format(tbarytalk[6],xmas2007_findgirl_exp))
				xmas2007_sdl_writeLog("T�m ki�m thi�u n� th�n b�",format("Nh�n ���c %s �i�m kinh nghi�m",xmas2007_findgirl_exp),0)
				xmas2007_findgirl_award()
				local arysay = {}
				arysay[1] = format(tbarytalk[5])
				arysay[2] = "���c!/NoChoice"
				CreateTaskSay(arysay)
				return
			else
				local arysay = {}
				arysay[1] = format(tbarytalk[7])
				arysay[2] = "���c!/NoChoice"
				CreateTaskSay(arysay)
				return
			end
		else
			local arysay = {}
			arysay[1] = format(tbarytalk[3],sznextgirl)
			arysay[2] = "���c!/NoChoice"
			CreateTaskSay(arysay)
			return
		end
	end
	
end

function xmas2007_findgirl_award()
	local nallrate = tb_xmas2007_findgirl_item[1]
	local np = random(1,nallrate)
	local nsum = 0
	for ni=2,getn(tb_xmas2007_findgirl_item) do
		local tbitem = tb_xmas2007_findgirl_item[ni]
		nsum = nsum + tbitem[1]*nallrate
		if nsum > np then
			AddGoldItem(tbitem[2][1],tbitem[2][2])
			Msg2Player(format("Nh�n ���c <color=yellow>%s<color>",tbitem[3]))
			xmas2007_sdl_writeLog("T�m ki�m thi�u n� th�n b�",format("Nh�n ���c trang b� ho�ng kim %s",tbitem[3]))
			return 
		end
	end
end
