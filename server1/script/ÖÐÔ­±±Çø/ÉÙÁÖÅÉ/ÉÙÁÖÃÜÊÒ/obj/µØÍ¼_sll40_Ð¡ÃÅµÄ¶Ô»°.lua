--���ֺ�ɽ���� ���� С��ǰ�ĶԻ�
-- by��Dan_Deng(2003-08-04)

function main(sel)
	UTask_sl = GetTask(7)
	if (UTask_sl >= 40*256+20) and (UTask_sl < 50*256) then		-- �����������в��ܽ��룬����ÿ�ν��붼Ҫ�ش�����
		Say("B�n t�ng �ang b� quan tu luy�n, n�u c� mu�n truy�n l�i cho b�n h� th� th�ng qua hai c�u kh�u quy�t n�y! Nghe k� ��y!",4,"�n Ma Ni B�t M� H�ng /L40_S2_wrong","H�ng B�i M� Ma Ni �n /L40_S2_wrong","B�t M� Ni H�ng �n Ma /L40_S2_wrong","�n B�t Ni Ma M� H�ng. /L40_S2_correct")
	elseif (UTask_sl == 40*256+50) then
		Talk(3,"","Kh�u quy�t quan tr�ng th� n�y sao ng��i c� th� qu�n ���c? Ta n�i l�i m�t l�n h�y nh� k� ��!","C�u th� nh�t l�: Th� gian v� th��ng, Qu�c Th� Nguy Qu�, c�u th� hai l�: T� ��i Kh� Kh�ng, Ng� D��ng V� Ng�, c�u th� 3 l�: Sanh Di�t Bi�n Th�ng, H� Ng�y V� Ch�, c�u th� 4 l�: T�m Th� �c Nguy�n, H�nh Vi T�i T�u, c�u th� 5 l�: Nh� Th� Quan S�t, Ti�m Ly Sinh T�.","L�n n�y ��ng qu�n n�a ��! �i �i!")
	else
		Msg2Player("Th�n t�ng �ang b� quan t�p luy�n n�i ��y, xin ��ng l�m phi�n ")
	end
end;

function L40_S2_correct()
	Talk(9,"L50_step2","�� t� c�u ki�n S� th�c t�!","C� chuy�n g�?","Ch��ng m�n ph�i �� t� ��n th�nh m�i hai v� S� th�c t� xu�t quan, b�n c�ch c�c th� thi�n h�.","Kh�ng T�ch: Thi�n h� hai ch� hai ng��i ch�ng ta kh�ng hi�u, ng��i chuy�n gi�p 5 c�u n�y cho ch��ng m�n, �ng ta s� hi�u r�.","C�u th� nh�t: Th� Gian V� Th��ng, Qu�c Th� Nguy Qu�,","Kh�ng T�ch: C�u th� hai: T� ��i Kh� Kh�ng, Ng� D��ng V� Ng�,","C�u th� ba: Sinh Di�t Bi�n Th�ng, H� Ng�y V� Ch�,","Kh�ng T�ch: C�u th� t� l�: T�m Th� �c Nguy�n, H�nh Vi T�i T�u,","C�u th� n�m l�: Nh� Th� Quan S�t, Ti�m Ly Sinh T�.")
end;

function L40_S2_wrong()
	Talk(1,"","Sau khi ��c xong kh�u quy�t c�nh c�a nh� kh�ng lung lay ch�t n�o, c� ph�i b�n �� ni�m sai kh�ng?")
end;

function L50_step2()
	Talk(1,"","Th� t� c�a n�m c�u kh�u quy�t n�y ph�i nh� r� ��! �i �i!")
	SetTask(7,40*256+50)
	AddNote("G�p T�ch Di�t Nh� T�ng c�u truy�n ��t l�i ch� th� cho ph��ng Tr��ng. ")
	Msg2Player("G�p T�ch Di�t Nh� T�ng c�u truy�n ��t l�i ch� th� cho ph��ng Tr��ng. ")
end;
