-- �ƺ�Դͷ ·��NPC ���ߣ������ɳ�ʦ����
-- by��Dan_Deng(2003-07-31)

function main()
	UTask_kl = GetTask(9);
	if (UTask_kl == 60*256+10) then		--��ʦ������
		Talk(1,"","Ch�ng Thanh ni�n! Ng��ic�ng �ang mu�n �i t�m Ng� s�c th�ch ph�i kh�ng? Nghe n�i m� cung �i v�o �� b� 5 v� Thi�n �� th�i thi�n c� d�ng kh�a tr�i kh�a l�i r�i! Mu�n l�y ���c Ng� S�c th�ch, ng��i ph�i c� ���c 5 chi�c 'Thi�n T�a'")
		SetTask(9,60*256+20)
		AddNote("Ph�i l�m theo s� ch� d�n, �i v�o s�n ��ng �� t�m 5 chi�c ch�a kh�a, m�i l�y ���c Ng� S�c Th�ch ")
		Msg2Player("Ph�i l�m theo s� ch� d�n, �i v�o s�n ��ng �� t�m 5 chi�c ch�a kh�a, m�i l�y ���c Ng� S�c Th�ch ")
	else
		Talk(1,"","Ng� S�c th�ch b� t�n l�c trong nh�n gian, �� g�y n�n bi�t bao nhi�u tr�n m�u ��. R�t cu�c l� n� mang n�n 'h�a'hay l� 'ph�c'?")
	end
end;
