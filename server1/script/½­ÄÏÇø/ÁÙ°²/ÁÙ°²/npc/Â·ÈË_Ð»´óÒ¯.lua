-- �ٰ���·�ˡ�л��ү
-- by��Dan_Deng(2003-09-16)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(192) == 1 then
		allbrother_0801_FindNpcTaskDialog(192)
		return 0;
	end
	Talk(1,"","Con d�u c�a ta th�t ngoan. C�n h�n c� con ru�t. H�m qua ta b� tr�ng gi�, n� lo l�ng cho ta m�i th�,b�y gi� l�i �i mua thu�c r�i. ")
end;
