--��Ϸʱ��
FRAME2TIME		= 18;			-- 18���൱����Ϸ��1����
--����������೤ʱ����˫������
AEXP_ADWARD_TIME = 4

--��¼��ǰ�ļ����������������tab�ļ�
--windows����
--CITYPRIZETABFILENAME	=	"data\\cityprize.txt"
--Linux����
CITYPRIZETABFILENAME	=	"data//cityprize.txt"

AEXP_LOAD		= 0

--������
AEXP_AWARDMEDIAL_NGENTYPE 		= 6;
AEXP_AWARDMEDIAL_DETAILTYPE 	= 1;
AEXP_AWARDMEDIAL_PARTYPE 		= 197;

--������
AEXP_PUNISHMEDIAL_NGENTYPE 		= 6;
AEXP_PUNISHMEDIAL_DETAILTYPE	= 1;
AEXP_PUNISHMEDIAL_PARTYPE 		= 198;

--�����콱��������
AEXP_ADWARD_HOURNUM	= 24
--��ʼ���͵����ֵ
AEXP_MAXADWARDNUM = 9999

--ȫ���������(��������������)
AEXP_GLOBAL_FENGXIANG	= 20
AEXP_GLOBAL_CHNEGDU		= 21
AEXP_GLOBAL_DALI		= 22
AEXP_GLOBAL_BIANJING	= 23
AEXP_GLOBAL_XIANGYANG	= 24
AEXP_GLOBAL_YANGZHOU	= 25
AEXP_GLOBAL_LINAN		= 26
--��ǰ��������
AEXP_GLOBAL_ADWARD_CITY	= 27
--�����������
AEXP_GLOBAL_ENDDATE 	= 28
--�Ƿ���ع������ļ�
AEXP_BLNLOADFILE		= 29


--�������
AEXP_TASK_ADWARDDATE	= 606	--�洢����콱����
AEXP_PLAYERTONG_LIMIT   = 1 	--������ʱ�������ڸ�ֵ���ſ�����ȡ��Ʒ����λΪ����(�ͽű��Ƚ�ʱ��ע��)

--���к�ȫ�ֱ����Ķ�Ӧ��
arraycitytoglobalvalue =
{
	AEXP_GLOBAL_FENGXIANG,
	AEXP_GLOBAL_CHNEGDU,
	AEXP_GLOBAL_DALI,
	AEXP_GLOBAL_BIANJING,
	AEXP_GLOBAL_XIANGYANG,	
	AEXP_GLOBAL_YANGZHOU,
	AEXP_GLOBAL_LINAN,
};

--���������ͳ������ƶ�Ӧ��
arraycityindextoname =
{
	"Ph��ng T��ng",
	"Th�nh ��",
	"��i L�",
	"Bi�n Kinh",
	"T��ng D��ng",
	"D��ng Ch�u",
	"L�m An",
};

--�ۼƴ���ĳֵʱ����
AEXP_ADDMAX_SAVE = 1000
--�ۼ�С��ĳֵʱ����
AEXP_REDUCEMAX_SAVE = 1000

function loadsavevalue()
	blnLoad = GetGlbValue(AEXP_BLNLOADFILE)
	if (blnLoad == nil or blnLoad == 0) then
		SetGlbValue(AEXP_BLNLOADFILE, 1)
		
		handle = openfile(CITYPRIZETABFILENAME, "r")
		if (handle == nil) then
			return 
		end
		
		for nIndex=AEXP_GLOBAL_FENGXIANG, AEXP_GLOBAL_ENDDATE do
			nValue = read(handle, "*l")
			if (nValue == nil or nValue == "") then
				nValue = 0
			else
				nValue = tonumber(nValue)
			end
			
			SetGlbValue(nIndex, nValue)
		end		
		
		closefile(handle)					
	end	
end

--Ϊ�˷�ֹseekѰ��file��������Ŀǰʹ�����ݽ��٣�����ʱ����ļ�����дһ�����ļ�
function savevalue()
	handle = openfile(CITYPRIZETABFILENAME, "w+")
	if (handle == nil) then
		return 0
	end

	for nIndex=AEXP_GLOBAL_FENGXIANG, AEXP_GLOBAL_ENDDATE do
		local nValue = GetGlbValue(nIndex)
		write(handle, nValue.."\n")	
	end
	
	closefile(handle)
end
