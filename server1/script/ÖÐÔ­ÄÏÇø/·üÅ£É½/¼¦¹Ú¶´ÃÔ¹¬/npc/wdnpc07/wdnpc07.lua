--description: �䵱������䵱40������
--author: yuanlan	
--date: 2003/5/15
-- Update: Dan_Deng(2003-08-17)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(13) == 1 then
		allbrother_0801_FindNpcTaskDialog(13)
		return 0;
	end
	UTask_wd = GetTask(5);
	if (UTask_wd == 40*256+40) and (HaveItem(163) == 1) then		-- �Ѿ�����ϻ�
		Talk(2, "L40_step", "�! V� c�ng c�a V� �ang ph�i qu� nhi�n qu� nhi�n b�t ph�m! Ngay c� nh�ng �� t� cao th� c�a ta c�ng ��u b� h�n ��nh b�i. ��o Nh�t l�o nhi l� g� c�a ng��i?", " ��o Nh�t Ch�n Nh�n l� t�n s� c�a t�i h�, �ng �y sai t�i giao b�c th� n�y ��n cho ng��i!")
	elseif (UTask_wd == 40*256+20) then
		Talk(1,""," �� nh�n th�y 5 con B�ch H� ch�a? C� b�n l�nh th� h�y ��nh b�i ch�ng tr��c �� r�i m�i ��n n�i chuy�n v�i ta! ")
		AddNote("T�i ��ng K� Qu�n � Ph�c Ng�u s�n, t�m Nhu�n N��ng. Ph�i ��nh b�i n�m con B�ch Ng�c H� ")
		Msg2Player("T�i ��ng K� Qu�n � Ph�c Ng�u s�n, t�m Nhu�n N��ng. Ph�i ��nh b�i n�m con B�ch Ng�c H� ")
	elseif (UTask_wd == 40*256+60) and (HaveItem(164) == 0) then						--�Ѿ�����廢����δ�õ�����
		Talk(1,"","Th� h�i �m c�a ta �� �� trong hang ��ng n�y, ng��i c� b�n l�nh th� h�y v�o �� m� l�y!")
	elseif (UTask_wd >= 40*256+60) then						--�õ����ź�
		Talk(1,"","Th� ra h�n c�ng bi�t xin l�i ta! S�m h�n m�t ch�t c� ph�i hay h�n kh�ng!")
	else
		Talk(1,"","Ng��i l� ai? D�m x�ng v�o trong ��ng n�y, th�t kh�ng bi�t s�ng ch�t l� g�!")
	end
end;

function L40_step()
	Talk(1,"","��o Nh�t th�t bi�t d�y �� t�! Th� ��u! ��a ta xem! Th� ra l� h�n xin l�i ta! S�m bi�t nh� bi�t nh� v�y, h� t�t khi x�a! Ng��i l� �� t� c�a �ng ta th� ta c�ng kh�ng l�m kh� ng��i. Ta c�ng c� m�t phong th� mu�n nh� ng��i mang v� cho �ng �y. Th� ")
	DelItem(163)
	SetTask(5, 40*256+60)
	AddNote("Sau khi ��nh b�i n�m con B�ch Ng�c H�. M�i bi�t l� th� h�i �m �� b� Nhu�n N��ng gi�u trong ��ng ")
	Msg2Player("Th� h�i �m �� b� Nhu�n N��ng gi�u trong ��ng, t�m n� v� giao cho ch��ng m�n ")
end;
