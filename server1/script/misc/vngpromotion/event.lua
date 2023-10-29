Include("\\script\\lib\\basic.lua")

COIN_EXTPOINT = 3

function takeCoin()
	Say("Trong th�i gian t� 25-09-2009 ��n 24h 01-11-2009 s� di�n ra ho�t ��ng khuy�n m�i m�ng Trung Thu L� H�i. Qu� kh�ch n�p th� s� ng�u nhi�n ���c t�ng Ti�n ��ng v�o t�i kho�n.",2,"Cho ta nh�n ti�n ��ng/wantCoin","Ta bi�t r�i/OnCancel")
end;

function wantCoin()
	local nExtValue = GetExtPoint(COIN_EXTPOINT)
	
	if (nExtValue <= 0) then
		Say("Xin m�i Qu� kh�ch n�p th� �� c� c� h�i nh�n Ti�n ��ng!",0)
		return
	end
	
	Say("Hi�n t�i Qu� kh�ch c� t�ng c�ng <color=yellow>"..nExtValue.."<color> ti�n ��ng trong t�i kho�n. X�c nh�n l�y ra h�t ch�?",2,"��ng r�i, ta mu�n l�y/sureCoin","Hi�n t�i ta ch�a c�n/OnCancel")
end;

function sureCoin()
	local nExtValue = GetExtPoint(COIN_EXTPOINT)
	
	if (nExtValue <=0 ) then
		Say("C� l�i x�y ra khi r�t ti�n ��ng. Xin li�n h� b� ph�n k� thu�t",0)
		return
	end
	
	local nMod = mod(nExtValue, 100)
	local nReal = nExtValue / 100
	if (nMod ~= 0) then nReal = nReal + 1 end
	
	if (CalcFreeItemCellCount() < nReal) then
		Say("�ng ch� Ti�n Trang: H�nh trang kh�ng �� ch� tr�ng, h�y s�p x�p l�i h�nh trang.",0)
		return
	end
	
	local nFinish = 0
	local nCoin = nExtValue
	
	while (nFinish == 0) do
		if (nCoin <= 100) then
			PayExtPoint(COIN_EXTPOINT, nCoin)
			AddStackItem(nCoin,4,417,1,1,0,0,0)
			nFinish = 1
		else
			PayExtPoint(COIN_EXTPOINT, 100)
			AddStackItem(100,4,417,1,1,0,0,0)
			nCoin = nCoin - 100
		end
	end

	Say("Ti�n ��ng c�a Qu� kh�ch ��y, xin h�y nh�n l�y. Ch�c Qu� kh�ch vui v�.",0)
	Msg2Player("B�n nh�n ���c "..nExtValue.." ti�n ��ng")
	WriteLog(format("[VNGPROMOTION]\tDate:%s\tAccount:%s\tName:%s\ttake:%s coin",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),nExtValue))
end;

function OnCancel()
end;
