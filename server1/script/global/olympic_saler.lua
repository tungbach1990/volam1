Include("\\script\\global\\olympics_award.lua")

TEMP_QID = 122;
TEMP_QCHOOSE = 123;

function onBuyTicket()
if (IsCharged() ~= 1 ) then
	 Say("Xin l�i! B�n v�n ch�a n�p Card n�n kh�ng th� tham gia mua v� s� Athens. ", 0)
	return
end
nCount = GetTicketCount();

if (nCount == 0 ) then 
	Say("Xin l�i! Hi�n gi� ch�a b�n v� s�! ", 0)
	return
end;

Tab = {};
for i = 1, nCount do 
	Tab[i] = GetQuestionTip(GetTicket(i)).."/OSAsk";
end;
Tab[nCount + 1] = "T�m th�i kh�ng tham gia tranh �o�n n�a/Cancel";
Say("5000 m�t t� v� s�, mu�n mua kh�ng? ", nCount + 1, Tab)
end;

function OSAsk(nSel)
	nQId = GetTicket(nSel + 1);

	if (nQId == 1000) then
		onMedalmain()
		return	
	end

	Choose = {};
	ChooseCount = GetChooseCount(nQId);
	for i = 1,  ChooseCount do 
		Choose[i] = GetChoose(nQId, i).."/OSSale";
	end;
	Choose[ChooseCount + 1] = "T�m th�i kh�ng tham gia tranh �o�n n�a/Cancel";
	Say(GetQuestion(nQId), ChooseCount + 1, Choose);
	SetTaskTemp(TEMP_QID, nQId)
end;

function OSSale(nSel)
	if (GetTaskTemp(TEMP_QID) == 0) then 
		return
	end
	SetTaskTemp(TEMP_QCHOOSE, nSel + 1)
	Say(GetQuestion(GetTaskTemp(TEMP_QID)).."\n��t:<color=yellow>"..GetChoose(GetTaskTemp(TEMP_QID), GetTaskTemp(TEMP_QCHOOSE)).."<color>\ngi�: 5000", 2, "���c, ta mua. /OSOnSale", "T�m th�i kh�ng mua/OSCancel");
end;

function OSOnSale()
	nQId = GetTaskTemp(TEMP_QID);
	nQChoose = GetTaskTemp(TEMP_QCHOOSE);
	if (nQId > 0 and nQChoose > 0) then 
		if (Pay(GetQuestionPrice(nQId)) > 0) then 
			if (AddTicket(nQId, nQChoose) == 1) then
				nItem = AddItem(6,1,75,1,0,0)
				SetSpecItemParam(nItem, 1, nQId)
				SetSpecItemParam(nItem, 2, nQChoose)
				SyncItem(nItem)
				Msg2Player("Mua th�nh c�ng m�t t� v� s�. ")
			else
				Earn(GetQuestionPrice(nQId))
				Say("Xin l�i! Kh�ng th� mua v� s� c�ng lo�i. ",0)
			end
		else
			Say("Ti�n tr�n ng��i b�n kh�ng ��! ",0)
		end;
	end
end

function OSCancel()

end;
