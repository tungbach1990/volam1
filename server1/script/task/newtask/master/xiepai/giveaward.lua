
-- ����ϵͳа�̷���������
-- Edited by peres
-- 2005/01/13 PM 22:12

Include("\\script\\task\\newtask\\master\\clearskillpoint.lua");

-- �������Ϊ������ȼ�

function nt_givePlayerAward(myTaskLevel)

local i
local myAwardText1,myAwardText2 = "",""
local myGolden = {168,169,170,171,172,173,174,175,176}

	if (myTaskLevel==1) then -- ����� 20 ������
		

		
	elseif (myTaskLevel==2) then -- ����� 30 ������
		
		AddOwnExp(80000)
		AddGoldItem(0,177)  --������ñ��

		myAwardText1 = "80.000 �i�m kinh nghi�m"
		myAwardText2 = "B�n nh�n ���c 1 kh�i m�o"
		
	elseif (myTaskLevel==3) then -- ����� 40 ������

		AddOwnExp(280000)	
		ClearMagicPoint()  --����40��ʱϴ��Ĺ���
		
		myAwardText1 = "150.000 �i�m kinh nghi�m"
		myAwardText2 = "1 l�n t�y �i�m k� n�ng mi�n ph� "
				
	elseif (myTaskLevel==4) then -- ����� 50 ������
		
		local nRandom=random(1,2);
		
		AddOwnExp(350000)
		
		if nRandom==1 then
			AddItem(6,1,72,1,1,1,0)  -- ��ɽ
		else
			AddItem(6,1,73,1,1,1,0)  -- �׹�
		end;

		myAwardText1 = "350.000 �i�m kinh nghi�m"
		myAwardText2 = "1 ph�n th��ng"
				
	elseif (myTaskLevel==5) then -- ����� 60 ������

		AddOwnExp(800000)		
		i = random(1,getn(myGolden))
		AddGoldItem(0,myGolden[i])
		
		myAwardText1 = "800.000 �i�m kinh nghi�m"
		myAwardText2 = "1 b� B�o kh� tuy�t th� "
		
	end
	
	return myAwardText1,myAwardText2

end
