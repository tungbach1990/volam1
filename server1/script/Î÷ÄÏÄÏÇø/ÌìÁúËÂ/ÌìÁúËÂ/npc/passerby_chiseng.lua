-- �����³�ɮ�Ի��ű�

Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main()
	Uworld1050 = nt_getTask(1050)
	if ( Uworld1050 ~= 0 ) then
		branch_chiseng()
	else
		Talk(1,"","M�y n�m g�n ��y �� t� c�c n�i kh�c ��n ng�y m�t �t, ph��ng tr��ng th� kh�ng lo l�ng vi�c trong t�, ch� lo t�nh tu. �� t� ai c�ng hoang mang, hi�n �� xu�ng n�i chi�u m� c�c �� t� m�i. Th� ch� m�t th�i gian sau h�y t�i �i!");
	end
end
