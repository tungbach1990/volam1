--���ϱ��� ����� ·��5���ӵ��Ի�
--������������񣺻��Ӱ�ʦ
--suyu
-- Update: Dan_Deng(2003-08-11)
-- Update: Dan_Deng(2003-09-09) �޸�װ���������ɷ�ʽ

Include("\\script\\global\\itemhead.lua")

function main(sel)
--	UTask_world20 = GetTask(48);
	UTask_world44 = GetTask(44)
	if (UTask_world44 == 0) then		-- ����������1�����ɽ�����)
		Say("V� s� b�n ngo�i th�n r�t c� danh ti�ng. H� T� nh� ta t� nh� �� r�t m� v� h�c. N�u c� th� b�i v� v� s� �� l�m th�y th� th�t t�t qu�! Nh� ta l� gia ��nh r�t b�nh th��ng, kh�ng bi�t h�c v� c� ph�i t�n m�t bao nhi�u ti�n, ng��i c� th� �i h�i v� v� s� �� d�m ta!?", 2, "Gi�p /yes", "Kh�ng gi�p /no")
	elseif(UTask_world44 == 10) then
		Talk(1,"","V� V� s� �ang � ng�i nh� tranh � m� ��ng c�a th�n.")
	elseif(UTask_world44 == 20) then
		Talk(1,"","Sao? �ng �y �� ��ng � r�i �? �i da! Th�t t�t qu�! C�i m� n�y l� nh� ta l�m ra! Tuy kh�ng ��ng gi� bao nhi�u nh�ng b�y t� l�ng bi�t �n!")
		SetTask(44, 100)
		AddRepute(5)
		AddNote("Th�ng b�o tin v� s� ph� �� ��ng � nh�n H� t� l�m h�c tr� cho cha H� t� nghe, nhi�m v� ho�n th�nh ")
		Msg2Player("Th�ng b�o tin v� s� ph� �� ��ng � nh�n H� t� l�m h�c tr� cho cha H� t� nghe, nhi�m v� ho�n th�nh ")
		p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
		if(GetSex() == 0) then
			AddItem(0,7,6,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("Nh�n ���c m�t t�m kh�n v�i ")
		else
			AddItem(0,7,8,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("Nh�n ���c m�t c�i ng�n thoa ")
		end
		Msg2Player("Danh v�ng c�a b�n t�ng th�m 5 �i�m")
	else			-- ������Ի�
		Talk(1,"","V� �n n�i nh� ta ai ai c�ng gi�i, r�t th�ch l�m mai m�i cho ng��i ta!")
	end
end;

function yes()
	Talk(1,"","V� V� s� �ang � ng�i nh� tranh � m� ��ng c�a th�n.")
	SetTask(44, 10)
	AddNote("Ti�p nh�n nhi�m v�: �i xin cho H� T� h�c v� ")
	Msg2Player("Ti�p nh�n nhi�m v�: �i xin cho H� T� h�c v� ")
end;

function no()
end;
