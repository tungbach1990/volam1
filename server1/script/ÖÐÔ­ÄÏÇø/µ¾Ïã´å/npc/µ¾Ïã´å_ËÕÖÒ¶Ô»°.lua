--description: ���ִ�_����
--author: wangzg	
--date: 2003/7/22
-- Update: Dan_Deng(2003-08-11)

function main()
	UTask_world43=GetTask(71)
	if (UTask_world43==1) then
		Talk(3, "select", "Huynh l� T� Trung? M� ng��i �ang lo l�ng cho ng��i!", "Ta c�ng kh�ng mu�n m� ta b�n t�m, nh�ng ta �� quy�t ��nh t�ng qu�n r�i!", "T�i sao v�y?")
	elseif (UTask_world43==2) then
		Talk(1,"","C�m �n ng��i ch� �i�m! ")
	elseif (UTask_world43==3) then
		Talk(1,"","V�y phi�n ng��i khuy�n m� ta! ")
	else	
		Talk(1,"","Cha ta ch�t d��i tay ng��i Kim, m�i th� n�y c� ��i ta kh�ng qu�n! ")
	end
end;

function select()
Say("Hi�n Qu�c gia �ang l�m n�n, ta l�m sao ch� lo ��c s�ch ���c?",2,"Khuy�n can /against","T�n ��ng /support")
end

function against()
	Talk(4,"","Nh�ng m� tu�i ng��i c�n tr�, qu�n t� b�o th� 10 n�m kh�ng mu�n, h�c th�m ch�t b�n l�nh ng�y sau m�i c� th� gi�t ��ch! ", ".....Ng��i n�i c�ng r�t c� ��o l�!", "Ng��i hi�u th� t�t! Mau v� th�m m�, b� ta r�t nh� ng��i!", "���c r�i! C�m �n!")
	SetTask(71,2)
	AddNote("Khuy�n T� Trung � nh� �� th�nh c�ng. ")
	Msg2Player("Khuy�n T� Trung � nh� �� th�nh c�ng. ")
end

function support()
	Talk(3,"","N�i r�t hay! Ng��i tuy tr� tu�i nh�ng l�i mang ch� l�n.","Ta mu�n nh�p ng�, nh�ng lo m� ta s� kh�ng cho ta �i.","Ng��i y�n t�m! Ta �� gi�p ng��i khuy�n b� ta r�i")
	SetTask(71,3)		
	AddNote("�ng h� quy�t ��nh c�a T� Trung, gi�p T� Trung khuy�n M�. ")
	MsgPlayer("�ng h� quy�t ��nh c�a T� Trung, gi�p T� Trung khuy�n T� ��i Ma")
end
