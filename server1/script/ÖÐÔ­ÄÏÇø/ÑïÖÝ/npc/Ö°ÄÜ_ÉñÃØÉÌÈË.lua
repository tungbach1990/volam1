-- ���ݡ�ְ�ܡ���������
-- By Li_Xin (2004-08-17)
-- By Ren Bin (2004-12-15) ����ǧ��ٹֶ�����Ļ���



Include("\\script\\global\\shenmi_chapman.lua") 
Include( "\\script\\global\\mask_ani.lua" )
Include( "\\script\\global\\weapon_ring.lua" )
Include("\\script\\event\\act2years_yn\\baibaoxiang.lua") 


function main()
	do return end
	str=
	{
		"<#> Ta t� T�y V�c xa x�i ��n Trung Nguy�n �� thu th�p Th�y Tinh, Kim Nguy�n B�o v� Ng�n phi�u. Ta s�n s�ng ��i c�c b�o v�t �� ���c nh�ng th� ��! Kh�ch quan c� g� ��i kh�ng?",
		"<#> Trao ��i �� ph� v� kh� /get1",
		"<#> Mua K� tr�n d� b�o/get2",
--		"<#>�μ�ǧ��ٹֶ�����/hello",
--		"<#>����ʥ���������/chr_buy",
--		"<#>��������ָ/weapon_ring",
		"<#> Ta xem th� tr��c ��!/no",
		"<#>Ta mu�n ��i b�o r��ng/BaiBaoXiang_Give_UI"
	};
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	
	Say(str[1],4,str[5],str[2],str[3],str[4])
	
end;

function chr_buy()

	Say("Ta c� 2 b�o v�t d�nh cho d�p Gi�ng sinh n�y, �� l� <color=red>�ng Gi� Noel<color> v� <color=red>Thi�n S� Gi�ng sinh<color>. N�u mau ri�ng m�i c�i l� <color=red>399 v�n l��ng<color>, mua c� 2 c�i ch� c� <color=red>688 v�n l��ng<color>. C�n do d� g� n�a?",4,"Mua M�t n� �ng Gi� Noel (399 v�n) /mask","Mua M�t n� Thi�n S� Gi�ng sinh (399 v�n) /mask","Mua c� 2 M�t n� (688 v�n) /mask_all","�� ta suy ngh� k� l�i xem/no")

end

function mask_all()

	on_Pay = 6880000
	if ( GetCash() >= on_Pay ) then
		Pay( on_Pay )
		AddItem(0,11,70,0,0,0,0)
		AddItem(0,11,71,0,0,0,0)
		Msg2Player("B�n nh�n ���c 1 b� M�t n� ")
	else
		Say("Qu�n mang ti�n �? Kh�ng sao! Ta � ��y ��i ng��i! Nh�ng nh� quay l�i s�m nh�!",1,"���c!/no")
	end
end


function mask(msel)

	on_Pay = 3990000
	if ( GetCash() >= on_Pay ) then
		Pay( on_Pay )
		if ( msel == 0 ) then
			AddItem(0,11,70,0,0,0,0)
			Msg2Player("B�n nh�n ���c 1 M�t n� �ng Gi� Noel")
		else
			AddItem(0,11,71,0,0,0,0)
			Msg2Player("B�n nh�n ���c 1 M�t n� Thi�n S� Gi�ng sinh")
		end
	else
		Say("Qu�n mang ti�n �? Kh�ng sao! Ta � ��y ��i ng��i! Nh�ng nh� quay l�i s�m nh�!",1,"���c!/no")
	end

end

function no()

end