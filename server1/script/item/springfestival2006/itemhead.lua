Include("\\script\\lib\\common.lua")

TAB_ACTION = 
{--{��ͼ��missionid��grouptaskid��maxplayercount���Ƿ�Ϊ�����޻��{���鱶��������ʱ��}���ݵط�Ǭ��Ų�Ʒ��ļ�}
	{822, 38, 2330, 10, {0}, 10, {2331, 2332}, [[\settings\maps\chrismas\player.txt]]},
	{824, 40, 2409, 10, {1, 19}, 10, {2410, 2411}, [[\settings\maps\springfestival2006\player.txt]]}
}

--�������Ƿ���Ա�ʹ��
function itemmapcheck(tab)
	if (tab == nil or type(tab) ~= "table") then
		Talk(1, "", "��o c� n�y kh�ng d�ng ���c � khu v�c n�y.");
		return 0;
	end;
    local ww, xx, yy = GetWorldPos();
    for i = 1, getn(tab) do
	    if (tab[i][1] == ww) then
	    	return i;
	    end;
	end;
    Talk(1, "", "��o c� n�y kh�ng d�ng ���c � khu v�c n�y.");
    return 0;
end;

--��������Ƿ�������Ϸ�У��ɹ�����PlayerIndex���򷵻�nil
function check_pl(szPlayName, nMissionID)
	local nPlIdx = SearchPlayer(szPlayName)	--����Ƿ��ڵ�ǰ������
	if (nPlIdx > 0) then
		local nPlMsIdx = PIdx2MSDIdx(nMissionID, nPlIdx)	--����Ƿ���ָ��Mission��
		if (nPlMsIdx > 0) then
			return nPlIdx
		end
	end
end

--����һ������ڵ�ǰ��ҵ�ѡ��
function make_option(szFunName)
	local szName = GetName()
	return safeshow(szName).."/#"..szFunName.."('"..safestr(szName).."')"
end

--�ҵ�������Ӫ�����ޡ���>��ң���ҡ���>����
function getgroupid(nGroupId, SMALLMAPCOUNT)
    if (nGroupId < 1) then
        return nil
    end;
    
    if (nGroupId > SMALLMAPCOUNT) then
        return nGroupId - SMALLMAPCOUNT;
    else
        return nGroupId + SMALLMAPCOUNT;
    end;
end;