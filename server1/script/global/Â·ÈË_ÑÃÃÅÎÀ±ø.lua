if (not __GOVERM_SOLDIER_H__) then
    __GOVERM_SOLDIER_H__ = 1;
Include("\\script\\missions\\springfestival\\dialog.lua");

function gsoldier_entance()
	local aryszContent = {	"T�m hi�u th�ng tin kh�c/main_former",
							"D�o n�y ta b�n qu�, t�m ng��i kh�c �i!/OnCancel"};
							
	if (sf06_isactive() == 1) then
		tinsert(aryszContent, 1, "Ho�t ��ng ng�y Xu�n/sf06_mainentrance");
	end;
	
	if (getn(aryszContent) > 2) then
		Say("<color=yellow>V� binh nha m�n<color>: Qu�c gia �ang chi�u m� ng��i t�i, xem ra ng��i c�ng l� m�t ng��i h�c v�, c� mu�n gi�p �� hay kh�ng?", getn(aryszContent), aryszContent);
	else
		main_former();
	end;
	
end;

function OnCancel()
	
end;
end; --// end of __GOVERM_SOLDIER_H__