-------------------------------------------------------------------------
-- FileName		:	·��_۪��ˮ.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-27 14:40:10
-- Desc			:	����90�����񣿣�
-------------------------------------------------------------------------

Include("\\script\\task\\newtask\\master\\zhongli\\zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")
Include("\\script\\dailogsys\\dailog.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName,tbDailog , nNpcIndex)
	if getn(tbDailog.tbOptionList) > 0 then
		tbDailog:AddOptEntry("Ta ��n t�m �ng c� vi�c kh�c", old_main)
		tbDailog:Show()
	else
		old_main()
	end
end
function old_main()
	Uworld126 = nt_getTask(126)
	Uworld1002 = nt_getTask(1002)
	Say(" Ng��i s�ng tr�n ��i c�n ph�i bi�t tr�n tr�ng h�nh ph�c.",3,
		--"Ta ��n l�m nhi�m v� ch�nh tuy�n/branch_branchliqiushui",
		"Ta ��n l�m nhi�m v� c�p 90/tasknpc_nity",
		"Kh�ng h�i n�a!/no")
end

function tasknpc_nity()
Uworld126 = nt_getTask(126)
	if (Uworld126 == 10) and (HaveItem(391) == 1) then
		Talk(4,"Uworld126_lose","L� ti�u th�! C� c� th�!","�o�n T� Th�nh c�ng c� ng�y h�i h�n? Qu� tr� r�i! Ta ch�ng c�n tin t��ng v�o ��n �ng n�a.","C� n��ng h� t�t ph�i c� ch�p, t�c ng� c� c�u 'S� bi�t tam nh�t, ���ng qu�t m�c t��ng khan', l� n�o kh�ng th� cho �o�n c�ng t� m�t c� h�i sao?","Cho h�n c� h�i? L�c h�n r�i xa ta sao h�n kh�ng cho ta m�t c� h�i kh�ng? Ta kh�ng mu�n n�i n�a, ng��i r�nh r�i th� h�y �i t�m Ch��ng m�n, b� ta th�ch n�i nh�ng chuy�n n�y.")
	elseif (Uworld126 == 10) then			-- û������
		Talk(3,"","L� ti�u th�! C� c� th�!","Th� g� v�y?","�! Ta �� qu�n � ch� �o�n T� Th�nh.")
	elseif (Uworld126 == 30)then
   	Talk(3,"Uworld126_cant","L� ti�u th�!",".....","Xem ra ph�i quay l�i g�p �o�n c�ng t� t�m bi�n ph�p m�i ���c.")
   elseif (Uworld126 == 60)then
   	Talk(12,"Uworld126_beleive","L� ti�u th�! Kh�ng xong r�i! ","V�i c�i g�! C� g� t� t� n�i.","�o�n c�ng t��.","H�n th� n�o?","�o�n c�ng t� v� b�o v� c� b� k� th� ��nh tr�ng th��ng, t�nh m�ng �ang nguy hi�m!","Ng��i kh�ng c�n b�a ��t, ta quy�t kh�ng tin ng��i ��u!","T�i h� l�y danh ti�ng c�a m�nh tr�n giang h� ra b�o ��m, ta kh�ng g�t c� n��ng ��u..","Ch�ng l�.....T� Th�nh. Qua nhi�u n�m nh� th� r�i ng��i h� t�t ph�i thay ng��i kh�c ch�u tr�n, nh�ng n�m g�n ��y t�nh t�nh ta �� thay ��i, �� t�o ra nhi�u h�n th�, ng��i kh�ng c� v� c�ng th�t l� chu�c kh� v�o th�n.","N�u ng�y �y c� ch�u tha th� cho h�n th� ��u ��n n�i.","M�y ng�y n�y ta kh�ng sao ng� ���c, trong l�ng lu�n ngh� v� y, b�y gi� y �ang � ��u?","��i L�!","Ta s� ��n �� ngay, t�t c� nh�ng th� h�n �� k�t th�c!")	
   elseif (Uworld126 > 10) and (Uworld126 < 60) then				-- �����е�ȱʡ�Ի�
   	Talk(1,"","Ta v� T� Th�nh kh�ng li�n can g� nhau, ng��i ��ng l�m l�i! ")
   else
   	Talk(1,"","M�n ch� kh�ng th� th�nh th�n v�i ���ng Nh�t Tr�n, nh� th� s� ph�m m�n quy.....")
   end
end

function Uworld126_lose()
	DelItem(391)
	nt_setTask(126,20)
	Msg2Player("Sau khi xem th�, L� Thu Th�y kh�ng ch�t x�c ��ng, b�n quy�t ��nh �i t�m Do�n H�m Y�n gi�p ��.")
	AddNote("Sau khi xem th�, L� Thu Th�y kh�ng ch�t x�c ��ng, b�n quy�t ��nh �i t�m Do�n H�m Y�n gi�p ��.")
end

function Uworld126_cant()
	nt_setTask(126,40)
	Msg2Player("L� Thu Th�y kh�ng nghe l�i khuy�n, b�n quy�t ��nh tr� v� t�m �o�n T� Th�nh.")
	AddNote("L� Thu Th�y kh�ng nghe l�i khuy�n, b�n quy�t ��nh tr� v� t�m �o�n T� Th�nh.")
end

function Uworld126_beleive()
	nt_setTask(126,70)
	Msg2Player("Trong l�ng L� Thu Th�y v�n c�n v��ng v�n �o�n T� Th�nh, quy�t ��nh �i g�p m�t h�n l�n cu�i! K� ho�ch th�nh c�ng.")
	AddNote("Trong l�ng L� Thu Th�y v�n c�n v��ng v�n �o�n T� Th�nh, quy�t ��nh �i g�p m�t h�n l�n cu�i! K� ho�ch th�nh c�ng.")
end

function branch_branchliqiushui()
	Uworld1002 = nt_getTask(1002)
   	liqiushui()
end

function no()
end