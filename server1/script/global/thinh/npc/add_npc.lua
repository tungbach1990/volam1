-- So thu tu NPC la so trong npcs.xlss - 2

dialognpc_thinh = { 
{1393,53,1631,3172,"\\script\\global\\thinh\\npc\\npc_trangbi.lua","NPC Trang B�"}, 
{1393,78,1589,3286,"\\script\\global\\thinh\\npc\\npc_trangbi.lua","NPC Trang B�"}, 
{173,53,1635,3177,"\\script\\global\\thinh\\npc\\npc_vocong.lua","NPC V� C�ng"}, 
}


function add_npc_thinh()
	add_dialognpc(dialognpc_thinh) -- c� s�n trong autoexec.lua
end