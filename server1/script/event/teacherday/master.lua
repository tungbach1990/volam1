function givemedicine()
	Say("Ha! Ha! Ha! Kh�ng u�ng c�ng ta �� d�y d� ng��i! �� xem ng��i m�i ta u�ng r��u g� n�o!",5, "D�ng Ti�n Linh T�u/givegod", "D�ng H� C�t t�u/givetiger", "D�ng L�c Nhung t�u/giveantler", "D�ng Nh�n S�m t�u/givepanax", "S� ph�! M�i v� th� n�o?/no");
end

function givegod()
	if(GetItemCountEx(947) >= 1) then
		local i = random(1,3)
		if(i > 1) then
			DelItemEx(947);	
			AddItem(6,1,73,1,0,0);
			Say("H�o t�u! H�o t�u! B�ch Qu� L� n�y t�ng cho ng��i! C�m �n ng��i �� t�ng ta h�o t�u! Ha! Ha! Ha!",0);
			Msg2Player("Nh�n ���c 1 B�ch Qu� L� ");
			WriteLog(date("%H%M%S")..": T�i kho�n"..GetAccount()..", nh�n v�t"..GetName().."���ڽ�ʦ�ڻ�õ�1���ٹ�¶��");				
		else
			DelItemEx(947);
			Say("B�nh r��c n�y h�nh nh� c�t ch�a �� l�u. C� l� ta ph�i �em v� ch�n th�m 1 n�m n�a m�i ph�t huy ���c d��c t�nh",0);
		end
	else
		Say("Ti�n Linh t�u ��u? Ti�n Linh t�u ��u? ��ng n�i l� ng��i �� l�n u�ng h�t r�i nh�!", 0);
	end
end

function givetiger()
	if(GetItemCountEx(948) >= 1) then
		local i = random(1,12)
		if(i > 7) then
			DelItemEx(948);	
			AddItem(6,1,72,1,0,0);
			Say("H�o t�u! H�o t�u! Ti�n S�n B�o L� n�y t�ng cho ng��i! C�m �n ng��i �� t�ng ta h�o t�u! Ha! Ha! Ha!",0);
			Msg2Player("Nh�n ���c 1 Ti�n S�n B�o L� ");
			WriteLog(date("%H%M%S")..": T�i kho�n"..GetAccount()..", nh�n v�t"..GetName().."���ڽ�ʦ�ڻ�õ�1����ɽ��¶��");			
		else
			DelItemEx(948);
			Say("B�nh r��c n�y h�nh nh� c�t ch�a �� l�u. C� l� ta ph�i �em v� ch�n th�m 1 n�m n�a m�i ph�t huy ���c d��c t�nh",0);
		end	
	else
		Say("H� C�t t�u ��u? H� C�t t�u ��u? ��ng n�i l� ng��i �� l�n u�ng h�t r�i nh�!", 0);
	end
end

function giveantler()
	if(GetItemCountEx(949) >= 1) then
		local i = random(1,4)
		if(i > 1) then
			DelItemEx(949);	
			AddItem(6,1,125,1,0,0);
			Say("H�o t�u! H�o t�u! Qu� hoa t�u n�y t�ng cho ng��i! C�m �n ng��i �� t�ng ta h�o t�u! Ha! Ha! Ha!",0);
			Msg2Player("Nh�n ���c 1 b�nh Qu� Hoa t�u");
			WriteLog(date("%H%M%S")..": T�i kho�n"..GetAccount()..", nh�n v�t"..GetName().."���ڽ�ʦ�ڻ�õ�1ƿ�𻨾ơ�");			
		else
			DelItemEx(949);
			Say("B�nh r��c n�y h�nh nh� c�t ch�a �� l�u. C� l� ta ph�i �em v� ch�n th�m 1 n�m n�a m�i ph�t huy ���c d��c t�nh",0);
		end		
	else
		Say("L�c Nhung t�u ��u? L�c Nhung t�u ��u? ��ng n�i l� ng��i �� l�n u�ng h�t r�i nh�!", 0);
	end
end

function givepanax()
	if(GetItemCountEx(950) >= 1) then
		local i = random(1,5)
		if(i > 1) then
			DelItemEx(950);	
			AddItem(6,1,71,1,0,0);
			Say("H�o t�u! H�o t�u! Ti�n Th�o L� n�y t�ng cho ng��i! C�m �n ng��i �� t�ng ta h�o t�u! Ha! Ha! Ha!",0);
			Msg2Player("Nh�n ���c 1 Ti�n Th�o L� ");
			WriteLog(date("%H%M%S")..": T�i kho�n"..GetAccount()..", nh�n v�t"..GetName().."���ڽ�ʦ�ڻ�õ�1ƿ�ɲ�¶��");			
		else
			DelItemEx(950);
			Say("B�nh r��c n�y h�nh nh� c�t ch�a �� l�u. C� l� ta ph�i �em v� ch�n th�m 1 n�m n�a m�i ph�t huy ���c d��c t�nh",0);
		end	
	else
		Say("Nh�n S�m t�u ��u? Nh�n S�m t�u ��u? ��ng n�i l� ng��i �� l�n u�ng h�t r�i nh�!", 0);
	end
end
