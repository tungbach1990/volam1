--���ӡ�������ʥ����
--renbin



seed_name	={
		"May m�n",
		"Hoa H�ng",
		"Th�y Tinh",
		"Ho�ng Kim"
		}

crystal_name	={
		"phi�n",
		"Ph� th�ng",
		"Hoa",
		"Ho�n m� "
		}

seed_sow	={0,0,0,0,0,0}



function main()

	Say("Gi�ng Sinh vui v�! Ta t� ph��ng B�c xa x�i ��n ��y mang theo nhi�u l� v�t r�t ��c bi�t. Ch� c�n Ng��i ki�n tr� nu�i d��ng �� c�y l�n kh�e m�nh. To�n b� l� v�t ta ��u treo tr�n c�c c�y ��! H�y mau �i thu th�p <color=red>B�ng Tinh<color> v� <color=red> h�t Gi�ng Sinh<color> �i, n�u kh�ng s� kh�ng k�p th�i gian!",4,"Ta mu�n tinh luy�n B�ng tinh/upg_crystal","Ta mu�n ��m h�t Gi�ng Sinh/sow_seed","Hay qu�! Xin h�y n�i chi ti�t cho ta bi�t �i!/christ_help","Ha! Ha! Ta ch� ��n �� xem 'dung nhan' c�a �ng th�i!/no")

end


function christ_help()

	Say("Ch� c�n b�n tr� thu th�p ���c nh�ng<color=red> phi�n B�ng Tinh<color> v� <color=red>H�t Gi�ng Sinh<color> mang ��n ��y, l�o c� th� gi�p b�n <color=red>tinh luy�n B�ng tinh<color> v� <color=red>��m h�t Gi�ng Sinh<color>.",3,"Li�n quan 'Thu th�p v� tinh luy�n B�ng tinh'/bingjing","Li�n quan ' H�t v� c�ch ��m'/zhongzi","Ta hi�u r�i! C�m �n �ng nhi�u!/no")

end

function bingjing()
	Say("B�ng tinh g�m c� 4 lo�i: <color=red> phi�n B�ng Tinh<color>, <color=red> B�ng tinh ph� th�ng <color>, <color=red>Hoa B�ng tinh<color> v� <color=red> Ho�n m� B�ng tinh<color>. Ng��i ch� c�n thu th�p ���c <color=red>To�i phi�n B�ng Tinh<color>, l�o s� gi�p tinh luy�n th�nh 3 lo�i c�n l�i",2,"Thu th�p B�ng tinh/bjcj","Tinh luy�n B�ng tinh/bjtl")

end


function bjcj()

	Talk(2,""," <color=red>Phi�n B�ng tinh<color> g�m:\n <color=red>��<color>: Ph��ng T��ng, V�nh L�c tr�n, Nh�n ��ng s�n\n  <color=red>V�ng<color> Th�nh ��, Giang T�n th�n, B�ch Th�y ��ng\n <color=red>T�m<color>: T��ng D��ng, Ba L�ng huy�n, V� L�ng s�n","<color=red>Tr�ng<color>: D��ng Ch�u, ��o H��ng th�n, La Ti�u s�n\n <color=red>L�c<color>: Bi�n Kinh, Chu Ti�n tr�n, Ki�m C�c T�y Nam\n <color=red>Lam<color>: ��i L�, Th�ch C� tr�n, Ph�c L�u ��ng.")
	
end

function bjtl()

	Talk(3,"","Th� t� tinh luy�n B�ng tinh nh� sau: t� <color=red> phi�n B�ng tinh<color> -> <color=red> Ph� Th�ng B�ng tinh<color> -> <color=red> Hoa b�ng tinh<color> -> <color=red>Ho�n M� b�ng tinh<color>","B�n tr� c�n ph�i thu th�p <color=red> m�t b� 6 vi�n ��ng ��ng c�p (H�ng, Ho�ng, Lam, T�, L�c, B�ch)<color>,l�o s� gi�p tinh luy�n th�nh m�t vi�n ��ng c�p cao h�n","��ng c�p B�ng tinh c�ng cao th� ��m h�t s� c�ng hi�u nghi�m. Sau khi tr�ng th�nh c�ng s� nh�n ���c nhi�u b�o v�t ngo�i s� mong ��i!")
	
end

