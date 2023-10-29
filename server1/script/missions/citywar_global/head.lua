Include("\\script\\tong\\tong_header.lua");
--�߸����й��ط�����EventItemID
CardTab = {};
CardTab[1]= 363
CardTab[2]= 362
CardTab[3]= 355
CardTab[4]= 354
CardTab[5]= 367
CardTab[6]= 366
CardTab[7]= 359
CardTab[8]= 358
CardTab[9]= 357
CardTab[10]= 356
CardTab[11]= 365
CardTab[12]= 364
CardTab[13]= 361
CardTab[14]= 360

--���Ƽ۸�
CardPrice = 200000;
--�������Ƽ۸�
ReturnCardPrice = 10000;

TIAOZHANLING_LGTYPE = 538					--��ս��վ������
TIAOZHANLING_LGName = "tiaozhanling"	--��ս��վ�Ӷ�����
LGTSK_TIAOZHANLING_COUNT = 1		--��ս��վ�Ӽ�¼��ս�����TaskID

function checkBangHuiLimit()
	local TongName,TongID = GetTongName();
	if TongName == "" or TongName == nil then
		return 0;
	else
		return 1;
	end
end

function checkCreatLG(szlgname)
	local nlid = LG_GetLeagueObj(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName)
	if nlid == 0 or nlid == nil then
		local nNewLeagueID = LG_CreateLeagueObj()
		LG_SetLeagueInfo(nNewLeagueID, TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName)	--����������Ϣ(���͡�����)
		local ret = LG_ApplyAddLeague(nNewLeagueID, "", "") 
		LG_FreeLeagueObj(nNewLeagueID)
	end
end

function checkJoinLG(szlgname)
	local roleid = LG_GetLeagueObjByRole(TIAOZHANLING_LGTYPE,szlgname);
	if roleid == 0 or roleid == nil then
		local nMemberID = LGM_CreateMemberObj() -- �������ų�Ա���ݶ���(���ض���ID)
		--�������ų�Ա����Ϣ(��ɫ����ְλ���������͡���������)
		LGM_SetMemberInfo(nMemberID,szlgname, 0, TIAOZHANLING_LGTYPE, TIAOZHANLING_LGName) 
		local ret = LGM_ApplyAddMember(nMemberID, "", "") 
		LGM_FreeMemberObj(nMemberID)
	end
end
