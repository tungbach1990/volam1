Include( "\\script\\item\\checkmapid.lua" )
IncludeLib("BATTLE")

function EatMedicine()
	for j = 1, getn(tbCD_MAP) do
		if ( nMapId == tbCD_MAP[j] ) then
			Msg2Player("V�t ph�m n�y ch� c� th� s� d�ng � Chi�n tr��ng T�ng Kim");
			return -1
		end
	end
	W, X, Y = GetWorldPos();
	nowmissionid = BT_GetData(PL_RULEID);	--��ȡ��ǰMISSIONID
	curcamp = GetCurCamp();
	X = floor( X / 8 );
	Y = floor( Y / 16 );
	string = "<#><color=yellow>"..GetName().."<#> <color><color=pink>: 'T�a �� hi�n t�i c�a ta l� <color=yellow> ("..X.."<#>, "..Y.."<#> )<color>. H�y ��n gi�p ta m�t tay.'";
	Msg2MSGroup( nowmissionid, string, curcamp );
	Msg2Player("B�n s� d�ng b� c�u th�ng b�o cho chi�n h�u t�a �� hi�n t�i c�a b�n.");
end
