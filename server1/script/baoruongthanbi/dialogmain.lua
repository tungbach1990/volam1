Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\baoruongthanbi\\openbox\\openbox.lua")
Include("\\script\\baoruongthanbi\\key\\definitionkey.lua")
Include("\\script\\baoruongthanbi\\key\\keyupgrade.lua")


function BRTB_Dialog_main()
	
	local tbOpp = {}
	--local nDay = tonumber(GetLocalDate("%Y%m%d"))
	local str = "<#> Kh�ng bi�t ta c� th� gi�p g� cho ��i hi�p ?";
	
	tinsert(tbOpp,"Ta ��n nh� m� R��ng Th�n B�/OpenBox_main");
	tinsert(tbOpp,"Ta ��n nh� gi�m ��nh l�i Ch�a Kh�a V�n N�ng/DefinitionKey_main");
	tinsert(tbOpp,"Ta ��n nh� n�ng c�p Ch�a Kh�a V�n N�ng/KeyUpgrade_main");
	tinsert(tbOpp, "<#>Tho�t/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end
function OnCancel()
end 

