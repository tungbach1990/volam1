--description: �����񺣵����ص���
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 60) then
		i = random(0,7)
		if (i == 0) then
			Talk(1,"","Ch�nh ��ng l� L�i ")
			Msg2Player("C� ���c kh�u quy�t: Ch�nh ��ng Vi L�i ")
		elseif (i == 1) then
			Talk(1,"","Ch�nh Nam l� H�a")
			Msg2Player("C� ���c kh�u quy�t  Ch�nh Nam Vi H�a ")
		elseif (i == 2) then 
			Talk(1,"","Ch�nh T�y l� m�c")
			Msg2Player("C� ���c kh�u quy�t  Ch�nh T�y Vi Chi�u ")
		elseif (i == 3) then 
			Talk(1,"","Ch�nh B�c l� n��c")
			Msg2Player("C� ���c kh�u quy�t  Ch�nh B�c Vi Thu� ")
		elseif (i == 4) then 
			Talk(1,"","��ng Nam l� gi� ")
			Msg2Player("C� ���c kh�u quy�t  ��ng Nam Vi Phong ")
		elseif (i == 5) then 
			Talk(1,"","��ng B�c l� n�i")
			Msg2Player("C� ���c kh�u quy�t  ��ng B�c Vi s�n  ")
		elseif (i == 6) then 
			Talk(1,"","T�y Nam l� ��t")
			Msg2Player("C� ���c kh�u quy�t: T�y Nam Vi ��a ")
		else
			Talk(1,"","T�y B�c l� tr�i")
			Msg2Player("C� ���c kh�u quy�t  T�y B�c Vi Thi�n ")
		end
	end
end;
