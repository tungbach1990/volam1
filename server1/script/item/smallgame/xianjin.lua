
local tbItemMagic = 
{
	--��ϸID��ֻ����magicscript.txt�µ���Ʒ
	[2795] =  {nId = 668, nLevel = 5, szName = "Huy�n Hu�n H�m T�nh"},
	[2796] =  {nId = 669, nLevel = 10, szName = "B�y l�m ch�m"},
}


function main(nItemIndex)
	--��Ҫ���ʹ�õĵ�ͼ

	local _,_,nId = GetItemProp(nItemIndex)
	local tbSkill = %tbItemMagic[nId]
	CastSkill(tbSkill.nId, tbSkill.nLevel)
	Msg2Player(format("��i hi�p �� %s 1 <color=0xB5FDD7>%s<color>", tbSkill.szDo or "s�p x�p", tbSkill.szName))
	
end