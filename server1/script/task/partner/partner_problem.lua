-------------------------------------------------------------------------
-- FileName		:	partner_problem.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-07-07 11:28:15
-- Desc			:  	ͬ��ϵͳ���⼯��
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
TabFile_Load("\\settings\\task\\partner\\problem\\partner_allproblem.txt","allproblem") --��������ʹ�
Include("\\script\\task\\partner\\partner_head.lua") --������ͼ�����



--pronumb��  	 �ش�������Ҫ��Ե���Ŀ
--numbmin��   	�ش�����������Сֵ
--numbmax��   	�ش������������ֵ
--numblength��	�ش�����ʱ��������������
--taskvalue�� 	�ش�����������ֽڿ��ص���ر���
--taskbyte��    �ش�������������ĿҪ��������ֽڿ��ص��ֽ�λ��
--prblemchange  Ϊ1ʱ������������ȫ��Ե�ʱ����лص� 
--prblemchange  Ϊ2ʱ����������ش�û�дﵽҪ��ʱ���лص�
--prblemchange  Ϊ3��������>=3 �����֣������ⲻ���ڹ涨�������ж�
--prblemchange  Ϊ0ʱ��ش��һ�ξ��ж�
--keepon��      �ص�������������partner_keeponproblem������λ��

partner_answer =
{
[1]={2,3,4,6,8,16,19,25,29,30,36,42,45,51,55,59,62,67,69,72,80,82,84,88,90,91,95,117},
[2]={5,10,12,13,17,20,22,23,26,27,31,34,38,41,46,48,49,50,52,56,60,61,64,71,77,81,87,86,93,94,96,98,99,102,106,109,110,111,113,115,116,118},
[3]={1,7,9,11,14,15,18,21,24,28,32,33,35,37,39,40,43,44,47,53,54,57,58,63,65,66,68,70,73,74,75,76,78,79,83,85,89,92,97,100,101,103,104,105,107,108,112,114}
}

partner_keeponproblem ={} 

function partner_edu(pronumb,numbmin,numbmax,numblength,taskvalue,taskbyte,problemchange,keepon)   
	nt_setTask(1233,0)                     --ȥ������Դ���
	SetTaskTemp(182,0)         			   --��ʱ����182��¼��������	
	SetTaskTemp(183,0)         			   --��ʱ����183��¼����Ĵ�Դ���			
	SetTaskTemp(184,0)         			   --��ʱ����184��¼����������Сֵ			
	SetTaskTemp(185,0)         			   --��ʱ����185��¼�����������ֵ			
	SetTaskTemp(186,0)        			   --��ʱ����186��¼����Ļش����			
	SetTaskTemp(187,0)         			   --��ʱ����187��¼����Ŀ����������			
	SetTaskTemp(188,0)         			   --��ʱ����188��¼����Ŀ����ֽ�		
	SetTaskTemp(190,0) 	
	SetTaskTemp(191,0) 
	partner_eduproblem(pronumb,numbmin,numbmax,numblength,taskvalue,taskbyte,problemchange,keepon) 
end

function partner_eduproblem(pronumb,numbmin,numbmax,numblength,taskvalue,taskbyte,problemchange,keepon)   
	
	if ( numblength == 0 ) then
		Msg2Player("�Բ������Ѿ��ﵽ�˻ش������������ޣ�������������")
		nt_setTask(1233,0)                                                --�ﵽ����ޣ�ȥ������Դ���
		if (keepon ~= nil and keepon >= 1 and keepon <= getn(partner_keeponproblem)) then
			partner_keeponproblem[keepon](0)
		end
		return 
	end
	
	local partner_problemnumber = random(numbmin,numbmax)                 --���ṩ����ŷ�Χ���������
	
	SetTaskTemp(182,partner_problemnumber)         --��ʱ����182��¼��������	
	SetTaskTemp(183,pronumb)         			   --��ʱ����183��¼����Ĵ�Դ���			
	SetTaskTemp(184,numbmin)         			   --��ʱ����184��¼����������Сֵ			
	SetTaskTemp(185,numbmax)         			   --��ʱ����185��¼�����������ֵ			
	SetTaskTemp(186,numblength)        			   --��ʱ����186��¼����Ļش����			
	SetTaskTemp(187,taskvalue)         			   --��ʱ����187��¼����Ŀ����������			
	SetTaskTemp(188,taskbyte)         			   --��ʱ����188��¼����Ŀ����ֽ�		
	SetTaskTemp(190,problemchange) 	               --��ʱ����190��¼�����Դ��ʱ�Ļص�����	
	SetTaskTemp(191,keepon)                        --��ʱ����191��¼����ص��Ļ����ص��������������λ��
	partner_p(partner_problemnumber) 	
		
