--description: ���ִ�_����
--author: wangzg	
--date: 2003/7/22
--73	UTask_world45
--update 2003/7/28 yuanlan
-- Update: Dan_Deng(2003-08-07)

function main()
	UTask_world45=GetTask(73)
	if (UTask_world45 == 0) then		-- ��������
		Say("Ng��i c� th�y Ti�u Long em ta kh�ng? Ta nh� n� �i mua k�o, ��i m�i kh�ng th�y n� v�, ��n �� t�m c�ng kh�ng th�y, ta lo l�ng mu�n ch�t! ", 2, "Ta gi�p ng��i t�m /yes", "Ta gi�p ng��i kh�ng ���c /no")
	elseif (UTask_world45 == 1) then
		Talk(1,"","Phi�n ng��i gi�p ta t�m xem!")
	elseif (UTask_world45 >= 10) then
		Talk(1,"","C�m �n ng��i �� t�m ���c em ta.")
	else				-- ������Ի�
		Talk(1,"","Ti�u Long em ta r�t l� tinh ngh�ch!")
	end	
end

function yes()
	Talk(1,"","�� l�m phi�n ng��i! ")
	SetTask(73,1)
	AddNote("Nh�n nhi�m v�: Gi�p Hoa Hoa t�m em trai ti�u Long. ")
	Msg2Player("Nh�n nhi�m v�: Gi�p Hoa Hoa t�m em trai ti�u Long. ")
end

function no()
end
