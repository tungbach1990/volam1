Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\GM_Tool\\dispose_item.lua");
Include("\\script\\GM_Tool\\exp_recall.lua");
function main()
	local tbOpp = {}
	local str = "<#> M�a ��ng l�nh gi�, Ta m�t m�nh th�t c� ��n !";
	tinsert(tbOpp,"Ta �ang c�n 1 con s� may m�n, ��i hi�p c� th� cho ta kh�ng?/DisposeItem_main");
	tinsert(tbOpp, "<#>Tho�t/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end

function OnCancel()
end