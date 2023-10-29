--���������� ��ٽű�
--ʹ�ò��� ���׷ۣ���ɰ�ǣ����ʵĶ�ɳ�����ʵĺ��棬�����ɶ�ɳ���һ���������
--ÿ���������3������
--���� 80�������� ��ֵ�û��μ�

Include("\\script\\event\\jxanniversary3\\head.lua");

function OnEventJxAnniversary()
	CreateTaskSay({"<dec><npc>��,��ָһ�Ӽ䣬<sex>���ڽ���������ô��ʱ���ˡ������ʷ꽣����Ե������ʢ�´�䣬���Ǽ�����80�����ϵĳ�ֵ�û�������2006��9��19��~9��26���ڼ䣬���Ĵ�羰��(��ɽ�����ɽ������ɽ�����ɽ)����ռ����׷ۣ���ɰ�ǣ���ɳ������Ȳ��ϣ��Ϸ������Щ����Ϊ<sex>�������Ӿ���ֵ�ġ���ɳ���ҡ������������þ���ֵһ���ġ��������ҡ��������Ĵ�羰�����ֵ���ġ�������С�Ҳ����<sex>��������������ջ�Ŷ���Ǻǣ��²��˳٣�<sex>��ȥ��ذɡ�",
	"������������/JxAn_want2makeshoutao",
	"����ȥ������������������ص�/JxAn_go2eventplace",
	"��ֻ��������/OnCancel"});
end;

function JxAn_want2makeshoutao()
	CreateTaskSay({"<dec><npc>�Ǻǣ�<sex>��ô�����������ˡ�ʳ�á���ɳ���ҡ�����������300w���飬ʳ�á��������ҡ��ɻ��8Сʱ����˫��ʱ�䣬��֪������Ҫ�Ϸ��������������أ�",
	"������������ɳ���ҡ�/#JxAn_makeshoutao(1)",
	"�����������������ҡ�/#JxAn_makeshoutao(2)",
	"��ֻ��������/OnCancel"});
end;

function JxAn_makeshoutao(nShoutaoIndex)
	if (JxAn_CouldMakeShoutao() ~= 1) then
		return -1;
	end;
	
	CreateTaskSay({tb_JXAN_SHOUTAOKIND[nShoutaoIndex].szstart.."��׼������ô��",
	"�ǵģ�������������/#JxAn_doneshoutao("..nShoutaoIndex..")",
	"�����һ�Ҫ׼��һ��/OnCancel"});
end;

function JxAn_doneshoutao(nShoutaoIndex)
	local tbResource = tb_JXAN_SHOUTAOKIND[nShoutaoIndex].resource
	local bp = 1;
	for i = 1, getn(tbResource) do
		if (CalcEquiproomItemCount(tbResource[i][1],tbResource[i][2],tbResource[i][3],-1) < tbResource[i][4]) then
			bp = 0;
			break;
		end;
	end;
	if (bp == 0) then
		CreateTaskSay({"<dec><npc><sex>���Ϻ���û��������Ĳ��ϰɣ�������ʹ���,����ɺ�������", "������˼������ȥ׼��һ��/OnCancel"});
		return -1;
	end;
	for i = 1, getn(tbResource) do
		ConsumeEquiproomItem(tbResource[i][4], tbResource[i][1], tbResource[i][2], tbResource[i][3], -1);
	end;
	local tshoutao = tb_JXAN_SHOUTAOKIND[nShoutaoIndex].shoutao
	AddItem(tshoutao[1],tshoutao[2],tshoutao[3],1,1,1);
	SetTask(TASKID_JXAN_SHOUTAONUM, GetTask(TASKID_JXAN_SHOUTAONUM) + 1);
	CreateTaskSay({tb_JXAN_SHOUTAOKIND[nShoutaoIndex].szend.."��������Ʒ����!", "��������/OnCancel"});
end;

function JxAn_CouldMakeShoutao()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	local myDate = GetTask(TASKID_JXAN_SHOUTAODATE);
	local myNum = GetTask(TASKID_JXAN_SHOUTAONUM);
	local myLevel = GetLevel();

	if (myLevel < 80) then
		CreateTaskSay({"<dec><npc>��ĵȼ�������80�������ܲμ������", "�����Ի�/OnCancel"});
		return -1;
	end;
	if (nDate ~= myDate) then
		SetTask(TASKID_JXAN_SHOUTAODATE, nDate);
		SetTask(TASKID_JXAN_SHOUTAONUM, 0);
		return 1;
	elseif (myNum < JXANNIVERSARY3_SHOUTAONUM) then
		return 1;
	else
		CreateTaskSay({"<dec><npc><sex>�����Ѿ�����3���ˣ�������ذɡ�",
		"�����Ի�/OnCancel"});
	end;
	return -1;
end;

function JxAn_go2eventplace()
	local strAddr = "";	
	local tbAddrChoice = 
	{
		"��ֻ�����ʶ���/OnCancel"
	}
	for i = 1,getn(tb_JXAN_TSK_ADDR) do
		strAddr = strAddr.."<color=yellow>"..tb_JXAN_TSK_ADDR[i][2].."<color>";
		if (i < getn(tb_JXAN_TSK_ADDR)) then
			strAddr = strAddr.."��";
		else
			strAddr = strAddr.."��";
		end
		
		tinsert(tbAddrChoice, getn(tbAddrChoice), "����ȥ"..tb_JXAN_TSK_ADDR[i][2].."/#JxAn_sure2eventplace("..i..")");
	end
	tinsert(tbAddrChoice, 1, "<dec><npc>ƾ<sex>���Ϸ�Ľ���,�Ϸ��ֱ������ȥ��ص�,����֪"..strAddr.."����ȥ�����أ�");
	CreateTaskSay(tbAddrChoice);
end;

function JxAn_sure2eventplace(nAddrID)
	NewWorld(tb_JXAN_TSK_ADDR[nAddrID][1][1], tb_JXAN_TSK_ADDR[nAddrID][1][2], tb_JXAN_TSK_ADDR[nAddrID][1][3]);
	SetFightState(1);
end

function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end;
end;