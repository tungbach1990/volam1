-- Edit  by Youtube PGaming--
IncludeLib("SETTING")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\awardtemplet.lua")
function main ()	
	if (GetTask(69) == 11) then
	OnClick()
	elseif (GetTask(69) == 12) then
Msg2Player("�� thu th�p �� m�c li�u, kh�ng c�n thu th�p th�m n�a.")
	elseif (GetTask(69) > 09) and (GetTask(69) < 12) then
	Msg2Player("��nh b�i th� h� H�c Di�p Linh H�u m�i ch�t ���c c�y.") 
	end	
end

local _GetFruit = function(nItemIndex)
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3957,0,0,0}, nBindState=-2}, "test", 1);
	Msg2Player("��i hi�p �� thu th�p �� H�ng M�c.") 
	AddNote("Nh�n ���c 1 b� H�ng M�c.") 
	AddNote("��i hi�p �� thu th�p �� H�ng M�c.") 
	SetTask(69,12)	
end

local _OnBreak = function()
	Msg2Player("Qu� tr�nh thu th�p b� gi�n �o�n.")
end

function OnClick()
tbProgressBar:OpenByConfig(6, %_GetFruit,{nItemIdx}, %_OnBreak)
end