function zhongzi()

	Say("C�c h�t g�m c� 5 lo�i: <color=red>h�t Gi�ng sinh<color>, <color=red>h�t Gi�ng Sinh may m�n<color>, <color=red>h�t Hoa H�ng Gi�ng Sinh<color>, <color=red>h�t Th�y Tinh Gi�ng Sinh<color> v� <color=red>h�t Ho�ng Kim Gi�ng Sinh<color>. B�n tr� luy�n c�ng ch� c� th� thu th�p ���c <color=red>h�t Gi�ng Sinh<color>, c�c h�t kh�c ph�i do l�o gi�p �� ��m m�m",2,"Thu th�p c�c lo�i h�t/zzcj","��m c�c lo�i h�t/zzjg")

end

function zzjg()

	Talk(3,"","B�n lo�i <color=red>B�ng tinh<color> khi t��i l�n <color=red>H�t Gi�ng Sinh<color> s� tr�ng n�n 4 lo�i c�y Gi�ng Sinh","C�ch ��m h�t: \n\n <color=red>6 Phi�n B�ng tinh t�y �<color>?<color=red>H�t gi�ng sinh<color>?<color=red>H�t May m�n<color>\n <color=red>6 Ph� B�ng Tinh t�y �<color>?<color=red>H�t gi�ng sinh<color>?<color=red> H�t Hoa h�ng","\n\n <color=red>6 Hoa B�ng Tinh t�y �<color>?<color=red>H�t gi�ng sinh<color>?<color=red>H�t Th�y tinh<color>\n <color=red>6 Ho�n M� B�ng Tinh t�y �<color>?<color=red>H�t gi�ng sinh<color>?<color=red>H�t Ho�ng Kim<color>.")

end

function zzcj()

	Talk(1,"","N�i thu th�p <color=red>H�t Gi�ng Sinh<color>: L�m An ph�, Nam Nh�c tr�n, Long Tuy�n th�n, Th�p ��i m�n ph�i, Hoa S�n, ��o Hoa nguy�n")
	
end


-----------------------��������-----------------------

function upg_crystal()

	Say("B�n tr� mu�n tinh luy�n B�ng tinh ph�i kh�ng? L�o s� gi�p! Nh�ng n�u l� th�t b�i, b�n s� ch� nh�n l�i ���c <color=red>1 vi�n<color> m� th�i! ��ng � ch�?",2,"Tinh luy�n Ph� Th�ng B�ng tinh (2000 l��ng) /crystal_medi","�� ta suy ngh� k� l�i xem/no")

end

function crystal_medi()

	local on_pay = 2000
	if ( GetCash() >= on_pay ) then
		if ((CalcEquiproomItemCount(4,468,1,1)>=1) and CalcEquiproomItemCount(4,469,1,1)>=1 and CalcEquiproomItemCount(4,470,1,1)>=1 and CalcEquiproomItemCount(4,471,1,1)>=1 and CalcEquiproomItemCount(4,472,1,1)>=1 and CalcEquiproomItemCount(4,473,1,1)>=1) then
			ConsumeEquiproomItem(1,4,468,1,1)
			ConsumeEquiproomItem(1,4,469,1,1)
			ConsumeEquiproomItem(1,4,470,1,1)
			ConsumeEquiproomItem(1,4,471,1,1)
			ConsumeEquiproomItem(1,4,472,1,1)
			ConsumeEquiproomItem(1,4,473,1,1)
			i_medi = random(1,12000)
			if ( i_medi < 1000 ) then
				AddEventItem(474)
				Msg2Player("B�n nh�n ���c 1 'H�ng Ph� Th�ng b�ng tinh'")
				Pay(on_pay)
			elseif ( i_medi < 2000 ) then
				AddEventItem(475)
				Msg2Player("B�n nh�n ���c 1 'Ho�ng Ph� Th�ng b�ng tinh'")
				Pay(on_pay)
			elseif ( i_medi < 3000 ) then
				AddEventItem(476)
				Msg2Player("B�n nh�n ���c 1 'Lam Ph� Th�ng b�ng tinh'")
				Pay(on_pay)
			elseif ( i_medi < 4000 ) then
				AddEventItem(477)
				Msg2Player("B�n nh�n ���c 1 'T� Ph� Th�ng b�ng tinh'")
				Pay(on_pay)
			elseif ( i_medi < 5000 ) then
				AddEventItem(478)
				Msg2Player("B�n nh�n ���c 1 'L�c Ph� Th�ng b�ng tinh'")
				Pay(on_pay)
			elseif ( i_medi < 6000 ) then
				AddEventItem(479)
				Msg2Player("B�n nh�n ���c 1 'B�ch Ph� Th�ng b�ng tinh'")
				Pay(on_pay)
			else
				Msg2Player("Xin l�i! Th�t b�i r�i!B�n tr� ��ng n�n ch�! L�n sau nh�t ��nh s� th�nh c�ng!!")
				Pay ( on_pay )
				i_back=random(1,7000)
				if (i_back < 2000) then
					AddEventItem(468)
				elseif (i_back < 3000) then
					AddEventItem(469)
				elseif (i_back < 4000) then
					AddEventItem(470)
				elseif (i_back < 5000) then
					AddEventItem(471)
				elseif (i_back < 6000) then
					AddEventItem(472)
				else
					AddEventItem(473)
				end
			end
			check_again(468)	--Is there enough crystals
		
		else
			Talk(1,"","Xin l�i! Ki�m tra k� l�i xem! C�n 1 b� Phi�n B�ng tinh 6 m�u.")
		end
	else
		Talk(1,"","Xin l�i! Ti�n kh�ng ��! Mau tr� v� l�y �i!.")
	end

