-- �ٰ���ְ�ܡ��ӻ����ϰ�
-- by��Dan_Deng(2003-09-16)

--========�ű��޸�==================================--
--�޸��ߣ�yfeng
--�޸����ڣ�2005-1-28
--�޸�ԭ�򣺴����г��
--
--
--==================================================--
Include "/script/event/chinesenewyear/eventhead.lua"
Include("\\script\\global\\global_zahuodian.lua");


--if CHINESENEWYEAR then
--	tinsert(Buttons,1,"������յ���/BuyNewyearItem")
--end 
	
function main()
local Buttons = store_sel_extend();
	local nDate = tonumber(GetLocalDate("%Y%m%d%H"));
	if (nDate >= 2006122200 and nDate <= 2007011424) then
		tinsert(Buttons,1,"Mua Thi�p/BuyVnXasCard")
	end;
	Say("B�n ti�m x�ng danh l� 't�p h�a nam b�c'. H�ng h�a ��ng t�y nam b�c ��u c� �� c�. S�n H� � ��ng H�i, m� l�c �� � Gobi, Kh�ng t��c Linh � L�nh Nam, da ch�n t�m � n�i Tr��ng B�ch, b�t k� l� th� ng��i �� nh�n th�y hay ch�a t�ng th�y qua, � ��y ta ��u c� c� ",
			getn(Buttons),
			Buttons)
end;

function yes()
	Sale(2);  				--�������׿�
end;

function no()
end;

function BuyNewyearItem()
	Sale(101)
	return
end

function BuyChristmasCard()
	Sale(97);
end

function BuyVnXasCard()
	Sale(147)
end;