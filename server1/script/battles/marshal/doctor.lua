Include("\\script\\battles\\battleinfo.lua")
--�����
function main(sel)
--Say("H�u doanh do ta ph� tr�ch! Ng��i c� c�n gi�p �� g� kh�ng?",3,"Mua d��c ph�m/salemedicine","T�m hi�u quy t�c T�ng Kim ��i chi�n/help_sjbattle","Kh�ng c�n ��u! C�m �n!/cancel")
	Say("H�u doanh do ta ph� tr�ch! Ng��i c� c�n gi�p �� g� kh�ng?",2,"Mua d��c ph�m/salemedicine","Kh�ng c�n ��u! C�m �n!/cancel")
end;

function salemedicine(sel)
Sale(99, 1)
end