end


function crystal_high()

	local on_pay = 10000
	if ( GetCash() >= on_pay ) then
		if ((CalcEquiproomItemCount(4,474,1,1)>=1) and CalcEquiproomItemCount(4,475,1,1)>=1 and CalcEquiproomItemCount(4,476,1,1)>=1 and CalcEquiproomItemCount(4,477,1,1)>=1 and CalcEquiproomItemCount(4,478,1,1)>=1 and CalcEquiproomItemCount(4,479,1,1)>=1) then
			ConsumeEquiproomItem(1,4,474,1,1)
			ConsumeEquiproomItem(1,4,475,1,1)
			ConsumeEquiproomItem(1,4,476,1,1)
			ConsumeEquiproomItem(1,4,477,1,1)
			ConsumeEquiproomItem(1,4,478,1,1)
			ConsumeEquiproomItem(1,4,479,1,1)
			i_high = random(1,18000)
			if ( i_high < 1000 ) then
				AddEventItem(480)
				Msg2Player("B�n nh�n ���c 1 'H�ng Hoa B�ng tinh'")
				Pay(on_pay)
			elseif ( i_high < 2000 ) then
				AddEventItem(481)
				Msg2Player("B�n nh�n ���c 1 'Ho�ng Hoa B�ng tinh'")
				Pay(on_pay)
			elseif ( i_high < 3000 ) then
				AddEventItem(482)
				Msg2Player("B�n nh�n ���c 1 'Lam Hoa B�ng tinh'")
				Pay(on_pay)
			elseif ( i_high < 4000 ) then
				AddEventItem(483)
				Msg2Player("B�n nh�n ���c 1 'T� Hoa B�ng tinh'")
				Pay(on_pay)
			elseif ( i_high < 5000 ) then
				AddEventItem(484)
				Msg2Player("B�n nh�n ���c 1 'L�c Hoa B�ng tinh'")
				Pay(on_pay)
			elseif ( i_high < 6000 ) then
				AddEventItem(485)
				Msg2Player("B�n nh�n ���c 1 'B�ch Hoa B�ng tinh'")
				Pay(on_pay)
			else
				Msg2Player("Xin l�i! Th�t b�i r�i!B�n tr� ��ng n�n ch�! L�n sau nh�t ��nh s� th�nh c�ng!!")
				Pay ( on_pay )
				i_back=random(1,7000)
				if (i_back < 2000) then
					AddEventItem(474)
				elseif (i_back < 3000) then
					AddEventItem(475)
				elseif (i_back < 4000) then
					AddEventItem(476)
				elseif (i_back < 5000) then
					AddEventItem(477)
				elseif (i_back < 6000) then
					AddEventItem(478)
				else
					AddEventItem(479)
				end
			end
			check_again(474)	--Is there enough crystals
		
		else
			Talk(1,"","Xin l�i! Ki�m tra k� l�i xem! C�n 1 b� Ph� B�ng Tinh 6 m�u.")
		end
	else
		Talk(1,"","Xin l�i! Ti�n kh�ng ��! Mau tr� v� l�y �i!.")
	end

end
	


