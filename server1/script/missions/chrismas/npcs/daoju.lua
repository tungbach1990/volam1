Include([[\script\missions\chrismas\ch_head.lua]]);

function main()
	Say("Ng��i mu�n v�t ph�m n�o?", 8, "Gia T�c ho�n/jiasuwan", "Huy�n Hu�n H�m T�nh/xuanyunxianjing", "Huy�n Thi�n H�m T�nh/xuantianxianjing", "B�y l�m ch�m/chihuanxianjing", "B�ng Phong H�m T�nh/bingfengxianjing", "B�o L�i Hi�u gi�c/baoleihaojiao", "B�ng S��ng Hi�u gi�c /bingshuanghaojiao", "�� ta suy ngh� k� l�i xem/oncancel");
end;

function jiasuwan()	
	AddSkillState(512,4,0,10*18);
end;

function xuanyunxianjing()
	CastSkill(668,1)
end;

function xuantianxianjing()
	CastSkill(668,10)
end;

function chihuanxianjing()
	CastSkill(669,1)
end;

function bingfengxianjing()
	CastSkill(669,10)
end;

function baoleihaojiao()
	CastSkill(505,1)
end;

function bingshuanghaojiao()
	CastSkill(506,1)
end;

function oncancel()
	
end;