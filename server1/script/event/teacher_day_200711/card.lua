--���˽����
--����������ף����
IL("SETTING")
TEMPSK_ITEM_PID = 192
TB_FORBIDWORD = {
	"<item=",
	"<link=",
	"<pic=",
	"<color=",
	"<bclr=",
	"<enter",
}
tbTeacherDay200711CardBless = 
{
	[1588] = {szName = "Thi�p ch�c s� ph�", GreetingWord = "D�ng �� g�i l�i ch�c ��n s� ph�", szBless = "<color=green>%s<color>  ch�c s� ph� <color=green>%s<color> ti�n t�i nh� n��c, l�n c�p v�o v�o."},
	[1589] = {szName = "Thi�p ch�c �� t�", GreetingWord = "D�ng �� g�i l�i ch�c ��n �� t�", szBless = "<color=green>%s<color> ch�c �� t� <color=green>%s<color> h�c ngh� tinh th�ng, r�ng danh m�n ph�i."},
	[1590] = {szName = "Thi�p ch�c h�o h�u", GreetingWord = "D�ng �� g�i l�i ch�c ��n h�o h�u", szBless = "<color=green>%s<color> ch�c h�o h�u <color=green>%s<color> c�ng th�nh danh to�i, r��ng ��y nguy�n b�o."},
	[1591] = {szName = "Thi�p ch�c c�u nh�n", GreetingWord = "D�ng �� g�i l�i ch�c ��n c�u nh�n", szBless = "<color=green>%s<color> ch�c c�u nh�n <color=green>%s<color> b�n th�n b�t to�i, to�n th�n b�t ��ng."},
	[1592] = {szName = "Thi�p ch�c bang h�i", GreetingWord = "D�ng �� g�i l�i ch�c ��n bang h�i", szBless = "<color=green>%s<color> ch�c bang h�i <color=green>%s<color> tr�m tr�n tr�m th�ng, may m�n Ho�ng Kim."},
	[1593] = {szName = "Thi�p ch�c gi�o ch�", GreetingWord = "D�ng �� g�i l�i ch�c ��n gi�o ch�", szBless = "<color=green>%s<color> ch�c gi�o ch� <color=green>%s<color> v� c�ng c�i th�, nh�t th�ng thi�n h�."},
	[1594] = {szName = "Thi�p ch�c s� mu�i", GreetingWord = "D�ng �� g�i l�i ch�c ��n s� mu�i", szBless = "<color=green>%s<color> ch�c s� mu�i <color=green>%s<color> xinh x�n d� th��ng, s�m ng�y xu�t gi�."},
	[1595] = {szName = "Thi�p ch�c bang ch�", GreetingWord = "D�ng �� g�i l�i ch�c ��n bang ch�", szBless = "<color=green>%s<color> ch�c bang ch� <color=green>%s<color> th�n c�ng h� th�, thi�n h� v� ��i."},
	[1596] = {szName = "Thi�p ch�c s� ��", GreetingWord = "D�ng �� g�i l�i ch�c ��n s� ��", szBless = "<color=green>%s<color> ch�c s� �� <color=green>%s<color> th�ng minh lanh l�i, s�m ng�y th�nh th�n."},
	[1597] = {szName = "Thi�p ch�c s� huynh", GreetingWord = "D�ng �� g�i l�i ch�c ��n s� huynh", szBless = "<color=green>%s<color> ch�c s� huynh <color=green>%s<color> h�c ���c th�n c�ng, h�nh hi�p tr��ng ngh�a."},
}

function TeacherDay200711_card_main(nParti)
	SetTaskTemp(TEMPSK_ITEM_PID, nParti);
	Say(tbTeacherDay200711CardBless[nParti].GreetingWord, 2,"G�i t�ng/TeacherDay200711_card_want2present", "H�y b� /TeacherDay200711_card_OnCancel");
	return 1
end

function TeacherDay200711_card_want2present()
	AskClientForString("TeacherDay200711_card_PlayerSelect", "", 1, 16, "Xin nh�p t�n ��i ph��ng");
end

function TeacherDay200711_card_PlayerSelect(szRoleName)
	if (ST_CheckTextFilter(szRoleName) ~= 1) then
		Say("Xin l�i! T�n b�n nh�p v�o c� ch� kh�ng h�p l�, h�y th� l�i l�n n�a!", 0)
		return
	end
	
	for i = 1, getn(TB_FORBIDWORD) do
		local bp = strfind(szRoleName, TB_FORBIDWORD[i])
		if (bp ~= nil) then
			Say("Xin l�i! T�n b�n nh�p v�o c� ch� kh�ng h�p l�, h�y th� l�i l�n n�a!", 0)
			return
		end
	end
	local nParti = GetTaskTemp(TEMPSK_ITEM_PID)
	if (nParti == 0) then
		return
	end
	SetTaskTemp(TEMPSK_ITEM_PID,0)
	local szBless = format(tbTeacherDay200711CardBless[nParti].szBless,GetName(),szRoleName);	
	if (CalcEquiproomItemCount(6, 1, nParti, -1) >= 1) then
		ConsumeEquiproomItem(1, 6, 1, nParti, -1);
		AddGlobalNews(szBless,1);
		SetTask(TSK_TeacherDay200711_CardUseTime,GetCurServerTime());
	else
		Say(format("T�m kh�ng th�y %s, h�y th� l�i!",tbTeacherDay200711CardBless[nParti].szName), 0)
	end
end

function TeacherDay200711_card_BlessPlayerOnline(szBless)
	
end

function TeacherDay200711_card_OnCancel()
	SetTaskTemp(TEMPSK_ITEM_PID,0)
end