function crystal_perfect()

	local on_pay = 100000
	if ( GetCash() >= on_pay ) then
		if ((CalcEquiproomItemCount(4,480,1,1)>=1) and CalcEquiproomItemCount(4,481,1,1)>=1 and CalcEquiproomItemCount(4,482,1,1)>=1 and CalcEquiproomItemCount(4,483,1,1)>=1 and CalcEquiproomItemCount(4,484,1,1)>=1 and CalcEquiproomItemCount(4,485,1,1)>=1) then
			Pay ( on_pay )
			ConsumeEquiproomItem(1,4,480,1,1)
			ConsumeEquiproomItem(1,4,481,1,1)
			ConsumeEquiproomItem(1,4,482,1,1)
			ConsumeEquiproomItem(1,4,483,1,1)
			ConsumeEquiproomItem(1,4,484,1,1)
			ConsumeEquiproomItem(1,4,485,1,1)
			i_perfect = random(1,30000)
			if ( i_perfect < 6000 ) then
				AddEventItem(486)
				WriteLog(date("%H%M%S")..": T�i kho�n"..GetAccount()..", nh�n v�t"..GetName()..", ���c 1 Ho�n M� B�ng Tinh.")
				Msg2Player("Ch�c m�ng! B�n nh�n ���c 1 vi�n Ho�n M� b�ng tinh! H�y t��i l�n h�t Gi�ng Sinh �� nh�n ���c h�t Ho�ng Kim!")
			else
				Msg2Player("Xin l�i! Th�t b�i r�i! B�n tr� ��ng n�n ch�! L�n sau nh�t ��nh s� th�nh c�ng!")
				i_back=random(1,7000)
				if (i_back < 2000) then
					AddEventItem(480)
				elseif (i_back < 3000) then
					AddEventItem(481)
				elseif (i_back < 4000) then
					AddEventItem(482)
				elseif (i_back < 5000) then
					AddEventItem(483)
				elseif (i_back < 6000) then
					AddEventItem(484)
				else
					AddEventItem(485)
				end
			end
			check_again(480)	--Is there enough crystals
			
		else
			Talk(1,"","Xin l�i! Ki�m tra k� l�i xem! C�n 1 b� Hoa B�ng Tinh 6 m�u.")
		end
	else
		Talk(1,"","Xin l�i! Ti�n kh�ng ��! Mau tr� v� l�y �i!.")
	end

end

function check_again(i_item)

	local on_pay = 2000
	if ( i_item == 474 )	then
		on_pay = 10000
	elseif ( i_item == 480 )	then
		on_pay = 100000
	end
	if ( GetCash() >= on_pay ) then
		if ((CalcEquiproomItemCount(4,i_item,1,1)>=1) and CalcEquiproomItemCount(4,i_item + 1,1,1)>=1 and CalcEquiproomItemCount(4,i_item + 2,1,1)>=1 and CalcEquiproomItemCount(4,i_item + 3,1,1)>=1 and CalcEquiproomItemCount(4,i_item + 4,1,1)>=1 and CalcEquiproomItemCount(4,i_item + 5,1,1)>=1)	then
			if ( i_item == 468 )	then
				Say("B�n tr� c� mu�n ti�p t�c tinh luy�n Ph� Th�ng B�ng tinh kh�ng?",2,"���c!/crystal_medi","Kh�ng c�n!/no")
			elseif ( i_item == 474 )	then
				Say("B�n tr� c� mu�n ti�p t�c tinh luy�n Hoa B�ng tinh kh�ng?",2,"���c!/crystal_high","Kh�ng c�n!/no")
			else
				Say("B�n tr� c� mu�n ti�p t�c tinh luy�n Ho�n M� B�ng tinh kh�ng?",2,"���c!/crystal_perfect","Kh�ng c�n!/no")
			end
		end
	end
end




-----------------------������������-----------------------


------------------------��������-------------------------

function sow_seed()

	Say("Ng��i mu�n ��m h�t n�o? Ch� c�n c� �� ti�n v� nguy�n li�u, l�o s� gi�p h�t m�nh",3,"��m h�t Gi�ng Sinh May m�n (3000 l��ng) /do_sow_seed","��m h�t Hoa H�ng Gi�ng Sinh (1 v�n l��ng) /do_sow_seed","�� ta suy ngh� l�i!/no")

end

