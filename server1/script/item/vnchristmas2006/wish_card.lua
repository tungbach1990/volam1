-- Created by Danielsun 2006-12-07
-- ף����
-- һ��������ף����,ÿ�ŵ�ף���ﶼ��ͬ.

Include("\\script\\lib\\string.lua")

--<playerbless> -- [�տ�������]
--<name> -- [����������]
tbMessage={
	["6,1,1328"] = "Chuc <color=red><playerbless><color> mot Giang Sinh va Nam moi vui ve <color=red><name><color>",
	["6,1,1329"] = "<color=red><playerbless><color> than yeu, chuc nang mot giang sinh vui ve <color=red><name><color>",
	["6,1,1330"] = "<color=red><playerbless><color> than yeu, chuc chang mot giang sinh vui ve <color=red><name><color>",
	["6,1,1331"] = "Voi tat ca tam long, ta xin chuc cho <color=red><playerbless><color> mot Giang sinh vui ve. <color=red><name><color>",
	["6,1,1332"] = "Voi tat ca tam long, ta xin chuc cho <color=red><playerbless><color> mot nam moi vui ve va hanh phuc <color=red><name><color>",
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
	
	Say("B�n c� mu�n g�i thi�p ch�c gi�ng sinh cho b�n b� kh�ng?", 2, "Mu�n/sendWish","T�m th�i kh�ng/wishCancel");
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