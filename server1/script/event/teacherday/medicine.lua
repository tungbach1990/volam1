function brew()
	Say("Kinh nghi�m �i�u ch� d��c t�u c�a b�n ti�m xa g�n ��u bi�t ti�ng. Kh�ch quan mu�n �i�u ch� lo�i d��c t�u g�?", 6, "Ti�n Linh t�u/god", "H� C�t T�u/tiger", "L�c Nhung t�u/antler", "Nh�n S�m t�u/panax", "Ta mu�n bi�t c�ch th�c �i�u ch� d��c t�u!/aboutbrewing", "Ta ph�i �i t�m th�m d��c li�u/no");
end

function god()
	Say("Ti�n Linh t�u c�n c� 3 Linh Chi th�o. Kh�ch quan �� c� �� d��c li�u ch�a?",2, "�� r�i! S� ph� h�y ch�ng minh kinh nghi�m gia truy�n c�a m�nh �i!/godyes", "Ta ph�i �i t�m th�m d��c li�u/no");
end

function tiger()
	Say("H� C�t t�u c�n c� 1 Linh Chi th�o v� 3 H� c�t. Kh�ch quan �� c� �� d��c li�u ch�a?",2, "�� r�i! S� ph� h�y ch�ng minh kinh nghi�m gia truy�n c�a m�nh �i!/tigeryes", "Ta ph�i �i t�m th�m d��c li�u/no");
end

function antler()
	Say("L�c Nhung t�u c�n c� 1 Linh Chi th�o v� 3 L�c Nhung. Kh�ch quan �� c� �� d��c li�u ch�a?",2, "�� r�i! S� ph� h�y ch�ng minh kinh nghi�m gia truy�n c�a m�nh �i!/antleryes", "Ta ph�i �i t�m th�m d��c li�u/no");
end

function panax()
	Say("Nh�n S�m t�u c�n c� 1 Linh Chi th�o v� 3 Nh�n S�m. Kh�ch quan �� c� �� d��c li�u ch�a?",2, "�� r�i! S� ph� h�y ch�ng minh kinh nghi�m gia truy�n c�a m�nh �i!/panaxyes", "Ta ph�i �i t�m th�m d��c li�u/no");
end

function godyes()
	if(GetItemCountEx(943) >= 3) then
		local i = random(1,4);
		if(i > 1) then
			for j=1, 3 do 
				DelItemEx(943);			
			end
			AddEventItem(947);
			Say("Linh Chi th�o th��ng h�ng c�ng v�i kinh nghi�m gia truy�n c�a ta, Ti�n Linh t�u n�y kh�ng ai c� th� ch� ���c!",0);
			Msg2Player("Nh�n ���c 1 b�nh Ti�n Linh t�u");
			WriteLog(date("%H%M%S")..": T�i kho�n"..GetAccount()..", nh�n v�t"..GetName().."�����Ƴ���1ƿ����ơ�");
		else
			DelItemEx(943);
			Say("C� 1 Linh chi ch�a �� tu�i, ph�i d��c s� k�m ch�t l��ng. Kh�ch quan h�y ch�u kh� �i t�m c�i kh�c �i! Ta � ��y ch�!",0);
		end
	else
		Say("Kh�ch quan v�n ch�a �� d��c li�u! Th� l�i ta kh�ng gi�p ���c!",0);
	end
end

function tigeryes()
	if(GetItemCountEx(943) >= 1 and GetItemCountEx(944) >= 3) then
		local i = random(1, 5);
		if(i > 2) then
			for j=1, 3 do 
				DelItemEx(944);			
			end
			DelItemEx(943);	
			AddEventItem(948);
			Say("Linh Chi th�o v� H� c�t th��ng h�ng c�ng v�i kinh nghi�m gia truy�n c�a ta, H� C�t t�u n�y kh�ng ai c� th� ch� ���c!",0);
			Msg2Player("Nh�n ���c 1 b�nh H� C�t t�u");
			WriteLog(date("%H%M%S")..": T�i kho�n"..GetAccount()..", nh�n v�t"..GetName().."�����Ƴ���1ƿ���Ǿơ�");	
		else
			local k = random(1, 4);
			if(k > 3) then
				DelItemEx(943);
				Say("C� 1 Linh chi ch�a �� tu�i, ph�i d��c s� k�m ch�t l��ng. Kh�ch quan h�y ch�u kh� �i t�m c�i kh�c �i! Ta � ��y ch�!",0);		
			else
				DelItemEx(944);
				Say("H� c�t n�y ch�a �� tu�i, ph�i d��c s� k�m ch�t l��ng. Kh�ch quan h�y ch�u kh� �i t�m c�i kh�c �i! Ta � ��y ch�!",0);
			end		
		end					
	else
		Say("Kh�ch quan v�n ch�a �� d��c li�u! Th� l�i ta kh�ng gi�p ���c!",0);
	end
