--description: ���ִ�_��ɩ
--author: wangzg	
--date: 2003/7/22
--update 2003/7/25 yuanlan
-- Update: Dan_Deng(2003-08-07)

function main()
	UTask_world46=GetTask(74)
	if (UTask_world46==0)  then
		Say("Ng��i c� th�y �ng ch�ng qu� nh� ta ch�y �i ��u kh�ng? �i! H�m nay c�ng kh�ng ch�u � nh�, v�a n�i hai c�u �ng ta �� ch�y m�t, ch�c l�i �i u�ng r��u ��u �� r�i. Ng��i c� th� gi�p ta t�m �ng ta v� kh�ng?", 2, "���c, ta s� gi�p /yes", "Kh�ng quan t�m ��n chuy�n v� ch�ng ng��i kh�c /no")
	elseif (UTask_world46==2)  then
		Talk(1,"","L�o �y ch�c l�i �i u�ng r��u ��u �� r�i!")
	else
		Talk(1,"","L�o b� t�nh ch�ng t�i, kh�ng c�n th�ng quan c�ng kh�ng c�n ph�t t�i, ch� c�n m�t cu�c s�ng b�nh an l� ��. ")
	end
end

function yes()
	Talk(1,"","L�o �y ch�c l�i �i u�ng r��u ��u �� r�i!")
	SetTask(74,2)
	AddNote("Nh�n nhi�m v�: Gi�p Chu T�u t�m ch�ng. ")
	Msg2Player("Nh�n nhi�m v�: Gi�p Chu T�u t�m ch�ng. ")
end

function no()
end
