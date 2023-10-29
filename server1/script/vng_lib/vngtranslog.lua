Include("\\script\\vng_lib\\files_lib.lua")
IncludeLib("SETTING")
local tbVngFactionName = 
{
[-1]="Ch�a nh�p ph�i",
 [0]="Thi�u L�m ph�i",
 [1]="Thi�n V��ng Bang",
 [2]="���ng M�n",
 [3]="Ng� ��c Gi�o",
 [4]="Nga My ph�i",
 [5]="Th�y Y�n m�n",
 [6]="C�i Bang",
 [7]="Thi�n Nh�n Gi�o",
 [8]="V� �ang ph�i",
 [9]="C�n L�n ph�i",
}
tbVngTransLog = {}
tbVngTransLog.strFolder = "vng_data/Logs/"

function tbVngTransLog:Write(strEventFolder, nPromotionID, ...)
--Close
do return end
	local strFilePath = self.strFolder..strEventFolder
	local strFileName = GetLocalDate("%Y_%m_%d_").."TransLog.txt"
	local tbLog2Write = {
		GetLocalDate("%Y-%m-%d %H:%M:%S"),
		GetAccount() or "",
		GetName() or "",
		GetLevel() or 0,
		ST_GetTransLifeCount(),
		%tbVngFactionName[GetLastFactionNumber()] or "",
		GetWorldPos() or 0,
		nPromotionID,		
	}
	for i = 1, getn(arg) do
		tinsert(tbLog2Write, arg[i])
	end
	%tbVngLib_File:Table2File(strFilePath, strFileName, "a", tbLog2Write)
end