-- 2007������ؿ�
-- ��4��

Include("\\script\\lib\\string.lua")

--<playerbless> -- [�տ�������]
--<name> -- [����������]
tbMessage={
	["6,1,1346"] = "Ch�c <color=red><playerbless><color> m�t n�m m�i An Khang Th�nh V��ng.<color=red><name><color>",
	["6,1,1347"] = "Ch�c <color=red><playerbless><color> n�m m�i V�n S� Nh� �, l�m �n ph�t t�i.<color=red><name><color>",
	["6,1,1348"] = "Ch�c <color=red><playerbless><color> n�m m�i T�n T�i T�n L�c, V�n S� Hanh Th�ng.<color=red><name><color>",
	["6,1,1349"] = "Ch�c <color=red><playerbless><color> An Khang Th�nh V��ng, gia quy�n m�nh kh�e, l�m �n ph�t ��t.<color=red><name><color>",
	}

ITEM_TASK_TEMP=26
UNIQUE_USE_TASK_TEMP=20
--��֤һ��ף��û����ǰ����ʹ�õڶ�����

function main(sel)

	if (GetTaskTemp(UNIQUE_USE_TASK_TEMP) > 0) then
		Msg2Player("B�n hi�n �ang ph�t c�u ch�c! Xin vui l�ng ��i m�t l�t!");
		return 1;
	end
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 1);
	SetTaskTemp(ITEM_TASK_TEMP,sel);
	
	Say("B�n mu�n nh�n d�p T�t g�i ��n nh�ng th�n h�u nh�ng l�i ch�c t�t ��p nh�t kh�ng?", 2, "Mu�n/sendWish","T�m th�i kh�ng/wishCancel");
	return 1;
end

function sendWish()
		QueryWiseMan("BlessPlayerOnline", "BlessPlayerOffline", 1);
end

function BlessPlayerOnline(TargetName, nSelect, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank)
	local ItemIdx = GetTaskTemp(ITEM_TASK_TEMP);
	local ItemGenre
	local DetailType
	local ParticularType
	
	ItemGenre,DetailType,ParticularType = GetItemProp(ItemIdx)
	local szItemkey = ItemGenre..","..DetailType..","..ParticularType;
	if (ItemIdx > 0 and tbMessage[szItemkey] ~= nil) then
		if (RemoveItemByIndex(ItemIdx) == 1) then
			local szMsg
			szMsg = replace(tbMessage[szItemkey],"<playerbless>",TargetName);
			szMsg = replace(szMsg,"<name>",GetName());
			AddGlobalCountNews(szMsg,1);
		else
			Msg2Player("Kh�ng t�m ���c th�! Xin th� l�i 1 l�n!.")
		end
	else
		Msg2Player("S� d�ng th� th�t b�i, xin th� l�i 1 l�n.")
	end
	SetTaskTemp(ITEM_TASK_TEMP,0)
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end

function BlessPlayerOffline(TargetName, nP)
	Msg2Player("Ng��i m� b�n mu�n ch�c ph�c hi�n kh�ng c� tr�n m�ng! ��i l�c sau th� l�i!.");
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end

function wishCancel()
	SetTaskTemp(ITEM_TASK_TEMP,0);
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end