--description: �����ɻ��ˮ�����
--author: yuanlan	
--date: 2003/3/5
-- Update: Dan_Deng(2003-08-12)

function OnDeath()
	UTask_em = GetTask(1)
	if (UTask_em == 30*256+50) and (HaveItem(120) == 0) and (random(0,99) < 50) then
		if (HaveItem(119) == 0) then			--û�м���
			Msg2Player("Ph�t hi�n ra H�a H�, nh�ng kh�ng c� ��i g�, H�a H� kh�ng ch�u �i theo ng��i l�. ")
		else							--�м���		
			DelItem(119)
			AddEventItem(120) 
			Msg2Player("C�u tho�t H�a H� ")
--			SetTask(1, 38)
			AddNote("T�i h� c� s�u � h�u s�n, ��nh b�i r�n m�i, t�m th�y H�a H�. ")
		end			
	end
end;	
