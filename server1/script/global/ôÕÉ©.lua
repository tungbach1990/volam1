Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")


Shijin2mijian=50
Mijian2babao=30
Babao2baiguo=30
Baiguo2shuijing=30
Shuijing2quyuan=3


function main()
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))

	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>M�i ng��i ��u g�i ta l� T�ng t�u. "
	G_TASK:OnMessage("Thi�n Nh�n", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end

function aboutluckyzongzi()
	Talk(1,"","B�nh ch�ng May m�n ph�i m�t ba n�m m�i l�m xong, �n r�i c� th� t�ng v�n may l�n 30 �i�m!  Nh�ng ch� c� th� ph�t huy t�c d�ng � n�i �n m� th�i. B�ng h�u c� mu�n th� kh�ng?")
end


function listen()
	Talk(1,"talk2","Khu�t Nguy�n l� ��i c�ng th�n c�a S� qu�c!  �ng ta r�t c� n�ng l�c l�m vi�c,nh�ng g�p s� ph�n ��i c�a qu� t�c, b� ��y �i Nguy�n t��ng l�u v�c. Khi b� ��y �i,�ng vi�t b�i th� 'Ly tao'. Sau khi kinh �� n��c S� b� t�n ph�, l�ng �ng lo l�ng t� qu�c, sau khi vi�t tuy�t b�t 'ho�i sa' ng�y 5 th�ng 5,�ng �m �� ch�m xu�ng s�ng M�ch la t� v�n")
end;

function talk2()
	Talk(1,"talk3","sau khi Khu�t Nguy�n m�t, nh�n d�n v� c�ng ti�c th��ng! Th��ng ��n b�n s�ng M�ch La g�i h�n. M�i ng��i  l�y th�c �n n�m xu�ng s�ng �� cho t�m cua r�ng c� �n no r�i s� kh�ng �n x�c Khu�t Nguy�n! T� �� c� t�c l� l�m B�nh ch�ng")
end;

function talk3()
	Talk(1,"","Sau n�y, t�i ng�y 5 th�ng 5 h�ng n�m, th� c� �ua thuy�n r�ng, �n B�nh ch�ng �� t��ng ni�m ��i phu Khu�t Nguy�n!  ��y ch�nh l� ngu�n g�c c�a l� �oan ng�.")
end

function lucky()
	if (GetExtPoint(6) >= 32768) then	
		Talk(1,"","B�n kh�ng th� nh�n ���c g�o n�p may m�n! ")
--		SetExtPoint(6,0)
		WriteLog(date("%H%M%S")..": T�i kho�n"..GetAccount()..", nh�n v�t"..GetName()..", l�nh nh�n G�o n�p may m�n th�t b�i! tr�ng th�i d� th��ng. ")
	else
		Say("B�n mu�n nh�n bao nhi�u g�o n�p may m�n! ",3,"L�y 10 b�nh ch�ng May M�n. /lucky10","L�y 1 b�nh ch�ng May M�n. /lucky1","Kh�ng l�m g� h�t/no")
	end
end

function lucky10()
	if (GetExtPoint(6) >= 10) then	
		for i=1,10 do
			AddEventItem(405)			
			PayExtPoint(6,1)
		end
		Msg2Player("B�n nh�n ���c 10 b�nh ch�ng May M�n. ")
		WriteLog(date("%H%M%S")..": T�i kho�n"..GetAccount()..", nh�n v�t"..GetName()..", nh�n ���c 10  g�o n�p may m�n.")
	else
		Talk(1,"","B�n kh�ng th� nh�n ���c nhi�u g�o n�p may m�n nh� v�y! ")
	end
end

function lucky1()
	if (GetExtPoint(6) > 0) then
		AddEventItem(405)
		PayExtPoint(6,1)
		Msg2Player("B�n nh�n ���c 1 b�nh ch�ng May M�n. ")
		WriteLog(date("%H%M%S")..": T�i kho�n"..GetAccount()..", nh�n v�t"..GetName()..", nh�n ���c 1 g�o n�p may m�n.")
	else
		Talk(1,"","B�n kh�ng th� nh�n ���c g�o n�p may m�n! ")
	end
end

function make()
	i=GetCash()
	if (i>=2000) then
	  Say("L�m 1 c�i B�nh ch�ng c�n 2000. Kh�ch quan c�n bao nhi�u c�i?",7,"B�nh ch�ng Nh�n t�o/yes1","B�nh ch�ng H�t d� /yes2","B�nh ch�ng Th�t heo/yes3","B�nh ch�ng Th�t b� /yes4","B�nh ch�ng Th�p c�m/yes5","B�nh ch�ng May m�n /luckyzongzi","Kh�ng l�m g� h�t/no")
	else
	  Talk(1,"","L�m 1 c�i B�nh ch�ng c�n 2000, kh�ch quan h�nh nh� ch�a �� ti�n! ")
	end
end;

function luckyzongzi()
	if ((GetItemCountEx(394)>=1) and (GetItemCountEx(395)>=1) and (GetItemCountEx(396)>=1) and (GetItemCountEx(405)>=1) and (GetItemCountEx(397)>=1) and (GetItemCountEx(398)>=1) and (GetItemCountEx(399)>=1)) then 
		Talk(1,"","�� l�m xong r�i!  Xin h�y nh�n xem!  B�o ��m v�a �! ")
	  	DelItemEx(394)
	  	DelItemEx(395)
	  	DelItemEx(396)
	  	DelItemEx(405)
	  	DelItemEx(397)
	  	DelItemEx(398)
	  	DelItemEx(399)
	  	AddItem(6,0,70,1,0,0,0)
	  	Msg2Player("B�n nh�n ���c b�nh ch�ng May M�n. ")
		WriteLog(date("%H%M%S")..": T�i kho�n"..GetAccount()..", nh�n v�t"..GetName()..", �� l�m xong b�nh ch�ng may m�n. ")
		Pay(2000)
	else
	  	Talk(1,"","L�m B�nh ch�ng may m�n c�n c�: T�o ��, h�t d�, g�o n�p, th�t heo, l� b�nh, 1 <color=red>G�o n�p may m�n<color>. Kh�ch quan ch�a �� v�t li�u! ")
	end
end;

function yes1()
	if ((GetItemCountEx(394)>=2) and (GetItemCountEx(396)>=2) and (GetItemCountEx(397)>=2)) then
	  Talk(1,"","�� l�m xong r�i!  Xin h�y nh�n xem!  B�o ��m v�a �! ")
	  DelItemEx(394)
	  DelItemEx(396)
	  DelItemEx(397)
	  DelItemEx(394)
	  DelItemEx(396)
	  DelItemEx(397)
	  AddItem(1,7,0,1,0,0,0)
	  Pay(2000)
	  Msg2Player("B�n nh�n ���c b�nh ch�ng t�o ��. ")
	else
	  Talk(1,"","L�m B�nh ch�ng nh�n t�o c�n c�: T�o ��, g�o n�p v� l� b�nh, m�i th� 2 c�i. Kh�ch quan ch�a �� v�t li�u! ")
	end
end;

function yes2()
	if ((GetItemCountEx(395)>=2) and (GetItemCountEx(396)>=2) and (GetItemCountEx(397)>=2)) then
	  Talk(1,"","�� l�m xong r�i!  Xin h�y nh�n xem!  B�o ��m v�a �! ")
	  DelItemEx(395)
	  DelItemEx(396)
	  DelItemEx(397)
	  DelItemEx(395)
	  DelItemEx(396)
	  DelItemEx(397)
	  AddItem(6,0,60,1,0,0,0)
	  Pay(2000)
	  Msg2Player("B�n nh�n ���c b�nh ch�ng h�t d�. ")
	else
	  Talk(1,"","L�m B�nh ch�ng h�t d� c�n c�: h�t d�, g�o n�p v� l� b�nh, m�i th� 2 c�i. Kh�ch quan ch�a �� v�t li�u! ")
	end
end;

function yes3()
	if ((GetItemCountEx(395)>=2) and (GetItemCountEx(396)>=2) and (GetItemCountEx(397)>=2) and (GetItemCountEx(398)>=2)) then 
	  Talk(1,"","�� l�m xong r�i!  Xin h�y nh�n xem!  B�o ��m v�a �! ")
	  DelItemEx(395)
	  DelItemEx(396)
	  DelItemEx(397)
	  DelItemEx(398)
	  DelItemEx(395)
	  DelItemEx(396)
	  DelItemEx(397)
	  DelItemEx(398)
	  AddItem(6,0,61,1,0,0,0)
	  Pay(2000)
	  Msg2Player("B�n nh�n ���c b�nh ch�ng th�t heo. ")
	else
	  Talk(1,"","L�m B�nh ch�ng th�t heo c�n c�: h�t d�, th�t heo, g�o n�p v� l� b�nh, m�i th� 2 c�i. Kh�ch quan ch�a �� v�t li�u! ")
	end
end;


function yes4()
	if ((GetItemCountEx(394)>=2) and (GetItemCountEx(396)>=2) and (GetItemCountEx(397)>=2) and (GetItemCountEx(399)>=2)) then 
	  Talk(1,"","�� l�m xong r�i!  Xin h�y nh�n xem!  B�o ��m v�a �! ")
	  DelItemEx(394)
	  DelItemEx(396)
	  DelItemEx(397)
	  DelItemEx(399)
	  DelItemEx(394)
	  DelItemEx(396)
	  DelItemEx(397)
	  DelItemEx(399)
	  AddItem(6,0,62,1,0,0,0)
	  Pay(2000)
	  Msg2Player("B�n nh�n ���c b�nh ch�ng th�t b�. ")
	else
	  Talk(1,"","L�m B�nh ch�ng th�t heo c�n c�: th�t heo, T�o ��, g�o n�p v� l� b�nh, m�i th� 2 c�i. Kh�ch quan ch�a �� v�t li�u! ")
	end
end;


function yes5()
	Say("L�m b�nh c�ng c� l�c b� th�t b�i!  Kh�ch quan ��ng � l�m kh�ng?",2,"���c. /yes6","Kh�ng ���c. /no")
end;

function yes6()
	if ((GetItemCountEx(394)>=2) and (GetItemCountEx(395)>=2) and (GetItemCountEx(396)>=2) and (GetItemCountEx(397)>=2) and (GetItemCountEx(398)>=2) and (GetItemCountEx(399)>=2)) then 
	  i=random(1,100)
	  if (i<=30) then	
	    Talk(1,"","�� l�m xong r�i!  Xin h�y nh�n xem!  B�o ��m v�a �! ")
	    DelItemEx(394)
	    DelItemEx(394)
	    DelItemEx(395)
	    DelItemEx(395)
	    DelItemEx(396)
	    DelItemEx(396)
	    DelItemEx(397)
	    DelItemEx(397)
	    DelItemEx(398)
	    DelItemEx(398)
	    DelItemEx(399)
	    DelItemEx(399)
	    AddItem(6,1,63,1,0,0,0)
	    Msg2Player("B�n nh�n ���c b�nh ch�ng t�ng h�p ")
	    Pay(2000)
	  else
	    Talk(1,"","�i Xin l�i!  Ta l�m h�ng r�i! ")
	    DelItemEx(394)
	    DelItemEx(394)
	    DelItemEx(395)
	    DelItemEx(395)
	    DelItemEx(396)
	    DelItemEx(396)
	    DelItemEx(397)
	    DelItemEx(397)
	    DelItemEx(398)
	    DelItemEx(398)
	    DelItemEx(399)
	    DelItemEx(399)
	    Pay(2000)
	  end
	else
	  Talk(1,"","L�m B�nh ch�ng Th�p c�m c�n c� T�o ��, h�t d�, g�o n�p, th�t heo,th�t heo v� l� b�nh, m�i th� 2 c�i. Kh�ch quan ch�a �� v�t li�u! ")
	end
end;

function skill()
	i=GetCash()
	if (i>=1000) then
	  if (GetItemCountEx(394) >= 1) then
	  		SetTaskTemp(51,394)
	  elseif (GetItemCountEx(395) >= 1) then
	  		SetTaskTemp(51,395)
	  elseif (GetItemCountEx(396) >= 1) then
	  		SetTaskTemp(51,396)
	  elseif (GetItemCountEx(397) >= 1) then
	  		SetTaskTemp(51,397)
	  elseif (GetItemCountEx(398) >= 1) then
	  		SetTaskTemp(51,398)
	  elseif (GetItemCountEx(399) >= 1) then
	  		SetTaskTemp(51,399)
	  end
	  Say("T� ti�n ta chuy�n l�m b�nh ch�ng c�ng n�p cho Ho�ng cung nh�ng truy�n ��n ��i ta �� kh�c bi�t r�t nhi�u!  N�u kh�ch quan ��ng �, ta c� th� �em b�nh ch�ng t�ng h�p trong tay ng��i �i�u ch� th�nh b�nh ch�ng c�ng n�p trong truy�n thuy�t, ch� nh�n 1000 ng�n l��ng!  Th� kh�ng?",6,"B�nh ch�ng Th�p c�m M�t ong/yes7","B�nh ch�ng Th�p c�m B�t b�u/yes8","B�nh ch�ng Th�p c�m B�ch qu� /yes9","B�nh ch�ng Th�p c�m Th��ng h�ng/yes10","B�nh ch�ng Th�p c�m Khu�t Nguy�n/yes11","Kh�ng l�m g� h�t/no")
	else
	  Talk(1,"","Gia c�ng b�nh n�y ph�i m�t 1000 ng�n l��ng. Kh�ch quan kh�ng �� ti�n r�i")
	end
end;

function yes7()
	flag=nil
	local temp=Shijin2mijian
	if ((HaveCommonItem(6,1,63)>0) and (GetTaskTemp(51) > 0)) then 
		if(GetItemCountEx(404)>0) then
			flag=1
			temp=Shijin2mijian+10
		end
		Talk(1,"","Xin h�y ��i 1 l�t! ")
	    	DelItemEx(GetTaskTemp(51))
	  	i=random(1,100)
	  	if (i<=temp) then	
	    		Talk(1,"","Ngh� thu�t l�m b�nh t� truy�n qu� nhi�n kh�ng t�, ta �� ho�n th�nh B�nh ch�ng Th�p c�m m�t ong")
	    		DelCommonItem(6,1,63)
	    		AddItem(6,1,64,1,0,0,0)
	    		Pay(1000)
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	    		Msg2Player("B�n nh�n ���c b�nh ch�ng m�t hoa qu�! ")
	  	else
	    		Talk(1,"","Th�t b�i r�i, B�nh ch�ng t�t nh� v�y kh�ng d� l�m ��u, ch� c� th� ��a cho kh�ch quan B�nh ch�ng Th�p c�m n�y th�i! ")
	    		Pay(1000)
	    		Msg2Player("B�n nh�n ���c b�nh ch�ng t�ng h�p ")
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	  	end
	else
	  	Talk(1,"","l�m B�nh ch�ng Th�p c�m m�t ong c�n c� 1 ph�n B�nh ch�ng Th�p c�m v� c�c nguy�n li�u kh�c.Kh�ch quan ch�a �� v�t li�u! ")
	end
end;

function yes8()
	flag=nil
	local temp=Mijian2babao
	if ((HaveCommonItem(6,1,64)>0) and (GetTaskTemp(51) > 0)) then 
		if(GetItemCountEx(404)>0) then
			flag=1
			temp=Mijian2babao+20
		end
	  	Talk(1,"","Xin h�y ��i 1 l�t! ")
	    	DelItemEx(GetTaskTemp(51))
	  	i=random(1,100)
	  	if (i<=temp) then	
	    		Talk(1,"","Ngh� thu�t l�m b�nh t� truy�n qu� nhi�n kh�ng t�, ta �� ho�n th�nh B�nh ch�ng Th�p c�m B�t b�u! ")
	    		DelCommonItem(6,1,64)
	    		AddItem(6,1,65,1,0,0,0)
	    		Pay(1000)
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	    		Msg2Player("B�n nh�n ���c b�nh ch�ng B�t B�u ")
  	  	else
	    		Talk(1,"","Th�t b�i r�i, B�nh ch�ng t�t nh� v�y kh�ng d� l�m ��u, ch� c� th� ��a cho kh�ch quan B�nh ch�ng Th�p c�m n�y th�i! ")
	    		DelCommonItem(6,1,64)
	    		AddItem(6,1,63,1,0,0,0)
	    		Pay(1000)
	    		Msg2Player("B�n nh�n ���c b�nh ch�ng t�ng h�p ")
	    		if(flag) then
	    			DelItemEx(404)
	    		end
  	  	end
	else
	  	Talk(1,"","L�m B�nh ch�ng Th�p c�m B�t b�u c�n c� 1 ph�n B�nh ch�ng Th�p c�m v� 1 B�nh ch�ng b�t k� kh�c. Kh�ch quan ch�a �� v�t li�u! ")
	end
end;


function yes9()
	flag=nil
	local temp=Babao2baiguo
	if ((HaveCommonItem(6,1,65)>0) and (GetTaskTemp(51) > 0)) then 
		if(GetItemCountEx(404)>0) then
			flag=1
			temp=Babao2baiguo+10
		end
	  	Talk(1,"","Xin h�y ��i 1 l�t! ")
	    	DelItemEx(GetTaskTemp(51))
	  	i=random(1,100)
	  	if (i<=temp) then	
	    		Talk(1,"","Ngh� thu�t l�m b�nh t� truy�n qu� nhi�n kh�ng t�, ta �� ho�n th�nh B�nh ch�ng Th�p c�m! ")
	    		DelCommonItem(6,1,65)
	    		AddItem(6,1,66,1,0,0,0)
	    		Pay(1000)
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	    		Msg2Player("B�n nh�n ���c B�nh ch�ng Th�p c�m! ")
	  	else
	    		Talk(1,"","Th�t b�i r�i, B�nh ch�ng t�t nh� v�y kh�ng d� l�m ��u, ch� c� th� ��a cho kh�ch quan B�nh ch�ng Th�p c�m n�y th�i! ")
	    		DelCommonItem(6,1,65)
	    		AddItem(6,1,63,1,0,0,0)
	    		Pay(1000)
	    		Msg2Player("B�n nh�n ���c b�nh ch�ng t�ng h�p ")
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	  	end
	else
	  	Talk(1,"","L�m B�nh ch�ng Th�p c�m b�ch qu� c�n 1 ph�n B�nh ch�ng Th�p c�m B�t b�u v� m�t B�nh ch�ng b�t k�. Kh�ch quan ch�a �� v�t li�u! ")
	end
end;

function yes10()
	flag=nil
	local temp=Baiguo2shuijing
	if ((HaveCommonItem(6,1,66)>0) and (GetTaskTemp(51) > 0)) then 
		if(GetItemCountEx(404)>0) then
			flag=1
			temp=Baiguo2shuijing+5
		end
	  	Talk(1,"","Xin h�y ��i 1 l�t! ")
	    	DelItemEx(GetTaskTemp(51))
	  	i=random(1,100)
	  	if (i<=temp) then	
	    		Talk(1,"","Ngh� thu�t l�m b�nh t� truy�n qu� nhi�n kh�ng t�, ta �� ho�n th�nh B�nh ch�ng Th�p c�m Th�y Tinh! ")
	    		DelItemEx(398)
	    		DelItemEx(399)
	    		DelCommonItem(6,1,66)
	    		AddItem(6,1,67,1,0,0,0)
	    		Pay(1000)
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	    		Msg2Player("B�n nh�n ���c b�nh ch�ng Th�y Tinh! ")
	  	else
	    		Talk(1,"","Th�t b�i r�i, B�nh ch�ng t�t nh� v�y kh�ng d� l�m ��u, ch� c� th� ��a cho kh�ch quan B�nh ch�ng Th�p c�m n�y th�i! ")
	    		DelCommonItem(6,1,66)
	    		AddItem(6,1,63,1,0,0,0)
	    		Pay(1000)
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	    		Msg2Player("B�n nh�n ���c b�nh ch�ng t�ng h�p ")
	  	end
	else
	  	Talk(1,"","L�m B�nh ch�ng Th�p c�m Th�y Tinh c�n 1 ph�n B�nh ch�ng Th�p c�m b�ch qu� v� 1 B�nh ch�ng t�y �. Kh�ch quan ch�a �� v�t li�u! ")
	end
end;



function yes11()
	flag=nil
	local temp=Shuijing2quyuan
	if ((HaveCommonItem(6,1,67)>0) and (GetTaskTemp(51) > 0)) then 
		if (GetItemCountEx(404)>0) then
			flag = 1
			temp = Shuijing2quyuan + 3
		end
		Talk(1,"","Xin h�y ��i 1 l�t! ")
	   	DelItemEx(GetTaskTemp(51)) 
	  	i = random(1,100)
	  	if (i<=temp) then	
	   		Talk(1,"","��y l� B�nh ch�ng Th�p c�m Khu�t Nguy�n!  Ha ha!  Hu hu!  Ta th�nh c�ng r�i! ")
		        DelCommonItem(6,1,67)
		        sel=AddItem(6,1,68,1,0,0,0)
		        time=GetItemGenTime(sel)
		        name=GetName()
	   	 	Pay(1000)
	   	 	if(flag) then
	    			DelItemEx(404)
	    		end
	    		Msg2Player("B�n nh�n ���c b�nh ch�ng Khu�t Nguy�n ")
	    		n = GetGlbValue(1)+1
	    		SetGlbValue(1,n)
				WriteLog(date("%H%M%S")..": T�i kho�n"..GetAccount()..", nh�n v�t"..GetName()..", �� l�m th�nh c�ng b�nh ch�ng Khu�t Nguy�n! S� B�nh ch�ng Th�p c�m Khu�t Nguy�n h�m nay l� "..n.."Con ")
    			AddGlobalNews("N�i m�i ng��i bi�t 1 tin vui, b�nh ch�ng Khu�t Nguy�n trong truy�n thuy�t �� ���c l�m ra, m�i ng��i ti�p t�c n� l�c nh�! ")
		else
			Talk(1,"","Th�t b�i r�i, B�nh ch�ng t�t nh� v�y kh�ng d� l�m ��u, ch� c� th� ��a cho kh�ch quan B�nh ch�ng Th�p c�m n�y th�i! ")
			DelCommonItem(6,1,67)
			AddItem(6,1,63,1,0,0,0)
			Pay(1000)
			if(flag) then
	    			DelItemEx(404)
	    		end
			Msg2Player("B�n nh�n ���c b�nh ch�ng t�ng h�p ")
		end
	else
		Talk(1,"","L�m B�nh ch�ng Th�p c�m Khu�t Nguy�n c�n 1 ph�n B�nh ch�ng Th�p c�m Th�y Tinh v� 1 B�nh ch�ng t�y �. Kh�ch quan ch�a �� v�t li�u! ")
	end
end


function quyuan()
	Talk(1,"","Khu�t Nguy�n M�t ph��ng l� m�t t�ch t� ph� ta truy�n l�i, b�y gi� b� m�t r�i!  C�c v� c� th� gi�p ta �i t�m n� kh�ng?")
end;

function no()
end;
