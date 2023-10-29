Include("\\script\\misc\\eventsys\\eventsys.lua")


local ChannelChat = EventSys:NewType("OnChannelChat")

ChannelChat.ChannelType_Unknown = 0	--δ֪
ChannelChat.ChannelType_Screen	= 1	--����
ChannelChat.ChannelType_World	= 2	--����
ChannelChat.ChannelType_GM		= 3	--GM
ChannelChat.ChannelType_City	= 4	--����
ChannelChat.ChannelType_Team	= 5	--����
ChannelChat.ChannelType_Tong	= 6	--����
ChannelChat.ChannelType_TongUnion	= 7		--��������
ChannelChat.ChannelType_Faction		= 8		--����
ChannelChat.ChannelType_War			= 9		--����ս
ChannelChat.ChannelType_ChatRoom	= 10	--������


if nil then
	local TestEvent = function(szType)
		print("OnChannelChat", szType)
	end
	
	ChannelChat:Reg(ChannelChat.ChannelType_City, TestEvent, "ChannelType_City")
	ChannelChat:Reg(ChannelChat.ChannelType_World, TestEvent, "ChannelType_World")
	ChannelChat:Reg(ChannelChat.ChannelType_Tong, TestEvent, "ChannelType_Tong")
end