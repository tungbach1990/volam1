-- ���ݻ��ѿ�ջ ·��NPC �ſ���ؤ��40������
-- by��Dan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 40*256+20) and (HaveItem(236) == 1) then		--40��������
		Talk(3,"","Tr��ng ��i nh�n, ta l� �� t� C�i Bang. Ta c� m�t b�c h�m th� quan tr�ng mu�n ph�i giao �ng. B�n trong c� ch�ng c� c�a c�u t�c tri�u ��nh c�u k�t v�i gi�c Kim.Ngo�i ra, Kim qu�c �m m�u �m s�t �ng khi �ng tr�n ���ng l�n kinh. Tuy �� t� b�n bang �� thay ��i nh�n h� th� nh�ng t�n s�t th�, nh�ng kh� m� ch�c ���c ch�ng c� ra tay n�a hay kh�ng? Xin ��i nh�n h�y c� g�ng b�o tr�ng!","�! L�i c� chuy�n nh� th�! �a t� qu� bang �� ra tay t��ng tr�, b�c h�m th� n�y r�t quan tr�ng. Ta nh�t ��nh s� ��ch th�n g�p ho�ng th��ng. Kh�ng ph�i ch� v� s� an nguy c�a ta, m� ph�i l�y Qu�c n�n l�m ��u! C�i m�ng ta n�o c� x� chi!","Tr��ng ��i nh�n l� tr� c�t qu�c gia! Xin h�y b�o tr�ng! T�i h� �i ��y!")
		DelItem(236)
		SetTask(8,40*256+30)
		AddNote("Giao b�c Th�ch s�t m�t h�m cho Tr�ong Tu�n ")
		Msg2Player("Giao b�c Th�ch s�t m�t h�m cho Tr�ong Tu�n ")
	else
		Talk(1,"","Qu�c gia l�m nguy, l� con d�n ph�i c� tr�ch nhi�m v�i ��t n��c.Y�n t�m! Ta nh�t ��nh s� kh�ng l�m ng��i th�t v�ng!")
	end
end;
