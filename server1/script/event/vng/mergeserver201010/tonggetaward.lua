--Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\event\\vng\\MergeServer201010\\head.lua")
--Include("\\script\\tong\\tong_header.lua")
--Include("\\script\\missions\\citywar_global\\head.lua");
Include("\\script\\missions\\citywar_global\\infocenter_head.lua")

function MergeSV_TongGetBonus()
	if checkBangHuiLimit() == 0 then
			Say("Xin l�i! ��i hi�p ch�a gia nh�p bang h�i n�o c�!",0);
			return 0;
	end
	local szTongName, nTongID = GetTongName();
	local figure = TONGM_GetFigure(nTongID, GetName())
	if (figure ~= TONG_MASTER) then
		Say("Th�t ��ng ti�c, ch� c� bang ch� m�i c� th� nh�n ph�n th��ng.", 0)
		return
	end
	local IsTongGetItem = TONG_GetTaskValue(nTongID, Task_TongGet_Award) 
	if (IsTongGetItem ~= 0) then
		Say("Ph�n th��ng n�y m�i bang h�i ch� nh�n 1 l�n.", 0)
		return
	end
	checkCreatLG(szTongName);
	checkJoinLG(szTongName);
	TONG_ApplySetTaskValue(nTongID, Task_TongGet_Award, 1)
	local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
	LG_ApplyAppendMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName, szTongName, LGTSK_TIAOZHANLING_COUNT, 10000, "", "");
	Msg2Player("��i hi�p n�p th�nh c�ng 10000 Khi�u Chi�n L�nh cho Bang H�i !")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Event Merge Server 2001010"..GetAccount().."\t"..GetName().."\t".."N�p th�nh c�ng 10000 KCL cho Bang H�i")
end