end

function antleryes()
	if(GetItemCountEx(943) >= 1 and GetItemCountEx(945) >= 3) then
		local i = random(1, 2);
		if(i == 1) then
			for j=1, 3 do 
				DelItemEx(945);			
			end
			DelItemEx(943);	
			AddEventItem(949);
			Say("Linh Chi th�o v� L�c Nhung th��ng h�ng c�ng v�i kinh nghi�m gia truy�n c�a ta, L�c Nhung t�u n�y kh�ng ai c� th� ch� ���c!",0);
			Msg2Player("Nh�n ���c 1 b�nh L�c Nhung t�u");	
			WriteLog(date("%H%M%S")..": T�i kho�n"..GetAccount()..", nh�n v�t"..GetName().."�����Ƴ���1ƿ¹�׾ơ�");	
		else
			local k = random(1, 4);
			if(k > 3) then
				DelItemEx(943);
				Say("C� 1 Linh chi ch�a �� tu�i, ph�i d��c s� k�m ch�t l��ng. Kh�ch quan h�y ch�u kh� �i t�m c�i kh�c �i! Ta � ��y ch�!",0);		
			else
				DelItemEx(945);
				Say("C� 1 L�c Nhung ch�a �� tu�i, ph�i d��c s� k�m ch�t l��ng. Kh�ch quan h�y ch�u kh� �i t�m c�i kh�c �i! Ta � ��y ch�!",0);
			end		
		end			
	else
		Say("Kh�ch quan v�n ch�a �� d��c li�u! Th� l�i ta kh�ng gi�p ���c!",0);
	end
end

function panaxyes()
	if(GetItemCountEx(943) >= 1 and GetItemCountEx(946) >= 3) then
		local i = random(1, 4);
		if(i > 1) then
			for j=1, 3 do 
				DelItemEx(946);			
			end
			DelItemEx(943);	
			AddEventItem(950);
			Say("Linh Chi th�o v� Nh�n s�m th��ng h�ng c�ng v�i kinh nghi�m gia truy�n c�a ta, Nh�n S�m t�u n�y kh�ng ai c� th� ch� ���c!",0);
			Msg2Player("Nh�n ���c 1 b�nh Nh�n S�m t�u");
			WriteLog(date("%H%M%S")..": T�i kho�n"..GetAccount()..", nh�n v�t"..GetName().."�����Ƴ���1ƿ�˲ξơ�");	
		else
			local k = random(1, 4);
			if(k > 3) then
				DelItemEx(943);
				Say("C� 1 Linh chi ch�a �� tu�i, ph�i d��c s� k�m ch�t l��ng. Kh�ch quan h�y ch�u kh� �i t�m c�i kh�c �i! Ta � ��y ch�!",0);		
			else
				DelItemEx(946);
				Say("C� 1 L�c Nhung ch�a �� tu�i, ph�i d��c s� k�m ch�t l��ng. Kh�ch quan h�y ch�u kh� �i t�m c�i kh�c �i! Ta � ��y ch�!",0);
			end			
		end
	else
		Say("Kh�ch quan v�n ch�a �� d��c li�u! Th� l�i ta kh�ng gi�p ���c!",0);
	end
end

function aboutbrewing()
	Say("B�n ti�m ch� c�t D��c t�u khi �� c� �� c�c d��c li�u th��ng th�a. <enter>Ti�n Linh t�u c�n c� 3 Linh Chi th�o.<enter>H� C�t t�u c�n c� 1 Linh Chi th�o v� 3 H� c�t.<enter>L�c Nhung t�u c�n c� 1 Linh Chi th�o v� 3 L�c Nhung.<enter>Nh�n S�m t�u c�n c� 1 Linh Chi th�o v� 3 Nh�n S�m.",0);
end