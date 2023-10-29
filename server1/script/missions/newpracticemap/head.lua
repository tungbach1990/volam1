tbNewPracticeMap = {};

tbNewPracticeMap.bDeBug			= 0;					-- DeBugģʽ
tbNewPracticeMap.interval		= 18 * 60;				-- Timer��� (1����)
tbNewPracticeMap.timerId		= 114;					-- TimerID
tbNewPracticeMap.TimeLeft_A		= 2662;					-- �������:A�͵�ͼʣ��ʱ��
tbNewPracticeMap.TimeLeft_B		= 2663;					-- �������:B�͵�ͼʣ��ʱ��
tbNewPracticeMap.MapId_A		= {917,918,919,920};	-- A�͵�ͼID
tbNewPracticeMap.MapId_B		= {921,922,923,924};	-- B�͵�ͼID
tbNewPracticeMap.WarningTime	= 3;					-- ��ʾʱ�� (ʣ��ʱ��С��3���ӽ�����ʾ)

function tbNewPracticeMap:checkMapId()	
	
	local nSubWorldID = SubWorldIdx2ID();
	
	for i = 1, getn(self.MapId_A) do
		if(nSubWorldID == self.MapId_A[i]) then 
			return 1;
		end
	end
	
	for i = 1, getn(self.MapId_B) do
		if(nSubWorldID == self.MapId_B[i]) then 
			return 2; 
		end
	end	
	
	return 0;	
end