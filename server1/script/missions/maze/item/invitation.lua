-- ����Ӣ����ʹ�ýű�
Include("\\script\\global\\playerlist.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\missions\\maze\\head.lua")

function main(nItemIndex)
	local player = PlayerList:GetPlayer(PlayerIndex)
	if (not player) then
		return 1
	end
	if (player:GetTask(TASK_MAZEINVITATION) ~= 0) then
		player:Say("Ng�c Long Anh H�ng Thi�p m�i ng��i ch� ���c s� d�ng m�t l�n")
	elseif (player:GetLevel() < 120) then
		player:Say("C�p 120 tr� l�n m�i c� th� s� d�ng Ng�c Long Anh H�ng Thi�p")
	else
		player:SetTask(TASK_MAZEINVITATION, 1)
		player:Say("Ng�c Long S�n Trang xin m�i c�c h� gh� th�m Th� Ki�m C�c, Chu Qu�n l� Thi�n Xu H� Ki�m S� s� � Th� Ki�m C�c cung ngh�nh c�c h� ��i gi� quang l�m, c� th� th�ng qua c�c Xa Phu � c�c th�nh th� �� �i ��n Th� Ki�m C�c.")
		return 0
	end
	return 1
end
