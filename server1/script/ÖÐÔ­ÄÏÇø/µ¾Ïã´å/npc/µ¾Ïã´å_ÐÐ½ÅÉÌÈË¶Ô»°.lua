--description: ���ִ�_�н�����
--author: wangzg	
--date: 2003/7/21
--update 2003/7/28 yuanlan


function main()
	UTask_world38=GetTask(66)
	if (UTask_world38 == 2) then
		Say("Mu�n mua x� h��ng kh�ng? Ta c� thu�c danh ti�ng ch�nh t�ng ��y, ch� c�n 200 l��ng th�i! ", 2 ,"Mua/yes","Kh�ng mua/no")
	else	
		Talk(1,"","L�m H�nh c��c Th��ng nh�n t� nam ra b�c th�t kh�ng d�, xem nh�ng h�ng ho� trong tay ta ��y, kh� c� th� ki�m ���c h�ng t�t h�n!")
	end
end;

function yes()
	if (GetCash()<200) then
		Talk(1,"","��i ng��i c� ti�n r�i h�y ��n t�m ta!")
	else
		Pay(200)
		AddEventItem(142)
		Msg2Player("T� ch� H�nh t�u th��ng nh�n mua ���c X� H��ng. ")
		AddNote("T� ch� H�nh t�u th��ng nh�n mua ���c X� H��ng. ")
	end
end

function no()
end
