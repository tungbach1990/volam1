
local tbPoint = {
	[3205] = 10,
	[3206] = 100,
	[3207] = 1000,
}

function main(nItemIndex)
	local _, _, nP = GetItemProp(nItemIndex)
	local nValue = %tbPoint[nP] + GetTask(3399)
	SetTask(3399, nValue)
	Msg2Player(format("<color=yellow>Ng��i nh�n ���c %d �i�m th�n m�c<color>", %tbPoint[nP]))
end