-- ְ��_����.lua �ٰ�������ϴPK��
-- By: Dan_Deng(2003-12-01)

FESTIVAL06_NPCNAME = "<color=yellow>:<color>";
Include("\\script\\global\\ϴpk������.lua")
Include([[\script\global\·��_��������.lua]]);

function main(sel)
    gsoldier_entance();
end;

function main_former()
	SetTask(93,1)		-- ��ס�����ٰ�������
	default_talk()
end;