end

function partner_p(partner_problemnumber) 	
	local nRowCount = TabFile_GetRowCount("allproblem")
	for i=1,nRowCount do 
		local problem_id = tonumber( TabFile_GetCell( "allproblem" ,i , "problemid" ))
		if ( problem_id == partner_problemnumber ) then
			local problem_content = TabFile_GetCell( "allproblem" ,i , "problemcontent")
			local problem_a = TabFile_GetCell( "allproblem" ,i , "channelA")
			local problem_b = TabFile_GetCell( "allproblem" ,i , "channelB")
			local problem_c = TabFile_GetCell( "allproblem" ,i , "channelC")
			Describe(DescLink_TongBanJiaoYu.."��"
			..problem_content.."?<enter>"
			.."A��"..problem_a.."<enter>"
			.."B��"..problem_b.."<enter>"
			.."C��"..problem_c,3,
			"A/partner_problema",
			"B/partner_problemb",
			"C/partner_problemc")
		end
	end
end

function partner_problema()
	partner_problem(1);
end

function partner_problemb()
	partner_problem(2);
end

function partner_problemc()
	partner_problem(3);
end

function partner_problem(nAnswer)
	local j = 1
	local Uworld186 = GetTaskTemp(186)                                       
	SetTaskTemp(186,Uworld186-1) 											  --����ش�Ĵ���-1
	
	for i=1,getn(partner_answer[nAnswer]) do                                        --�����A��ѡ�����
		if ( GetTaskTemp(182) == partner_answer[nAnswer][i] ) then                    --������A����ȷ�𰸵��������������һ�µ�
			j = j+1
			local Uworld1233 = nt_getTask(1233)
			nt_setTask(1233,Uworld1233+1)                                     --���������+1
			Msg2Player("��ϲ������������Ŀ��")
			
			if (   GetTaskTemp(183)  == nt_getTask(1233) ) then				  --���������������ڴ������Ӧ������	  
				if ( GetTaskTemp(187) ~= 0 ) then							  --����������Ϊ0�����������״̬	
					nt_setTask(GetTaskTemp(187),SetBit(GetTask(GetTaskTemp(187)),GetTaskTemp(188),1))  --�����������������Ӧ�ֽ���Ϊ���״̬
				end
				Msg2Player("��ϲ��ش���ȷ����Ŀ�����Ѵﵽ��Ҫ��")
				
				local nProblemIdx = GetTaskTemp(191)
				if (nProblemIdx ~= nil and nProblemIdx >= 1 and nProblemIdx <= getn(partner_keeponproblem)) then
					partner_keeponproblem[nProblemIdx](1)
				end	
				
				return 10
			end
		end
	end
	if ( j == 1) then
		Msg2Player("�Բ��������ˡ�")
		if ( GetTaskTemp(190) == 0 ) then
			return
		end
	end
	partner_eduproblem(GetTaskTemp(183),GetTaskTemp(184),GetTaskTemp(185),GetTaskTemp(186),GetTaskTemp(187),GetTaskTemp(188),GetTaskTemp(190),GetTaskTemp(191))   	
end