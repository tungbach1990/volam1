-- �ٰ� ·��NPC �ܹ�����ؤ��50������
-- by��Dan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 50*256+20) and (HaveItem(199) == 1) then		--����50������
		Talk(3,"","V� c�ng c�ng n�y! Ta mu�n v�o g�p Ho�ng th��ng. C� m�t v�t quan tr�ng mu�n giao cho Ho�ng th��ng. "," Ho�ng th��ng hi�n �ang ngh� ng�i. C� giao v�t �� cho ta. Ta s� chuy�n ��n cho Ho�ng th��ng","��chuy�n n�y� ","Sao h�? Kh�ng tin t��ng ta �? C�ng kh�ng ch�u h�i tr��c xem T�o c�ng c�ng ta l� ng��i nh� th� n�o. Ho�ng th��ng t� nh� ��n l�n ��u do ta s�n s�c. L� n�o ta l�i �i g�t ng��i sao? ","V�y c�ng ���c!")
		AddNote("Giao b�c ��a �� cho T�o c�ng c�ng. ")
		Msg2Player("Giao b�c ��a �� cho T�o c�ng c�ng. ")
		DelItem(199)
		SetTask(8,50*256+30)
		NewWorld(176, 1627, 3206)
	else
		Talk(1,"","Ng��i l� ai? Ai cho ng��i �i v�o ��y?")
	end
end;
