Include("\\script\\activitysys\\playerfunlib.lua");
Include("\\script\\misc\\taskmanager.lua");
IncludeLib("LEAGUE")

tbColor = 
{
	"green", 
	"cyan", 
	"pink", 
	"violet", 
	"orange", 
	"gold", 
	"white",
}

tbBless = 
{
	"An Khang Th�nh V��ng", 
	"Ni�m Vui B�t T�n", 
	"T�i L�c g�t ho�i kh�ng h�t", 
	"Th� d� thi�n t� ", 
	"V�n s� nh� �", 
	"B�ch s� ��i C�t", 
	"N�p Ph�c Ngh�nh ���ng",
	"Kh�ng c�n k� say, ch� c�n ng��i ngay, l�c n�o c�ng may",
	"Qu� c�p bao la, c� nh� no ��",
	"V�ng b�c ��y t�, gia ch� ph�t t�i",
	"Gi� tr� g�i trai, vui v�y sum h�p",
	"Ti�n nhi�u nh� k�o, t�nh ch�t nh� keo",
	"T� tin, ki�n nh�n, can ��m h�a quy�n v�o b�n",
	"Quy�t �o�n, l�c quan, h�i h��c lu�n lu�n k� b�n",
	"Xui x�o, ��ng cay tr�nh xa h�ng c�y s�",
	"C� ���c v� tr� t�nh th��ng, ��i d��ng t�nh c�m",
	"�i�p kh�c t�nh y�u, ng��i y�u l� t��ng",
	"V�ng x�y t� �m v� l�m con ngoan",
}

TSK_HECA_COUNT = TaskManager:GetTaskId(1, 8);

function main()

	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= 20100322) then
		Msg2Player("V�t ph�m n�y �� qu� h�n.");
		return 0;
	end
	
	local nTeamSize = GetTeamSize();
	if (nTeamSize ~= 2) then
		lib:ShowMessage("Kh�ng th�a m�n �i�u ki�n c�a t� ��i!");
		return 1;
	end
	
	for i=1,nTeamSize do
		local nLv = doFunByPlayer(GetTeamMember(i), GetLevel);
		local nExPoint = doFunByPlayer(GetTeamMember(i), GetExtPoint, 0);
		
		if (nLv < 50 or nExPoint < 1) then
			lib:ShowMessage(format("%s%s","Th�nh vi�n t� ��i t�t c� ph�i l�", format("C�p <color=green>%d<color> tr� l�n v� �� n�p th� m�i c� th� %s",50,"S� d�ng ")));
			return 1;
		end
	end
	
	for i=1,nTeamSize do
		local nIdx = GetTeamMember(i);
		
		if (doFunByPlayer(nIdx, PlayerFunLib.CheckTask, PlayerFunLib,TSK_HECA_COUNT,"6000",format("Th�ng qua s� d�ng [%s] nhi�u nh�t ch� ���c %s kinh nghi�m","Thi�p ch�c xu�n","<color=green>600000000<color=green>"),"<") == 1) then
			doFunByPlayer(nIdx, PlayerFunLib.AddExp, PlayerFunLib, 5000000, 0, format("%s ph�n th��ng","Thi�p ch�c xu�n"));
			doFunByPlayer(nIdx, PlayerFunLib.AddTask, PlayerFunLib, TSK_HECA_COUNT, 50);
		end
		
		if (nIdx ~= PlayerIndex) then
			local szMsg = format("<color=yellow>%s <color> ch�c <color=yellow>%s<color> <color=%s>%s<color>",GetName(), doFunByPlayer(nIdx, GetName), tbColor[random(1,getn(tbColor))], tbBless[random(1,getn(tbBless))]);
			LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szMsg , "", "");
		end
	end

	return 0;
end