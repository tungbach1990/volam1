Include("\\script\\global\\login_head.lua")
Include("\\script\\task\\task_addplayerexp.lua");
Include("\\script\\lib\\awardtemplet.lua");

function LoginMessage()
	local nLevel = GetLevel();
	if (nLevel >= 1) then		
		Msg2Player("Ch�o m�ng b�n ��n v�i <color=yellow>              V� L�m Truy�n K� Offline<color=yellow><enter>- <color=Red>https://fb.com/groups/volamquan <color><enter>- Edit t�ng h�p By <color=Green>Eurofun<color>")
	end
end

if login_add then login_add(LoginMessage, 1) end