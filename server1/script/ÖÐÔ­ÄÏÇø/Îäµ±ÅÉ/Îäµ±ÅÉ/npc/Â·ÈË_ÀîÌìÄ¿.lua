-- ��ԭ����\�䵱��\�䵱��\npc\·��_����Ŀ.lua
-- by xiaoyang(2004\4\15) �䵱90������

Include("\\script\\global\\repute_head.lua")

Include("\\script\\item\\skillbook.lua")

function main()
Uworld129 = GetTask(129)
Uworld31 = GetByte(GetTask(31),1)
	if (Uworld129 < 10) and (GetReputeLevel(GetRepute()) >= 5) and (GetLevel() >= 90) and (GetFaction() ~="wudang") and (Uworld31 ==127) then
		Talk(2,"Uworld129_interchange","L� ��o tr��ng tu�i tr� t�i cao! T�i h� ng��ng m� �� l�u! Xin ���c th�nh gi�o!","N�u n�i ��n si m� v� h�c, c� V� �ang n�y kh�ng ai h�n s� �� Chu V�n Tuy�n. Ng��i h�y �i t�mhuynh �y �i!")
   elseif (Uworld129 == 20)then
   	Talk(9,"Uworld129_interchange2"," L� ��i hi�p! T�i h� mu�n l�n n�i h�c v�. S� huynh Chu V�n Tuy�n b�o t�i ��n t�m �ng.","��i hi�p ta kh�ng d�m nh�n!","V�y �? Sao T�i h� kh�ng c�m th�y v�y?","H�m nay g�p nhau, xem nh� l� c� duy�n ph�n v�y!","T�i h� mu�n th�nh gi�o L� huynh quan �i�m v� n�i ngo�i gia?","N�i t�c ngo�i l�c ph�i t��ng h�p, l�c do kh� sinh, kh� nh�n l�c d�ng, ph�i h�p l�n nhau. X�t t� m�c ��ch c�a ng��i h�c v� m� n�i, v�n l� l�y kh� l�m ch�. Luy�n kh� ch� luy�n t�m, t�m t�nh t�c sinh, v� d�c t�c c��ng","���c nghe nh�ng l�i ��, �t h�n ph�i m�t 10 n�m ��n s�ch!","C�c h� tu�i tr� t�i cao, h� t�t ph�i khi�m t�n nh� v�y!","Th�t s� Chu huynh qu� xem tr�ng t�i h�! T�i h� s� c� g�ng!")
	elseif (Uworld129 == 40)then
		Talk(10,"Uworld129_interchange3","Chu huynh b�t ng� nh�n ���c th� nh�, �� xu�ng n�i r�i! Ta ��n �� b�o l�i cho ng��i.","Th� nh�? Ng��i �� t�ng xem qua n�i dung ch�a?","��i kh�i s� huynh n�i cha m� � nh� r�t nh�, n�n l�p t�c xu�ng n�i 1 chuy�n.","H�ng r�i! ","Sao?","Tr��c ��y Chu s� huynh t� nh� l�n n�i, �� r�t l�u kh�ng li�n h� ng��i nh�. L�c T�ng Kim giao binh, thi�n h� ��i l�an, nh�n d�n l�m than. S� ph� �� ph�i ng��i �i�u tra, nh�ng kh�ng c� tin t�c c�a cha m� s� huynh. L� th� �� c� th� l� gi�.","V�y th� n�o m�i l� t�t!","May nh� C�c h� th�ng b�o k�p th�i, b�y gi� v�n c�n k�p. Ng��i h�y ��n Ph�c Ng�u s�n, �m th�m b�o v� Chu s� huynh.","T�i h� �� nghe danh V� �ang t� l�u,c� th� c� c� h�i gi�p �� th�t l� vinh h�nh!","Theo l�i trong th� n�i nh� Chu huynh � c�nh Thi�n T�m ��ng.")
	elseif (Uworld129 == 60) and (GetFaction() ~= "wudang") then
		Talk(6,"Uworld129_finish","Huynh qu� th�t kh�ng h� danh! ��ng l� �m m�u c�a Thi�n Nh�n gi�o.","Xem ra qu�n Kim �� b�t ��u ��ng th�. Chu s� huynh ta kh�ng bi�t th� n�o r�i?","B� th��ng kh�ng nh�, nh�ng t�nh m�ng �� ���c b�o to�n. E r�ng ph�i ngh� ng�i m�t th�i gian!","Thi�n M�c kh�ng bi�t c�m �n ��i �n c�a huynh ��i v�i V� �ang? Ta t�ng huynh m�t cu�n V� �ang m�t t�ch.","V�n l�n kh�ng n�n! H�nh hi�p tr��ng ngh�a l� b�n ph�n c�a t�i.")
	else
		Talk(1,"","Kh�ng c�u g� h�n! Ch� hy v�ng V� �ang tai qua n�n kh�i!")
	end
end

function Uworld129_interchange()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- ����δѧҰ��ȭ�ģ������������
		Talk(1,"","Nh�ng ng��i v�n kh�ng bi�t v� c�ng, ch�c g� Chu s� �� ch�u n�i chuy�n v�i ng��i?")
	else
		SetTask(129,10)  --��������
		Msg2Player("L� Thi�n M�c �� ng��i t�m Chu V�n Tuy�n h�c h�i v� ngh�. ")
		AddNote("L� Thi�n M�c �� ng��i t�m Chu V�n Tuy�n h�c h�i v� ngh�. ")
	end
end

function Uworld129_interchange2()
	SetTask(129,30)  --�����������30
	Msg2Player("L� Thi�n M�c �� ng��i khuy�n Chu V�n Tuy�n kh�ng qu� say m� v� ��o. ")
	AddNote("L� Thi�n M�c �� ng��i khuy�n Chu V�n Tuy�n kh�ng qu� say m� v� ��o. ")
end

function Uworld129_interchange3()
	SetTask(129,50)  --�����������50
	Msg2Player("Nh�n l�i L� Thi�n M�c �i T�y �m Trung Ph�c Ng�u s�n b�o v� Chu V�n Tuy�n. ")
	AddNote("Nh�n l�i L� Thi�n M�c �i T�y �m Trung Ph�c Ng�u s�n b�o v� Chu V�n Tuy�n. ")
end

function Uworld129_finish()
	if (GetTask(5) >= 70*256) and (GetTask(5) ~= 75*256) then
		Talk(2,"","Ta ��a n� cho ng��i v� hy v�ng ng��i c� th� ph�t d��ng quang ��i, nh� th� v� l�m Trung nguy�n l�i c� th�m 1 ph�n l�c l��ng ch�ng Kim.",".....V�y ���c! T�i h� xin nh�n!")
		if (HaveMagic(365) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(365,1)
		end
		if (HaveMagic(368) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(368,1)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("H�c ���c k� n�ng Thi�n ��a V� C�c, Nh�n Ki�m H�p Nh�t ")
		SetTask(129,255)
	else
	   SetTask(129,245)  --������������ñ���245
	end
   add_repute = ReturnRepute(30,100,4)			-- �������������30�㣬��100����ÿ���ݼ�4%
   AddRepute(add_repute)
   Msg2Player("C�u Chu V�n Tuy�n, nhi�m v� ho�n th�nh. Danh v�ng c�a b�n t�ng th�m "..add_repute.."�i�m.")
   AddNote("C�u Chu V�n Tuy�n, nhi�m v� ho�n th�nh. Nhi�m v� ho�n th�nh ")
end
