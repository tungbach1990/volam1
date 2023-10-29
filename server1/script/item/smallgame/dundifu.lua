IncludeLib("FILESYS")
Include("\\script\\missions\\zhaojingling\\head.lua")

function main(nItemID, nNpcIndex)
	local szTabPos = "\\settings\\maps\\chrismas\\player.txt"
	local szTargetName = GetNpcName(nNpcIndex)
	local szItemName = GetItemName(nItemID)
	
	local nMapId = GetTask(TSK_GROUPID)
	
	local nX, nY = getposfromfile(szTabPos, 8 + 8 * nMapId, 15 + 8 * nMapId)
	SetPos(floor(nX / 32), floor(nY / 32))
	
	Msg2Player("<#>Ng��i s� d�ng m�t <color=0xB5FDD7>��n Th� Ph�<color>, chuy�n ��n v� tr� kh�c c�a b�n ��.")
	return 0
end

function getposfromfile(szPosPath, nBeginRow, nEndRow)
	if (TabFile_Load(szPosPath, szPosPath) == 0) then
		print("Load TabFile Error!"..szPosPath)
		return 0
	end
	local nRow = random(nBeginRow, nEndRow)
	local nX = TabFile_GetCell(szPosPath, nRow, "POSX")
	local nY = TabFile_GetCell(szPosPath, nRow, "POSY")
	return nX, nY
end

