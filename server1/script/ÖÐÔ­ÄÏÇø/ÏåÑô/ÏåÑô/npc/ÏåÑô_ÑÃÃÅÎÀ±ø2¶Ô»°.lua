--��ԭ���� ������ ��������2�Ի�

FESTIVAL06_NPCNAME = "<color=yellow>V� binh Nha m�n:<color>";
Include([[\script\global\·��_��������.lua]]);

function main(sel)
    gsoldier_entance();
end;

function main_former()
	UTask_wd = GetTask(5);
	UTask_wd60sub = GetByte(GetTask(17),3)
	if (UTask_wd == 60*256+20) and (UTask_wd60sub == 2) then
		Say("Th� th�nh ��i nh�n �� th�o ch�y trong m�t ��o ph�a sau nha m�n. Gi�c Kim c�n ch�a t�i �� s� h�i nh� v�y!", 0)
		AddNote("��n nha m�n, n�i chuy�n v�i ng��i v� b�nh v� bi�t t� t��ng �� tho�t qua ���ng b� m�t ph�a sau nha m�n. ")
		Msg2Player("Th� ra t� t��ng T��ng D��ng �� s�m tho�t nh� ���ng b� m�t ph�a sau nha m�n. ")
	else
		Talk(1,"","��i nh�n c� l�nh, k� kh�ng ph�n s� c�m v�o d�m ng�!")
	end
end;
