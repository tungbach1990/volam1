-- ��ɽ�� ������ʿ �Ի��ű�
-- ���� 2005-01-25

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\xishancun\\xishancun_head.lua")

COUNT_SHENMI_JUANZHOU = 100;

function main()
--	Uworld1064 = nt_getTask(1064) --��ɽ����ɽ������
--	
--	if ( GetLevel() >= 100) then
--	
--		if ( Uworld1064 == 0 ) then	-- ������ǰ�Ի�
--			Describe(DescLink_BuXingRenShi.."<#>���Ǻ�«���óԵ��Ǻ�«���������ֺóԵ��Ǻ�«������λ�͹٣����������������������ɽ����˰ɣ������Ǻ�«�ɣ�<enter>",
--			2,"������̽��ɽ�������/task002","���������Ǻ�«��/task001");
--		elseif ( Uworld1064 == 1 ) then	--�������Ի�
--			Describe(DescLink_BuXingRenShi..format("<#>��%d�����ؾ������Ѿ��ռ�������<enter>", COUNT_SHENMI_JUANZHOU),
--			2,"�����ؾ��ύ��������ʿ/task004","�һ��ǹ�������������/no")
--		elseif ( Uworld1064 >= 2 ) then  --�Ѿ��������
--			Say("������ʿ����ȥ��ɽ���һ��Ҫ��������ѽ��",0)
--		end;
--		
--	else
		Describe(DescLink_BuXingRenShi.."<#>: H� l� ng�t r� ��y! V� kh�ch quan n�y nh�n l� m�t nh�? Ch�c kh�ng ph�i ng��i th�n T�y S�n ch�ng ta. Mua m�t x�u h� l� �i!<enter>",
		1,"Mua k�o h� l� /task001");
--	end

end;

function task001()
	local name = GetName()
	Talk(1,"",name..": X�u k�o h� l� n�y ngon qu� �i!")
end;
function task002()
	local name = GetName()
	Describe(DescLink_BuXingRenShi.."<#>: Ng��i t�m ta c� vi�c g� kh�ng v�y?<enter>"
				..name..format("<#>: G�n ��y ta nghe n�i c� ng��i c� bi�t ��n v� tr� c�a T�y S�n ��o. C� th� ch� ta c�ch �i Vi S�n ��o ���c kh�ng?<enter>B�t  T�nh Nh�n S�: L� n�o ng��i trong th�n nhi�u ng��i bi�t th� sao, xem ra chuy�n n�y �� b� l� ra ngo�i giang h� r�i. Ch� c� �i�u ��y l� vi�c c�a h�ng ch�c n�m tr��c, ��i hi�p ph�i thu th�p �� %d m�t �� th�n b� cho ta th� ta m�i nh� l�i ���c<enter>", COUNT_SHENMI_JUANZHOU),
				2,"���c! Ta s� �i t�m ngay/task003","Ta kh�ng h�ng th� t� n�o/no")
end;

function	task003()
	Uworld1064 = nt_getTask(1064)
	nt_setTask(1064,1)
end;

-- ���ؾ��ύ������
function	task004()
GiveItemUI( "Giao di�n giao M�t ��", format("B�t T�nh Nh�n S�: Ng��i h�y b� %d m�t �� th�n b� v�o � tr�ng b�n d��i. Ch� �: N�u nh� b� nhi�u hay �t h�n s� l��ng %d m�t �� th�n b� ta s� kh�ng nh�n ��u.", COUNT_SHENMI_JUANZHOU,COUNT_SHENMI_JUANZHOU), "juanzhou", "no" );
end;

-- ȷ�����ؾ�����������
function juanzhou(ncount)
	Uworld1064 = nt_getTask(1064)
	local scrollarray = {}
	local scrollcount = 0
	local scrollidx = {}
	local y = 0
	for i=1, ncount do
		local nItemIdx = GetGiveItemUnit(i);
		itemgenre, detailtype, parttype = GetItemProp(nItemIdx)
		if (itemgenre == 6 and detailtype == 1 and parttype ==196) then	
			y = y + 1
			scrollidx[y] = nItemIdx;
			scrollarray[i] = GetItemStackCount(nItemIdx)
			scrollcount = scrollcount + scrollarray[i]
		end
	end
	if (y ~= ncount) then
		Say("M�t �� th�n b� ch�a ��, ng��i h�y ki�m tra l�i xem!", 2, "�! Th� ra ��t nh�m �� ta th� l�i./task004", "�� ta ki�m tra xem sao/no")
		return
	end
	if (scrollcount > COUNT_SHENMI_JUANZHOU) then
		Say(format("Ta ch� c�n %d M�t �� Th�n B�, ng��i ��ng ��a cho ta nhi�u nh� v�y.", COUNT_SHENMI_JUANZHOU), 2, "�! Th� ra ��t nh�m �� ta th� l�i./task004", "�� ta ki�m tra xem sao/no")
		return
	end
	if (scrollcount < COUNT_SHENMI_JUANZHOU) then
		Say("M�t �� th�n b� ng��i giao cho ta kh�ng �� th� ph�i, ki�m tra l�i xem!", 2, "�! Th� ra ��t nh�m �� ta th� l�i./task004", "�� ta ki�m tra xem sao/no")
		return
	end
	if (scrollcount == COUNT_SHENMI_JUANZHOU) then
		for i = 1, y do
			RemoveItemByIndex(scrollidx[i])
		end
		nt_setTask(1064,2)
		task005()
	end;		
end;
	
function task005()
	local name = GetName()
	Describe(DescLink_BuXingRenShi..format("<#>: Th�t kh�ng ng� ng��i �� thu th�p %d m�t �� th�n b�, ta c� �inh ninh l� ng��i th�y kh� v� b� �i r�i ch�. T�y S�n ��o nguy hi�m kh�n c�ng, ng��i kh�ng �i th� t�t h�n.<enter>",COUNT_SHENMI_JUANZHOU)
	..name..format("<#>: Ng��i ��ng lo l�ng cho ta, ta �� t�m �� %d m�t �� th�n b� r�i, ta ���ng ���ng l� m�t ��i tr��ng phu sao l�i �i s� c�i Vi S�n ��o b� t� �� ���c. Ng��i c� ch� cho ta c�ch �i Vi S�n ��o �i.<enter>B�t T�nh Nh�n S�: Xem ra ta kh�ng khuy�n gi�i ���c ng��i. Ng��i c� th� t�m Ti�u Nh� � T�y S�n (214, 195) trong th�n n�y v� n�i h�n l� ta b�o ng��i �i, h�n s� bi�t n�n l�m th� n�o.  Nh� l� ph�i h�t s�c c�n th�n nh�!<enter>",COUNT_SHENMI_JUANZHOU),
	1,"K�t th�c ��i tho�i/no")
	end;

function no()
end;