function do_sow_gold()

	local on_pay = 1000000
	if ( GetCash() >= on_pay ) then
		if ( CalcEquiproomItemCount(4,486,1,1)>=6 and CalcEquiproomItemCount(4,487,1,1)>=1 ) then
			ConsumeEquiproomItem(6,4,486,1,1)
			ConsumeEquiproomItem(1,4,487,1,1)
			Pay( on_pay )
			i_goldseed = random(1,18000)
			if ( i_goldseed < 20000 ) then		--100%rate
				AddItem(6,1,145,1,0,0,0)
				Talk(1,"","Ch�c m�ng b�n ��m h�t th�nh c�ng! Mau c�ng v�i b�ng h�u nu�i d��ng h�t qu� n�y! S� nh�n ���c nhi�u qu� t�ng Gi�ng sinh!")
				Msg2Player("B�n nh�n ���c 1 h�t"..seed_name[4].."H�t ")
				WriteLog(date("%H%M%S")..": T�i kho�n"..GetAccount()..", nh�n v�t"..GetName()..", nh�n ���c 1 h�t Ho�ng Kim gi�ng sinh")
				AddGlobalNews(GetName().."Nh�n ���c *H�t Ho�ng Kim*, ch�ng ta c�ng ch�c b�n �y s�m tr�ng th�nh c�ng c�y 'Ho�ng Kim Gi�ng Sinh' �� nh�n ���c trang b� Ho�ng Kim!")
			else
				Talk(1,"","Th�t b�i r�i! ��ng n�n ch� nh�!")
			end
		else
			Talk(1,"","Xin l�i! Ki�m tra k� l�i xem! C�n 6 vi�n Ho�n M� B�ng Tinh v� 1 h�t gi�ng sinh m�i c� th� ��m")
		end
	else
		Talk(1,"","Xin l�i! Ti�n kh�ng mang ��! H�y v� l�y th�m nh�!")
	end
			

end


function do_sow_seed(nsel)

	nsel1 = nsel
	nsel = nsel * 6
	local on_pay = 2000
	if ( nsel1 == 0 ) then
		on_pay = 3000
	elseif ( nsel1 == 1 ) then
		on_pay = 10000
	else
		on_pay = 100000
	end
	seed_sow[1] = CalcEquiproomItemCount(4,nsel + 468,1,1)
	seed_sow[2] = CalcEquiproomItemCount(4,nsel + 469,1,1)
	seed_sow[3] = CalcEquiproomItemCount(4,nsel + 470,1,1)
	seed_sow[4] = CalcEquiproomItemCount(4,nsel + 471,1,1)
	seed_sow[5] = CalcEquiproomItemCount(4,nsel + 472,1,1)
	seed_sow[6] = CalcEquiproomItemCount(4,nsel + 473,1,1)
	nTotal = seed_sow[1] + seed_sow[2] + seed_sow[3] + seed_sow[4] + seed_sow[5] + seed_sow[6]
	if ( GetCash() >= on_pay ) then
		if ( nTotal >= 6 and CalcEquiproomItemCount(4,487,1,1)>=1 ) then
			Pay ( on_pay )
			nTimes = 6
			for s = 1, 6 do
				if ( seed_sow[s] >= nTimes ) then
						ConsumeEquiproomItem(nTimes,4,nsel + 467 + s,1,1)
					break
				else
					nTimes = nTimes - seed_sow[s]
						ConsumeEquiproomItem(seed_sow[s],4,nsel + 467 + s,1,1)
				end
			end
			ConsumeEquiproomItem(1,4,487,1,1)
			AddItem(6,1,nsel1 + 142,1,0,0,0)
			Talk(1,"","Ch�c m�ng b�n ��m h�t th�nh c�ng! Mau c�ng v�i b�ng h�u nu�i d��ng h�t qu� n�y! S� nh�n ���c nhi�u qu� t�ng Gi�ng sinh!")
			Msg2Player("B�n nh�n ���c 1 h�t"..seed_name[nsel1 + 1].."H�t ")
		else
			Talk(1,"","Xin l�i! Ki�m tra l�i k� xem! C�n 6 vi�n "..crystal_name[nsel1 + 1].."B�ng tinh v� 1 h�t Gi�ng Sinh m�i c� th� ��m")
		end
	else
		Talk(1,"","Xin l�i! Ti�n kh�ng ��! H�y v� l�y th�m �i!")
	end

end





------------------------�������ӽ���-------------------------


function no()

	Talk(1,"","C�m �n ng��i c�n nh� ��n ta! Ch�c gi�ng sinh vui v�!")

end