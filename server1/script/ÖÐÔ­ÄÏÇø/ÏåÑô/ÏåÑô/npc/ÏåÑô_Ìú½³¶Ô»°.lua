--description: ��ԭ���� ������ �����Ի� �䵱�ɳ�ʦ����
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-08)
-- Update: Dan_Deng(2003-08-17)

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>T�i ��y chuy�n l�m binh kh� cho qu�n ��i n�n r�t b�n r�n. C�n lo�i v� kh� n�o th� ch�n t� nhi�n nh�."

function main(sel)
	UTask_wd = GetTask(5);
	UTask_wd60sub = GetByte(GetTask(17),2)
	if (UTask_wd == 60*256+20) then
		if (UTask_wd60sub == 2) then 
			Talk(2, "", "Nay chi�n s� m�t tr�n kh�n c�p, quan binh qu�n gi�i l�i kh�ng ��, �ng c� th� mau ch�ng r�n m�t l� binh kh� cho chi�n tr��ng kh�ng?", "Kh�ng gi�u g� ng��i, l�c n�y ta ng�y ��m l�m vi�c. Nh�ng v� s� l��ng qu� l�n, n�n s� kho�ng th�ch trong kho �� kh�ng �� d�ng!<color=Red>T� Thi�t Kho�ng, L��ng Ng�n Kho�ng v� X�ch ��ng kho�ng<color>��u �� d�ng h�t. Ng��i c� th� ��n <color=Red>ph�a T�y Nam<color> gi�p ta t�m kho�ng th�ch kh�ng?")
			SetTask(17, SetByte(GetTask(17),2,5))
			AddNote("Th� r�n (193,201) cho bi�t: mu�n ch� t�o binh kh� c�n c� 3 lo�i kho�ng th�ch l�: X�ch ��ng Kho�ng, T� Thi�t Kho�ng, L��ng Ng�n Kho�ng, c� th� t�m th�y ch�ng � b�n ngo�i  r�ng h��ng T�y Nam  c�a T��ng D��ng.")
		elseif (UTask_wd60sub == 5) then 
			if ( HaveItem(138) == 1 and HaveItem(118) == 1 and HaveItem(121) == 1) then
				Talk(2, "", "Ta �� t�m ���c kho�ng th�ch, hy v�ng nh�ng kho�ng th�ch n�y c� th� t�o ra nh�ng binh kh� t�t nh�t, gi�p c�c binh s� ch�ng Kim binh", "M�i ng��i ch� cao nh� n�i, nh�t ��nh s� �u�i ���c l� ngo�i x�m!")
				DelItem(138)
				DelItem(118)
				DelItem(121)
				SetTask(17, SetByte(GetTask(17),2,8))
				AddNote("T�m �� 3 lo�i kho�ng th�ch giao cho th� r�n gi�i quy�t ���c v�n �� kh�ng �� binh kh� ch�ng Kim.")
				Msg2Player("T�m �� 3 lo�i kho�ng th�ch giao cho th� r�n gi�i quy�t ���c v�n �� kh�ng �� binh kh� ch�ng Kim.")
			else
				tiejiang_city("Kh�ng c� kho�ng th�ch th� ta kh�ng c� c�ch n�o t�o v� kh� ���c! Ng��i c� th� ��n <color=Red>khu r�ng ph�a nam ngo�i th�nh<color> l�y m�t �t <color=Red> T� Thi�t Th�ch, L��ng Ng�n Kho�ng v� X�ch ��ng Kho�ng<color>?")
			end
		else
			tiejiang_city()
		end		
	else
		tiejiang_city()
	end
end;

function yes()
	Sale(10);  			--�������׿�
end;

