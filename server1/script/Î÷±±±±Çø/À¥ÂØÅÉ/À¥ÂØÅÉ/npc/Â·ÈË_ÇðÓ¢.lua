-- ��������\������\npc\·��_��Ӣ.lua
-- by xiaoyang (2004\4\20)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(6) == 1 then
		allbrother_0801_FindNpcTaskDialog(6)
		return 0;
	end
Uworld121 = GetTask(121)
	if (Uworld121 == 40 ) and (HaveItem(376) == 1 ) then
		Talk(7,"Uworld121_qiuying","Xin h�i c� ph�i l� Kh�u Anh?","Ai d�m g�i th�ng ��i danh c�a l�o?","T�i h� ph�ng l�nh c�a H� c� n��ng ��n ��y","M� Tuy�t? Ng��i b�n kia qua ��y ng�i, u�ng �t tr� d�ng �t �i�m t�m. ","Kh�ng c�n ��u! � ��y c� 1 v�t giao cho ng��i","��y ch�nh l� kh�n l�a M� Tuy�t lu�n mang b�n m�nh! Ng��i b�n b�,�a t�!","H� c� n��ng n�i r�ng ng��i nh�n th�y kh�n l�a n�y t� nhi�n s� hi�u r�!")
	elseif (Uworld121 == 40 ) and (HaveItem(376) == 0 ) then
		Talk(1,"","Ng��i kh�ng �ang ��a v�i ta ch�? V�t g׮�u?")
	elseif (Uworld121 >= 50) then
		Talk(1,"","M� Tuy�t c� n�i qua v�i ng��i nh�ng g� kh�ng? ��i lo�i nh� bao gi� th� ta c� th� g�p n�ng� ")
	else
		Talk(1,"","Kh�ng c� vi�c g� th� ��ng c� ��n qu�y r�y ta!")
	end
end

function Uworld121_qiuying()
	Talk(3,"","Hmm...! C�i l�o gi� D��ng H� m� x�ng ��ng ���c M� Tuy�t gi�p �� nh� th� sao. Nh�ng m� M� Tuy�t c�ng �� ��a kh�n l�a cho ta, l�i nh� ta gi�p h�n, t�t nhi�n s� ph�i c� nguy�n nh�n!","Th�i ���c ng��i b�n b� h�y nghe ��y, ta s� n�i cho ng��i nghe k� ho�ch l�n n�y c�a C�n L�n","Ta �� hi�u! C�o t� ")
	DelItem(376)
	Msg2Player("Bi�t ���c k� ho�ch c�a C�n L�n, quay v� b�o c�o D��ng H� ")
	AddNote("Bi�t ���c k� ho�ch c�a C�n L�n, quay v� b�o c�o D��ng H� ")
	SetTask(121,50) --�����������Ϊ50
end
