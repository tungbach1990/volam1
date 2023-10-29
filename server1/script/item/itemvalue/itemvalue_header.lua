-- ��ֵ���ű�ͷ�ļ�
-- Fanghao_Wu 2005.1.12

--------------------------------------------------------------------------------------------------------------------------------
-- ���ܣ���Ʒ��ֵ������ת�ƺ�������ӿ�
-- ������dSrcItemVal Դ��Ʒ��ֵ����arydDesItemVal Ŀ����Ʒ��ֵ������
-- ���أ�ѡ�е�Ŀ����Ʒ������0��ʾ�������û��ѡ���κ�һ��Ŀ����Ʒ��������Ŀ����Ʒ��ѡ�и������飬����Ŀ����Ʒ��ѡ�и���֮��
function TransItemVal( dSrcItemVal, arydDesItemVal )
	if( dSrcItemVal <= 0 or getn( arydDesItemVal ) <= 0 ) then
		return 0, nil, 0;
	end
	
	local nDesItemCount = getn( arydDesItemVal );
	local dProbRandNum = random();
	local arydDesItemValSort = {};
	local arynDesItemValIdx = {};
	local arydDesItemValTemp = {};
	local arydDesItemProbSort = {};
	local arydDesItemProb = {};
	local dDesItemProbSum = 0;
	local nSelDesItemIdx = 0;
	
	-- ��ʼ��
	for i = 1, nDesItemCount do
		arydDesItemValSort[i] = arydDesItemVal[i];
		arydDesItemValTemp[i] = arydDesItemVal[i];
		arydDesItemProbSort[i] = 0;
	end
	-- ��С��������
	inssort( arydDesItemValSort, 1, nDesItemCount );
	-- ���������arydDesItemValSort���ĺ�����ǰ��arydDesItemVal����������Ӧ��ϵ�� arynDesItemValIdx[���������] = ����ǰ����
	for i = 1, nDesItemCount do
		for j = 1, nDesItemCount do
			if( arydDesItemValSort[i] == arydDesItemValTemp[j] ) then
				arynDesItemValIdx[i] = j;
				arydDesItemValTemp[j] = -1;
				break;
			end
		end
	end
	-- �����ֵ��ת�Ƹ���
	transItemValImpl( dSrcItemVal, arydDesItemValSort, arydDesItemProbSort );
	-- ���ѡ��Ŀ����Ʒ
	for i = 1, nDesItemCount do
		dDesItemProbSum = dDesItemProbSum + arydDesItemProbSort[i];
		if( nSelDesItemIdx == 0 and dDesItemProbSum > 0 and dProbRandNum <= dDesItemProbSum ) then
			nSelDesItemIdx = arynDesItemValIdx[i];
		end
	end
	-- ��������ǰ�ĸ�������
	for i = 1, nDesItemCount do
		arydDesItemProb[arynDesItemValIdx[i]] = arydDesItemProbSort[i];
	end

--	local fileLog = openfile( "./Logs/KSG_CompoundLog_Prob.txt", "a+" );
--	local dDesItemProbSum = 0;
--	local dGenVal = 0;
--	print( format( "SrcVal\t%0.0f", dSrcItemVal ) );
--	Msg2Player( format( "SrcVal\t%0.0f", dSrcItemVal ) );
--	write( fileLog, format( "SrcVal\t%0.0f\r\n", dSrcItemVal ) );
--	for i = 1, nDesItemCount do
--		print( format( "DesVal\t%0.0f\t%0.4f%%", arydDesItemVal[arynDesItemValIdx[i]], arydDesItemProbSort[i] * 100 ) );
--		Msg2Player( format( "DesVal\t%0.0f\t%0.4f%%", arydDesItemVal[arynDesItemValIdx[i]], arydDesItemProbSort[i] * 100 ) );
--		write( fileLog, format( "DesVal\t%0.0f\t%0.4f%%\r\n", arydDesItemVal[arynDesItemValIdx[i]], arydDesItemProbSort[i] * 100 ) );
--		dDesItemProbSum = dDesItemProbSum + arydDesItemProbSort[i];
--		dGenVal = dGenVal + arydDesItemVal[arynDesItemValIdx[i]] * arydDesItemProbSort[i];
--	end
--	Msg2Player( "ProbSum:"..dDesItemProbSum );
--	Msg2Player( "GenVal:"..dGenVal );
	return nSelDesItemIdx, arydDesItemProb, dDesItemProbSum;
end

--------------------------------------------------------------------------------------------------------------------------------
-- ���ܣ���ֵ������ת�ƺ����ӿ�
--       ������Ҫѡ��ͬ�汾�ŵļ�ֵ������ת�ƺ�������ֵ������ת�ƺ����Ĳ����͹��ܱ�����ϸýӿڶ���
-- ������dSrcItemVal Դ��Ʒ��ֵ���� arydDesItemValSort ���ӵ͵��������Ŀ����Ʒ��ֵ�����飬 arydDesItemProbSort Ŀ����Ʒ��ѡ�еĸ���
-- transItemValImpl(dSrcItemVal, arydDesItemValSort, arydDesItemProbSort) = ...

	----------------------------------------------------------------------------------------------------------------------------
	-- ���ܣ���ֵ������ת�ƺ������汾1��2005.1.12����
	--       �ڴ��������Ŀ����Ʒ�����м�����ѡĿ����Ʒ
	--       Խ�ӽ�Դ��Ʒ��ֵ����Ŀ����Ʒ��ѡ�еĸ���Խ�󣬶�ԽԶ��Դ��Ʒ��ֵ����Ŀ����Ʒ��ѡ�еĸ���ԽѸ�ٽ���
	function _transItemValImpl_1(dSrcItemVal, arydDesItemValSort, arydDesItemProbSort)
		for i = 1, getn(arydDesItemValSort) do
			arydDesItemProbSort[i] = 1;
		end
		_calcProbLoop(arydDesItemValSort, arydDesItemProbSort, 1, getn(arydDesItemValSort), dSrcItemVal);
	end
	-- �ڲ��ݹ麯��
	function _calcProbLoop( arydValue, arydProb, nStartIdx, nEndIdx, dDivVal )
		-- ���ȫ����ֵ�ҵ����з�ֵdDivVal������ָ���
		if( nStartIdx < nEndIdx and arydValue[nStartIdx] == arydValue[nEndIdx] and dDivVal == arydValue[nStartIdx] ) then
			for i = nStartIdx, nEndIdx do
				arydProb[i] = arydProb[i] / ( nEndIdx - nStartIdx + 1 );
			end
		-- ����з�ֵdDivValС�ڵ�����Сֵ
		elseif( dDivVal <= arydValue[nStartIdx] ) then
			local nEqualCount = 0;
			for i = nStartIdx, nEndIdx do
				if( arydValue[nStartIdx] == arydValue[i] ) then
					nEqualCount = nEqualCount + 1;
				else
					break;
				end
			end
			for i = nStartIdx, nStartIdx + nEqualCount - 1 do
				arydProb[i] = arydProb[i] * ( dDivVal / arydValue[i] ) / nEqualCount;
			end
			for i = nStartIdx + nEqualCount, nEndIdx do
				arydProb[i] = 0;
			end
		-- ����з�ֵdDivVal���ڵ������ֵ
		elseif( dDivVal >= arydValue[nEndIdx] ) then
			local nEqualCount = 0;
			for i = nEndIdx, nStartIdx, -1 do
				if( arydValue[nEndIdx] == arydValue[i] ) then
					nEqualCount = nEqualCount + 1;
				else
					break;
				end
			end
			for i = nStartIdx, nEndIdx - nEqualCount do
				arydProb[i] = 0;
			end
			for i = nEndIdx - nEqualCount + 1, nEndIdx do
				arydProb[i] = arydProb[i] / nEqualCount;
			end
		-- ����з�ֵdDivVal������С�����ֵ֮��
		else
			local nDivIdx = nStartIdx;
			local dLessSum = 0;
			local dMoreSum = 0;
			
			for i = nStartIdx, nEndIdx do
				if( arydValue[i] <= dDivVal ) then
					dLessSum = dLessSum + arydValue[i];
					nDivIdx = nDivIdx + 1;
				else
					dMoreSum = dMoreSum + arydValue[i];
				end
			end
			
			local dLessMean = ( dLessSum / (nDivIdx - nStartIdx) + arydValue[nDivIdx-1] ) / 2;
			local dMoreMean = ( dMoreSum / (nEndIdx - nDivIdx + 1) + arydValue[nDivIdx] ) / 2;
			local dLessProb = ( dMoreMean - dDivVal ) / ( dMoreMean - dLessMean );
			local dMoreProb = 1 - dLessProb;
	
			for i = nStartIdx, nDivIdx - 1 do
				arydProb[i] = arydProb[i] * dLessProb;
			end
			for i = nDivIdx, nEndIdx do
				arydProb[i] = arydProb[i] * dMoreProb;
			end
	
			if( nStartIdx < nDivIdx - 1 ) then
				calcProbLoop( arydValue, arydProb, nStartIdx, nDivIdx - 1, dLessMean );
			end
			if( nDivIdx < nEndIdx ) then
				calcProbLoop( arydValue, arydProb, nDivIdx, nEndIdx, dMoreMean );
			end
		end
	end
	
	----------------------------------------------------------------------------------------------------------------------------
	-- ���ܣ���ֵ������ת�ƺ������汾2��2006.9.16����
	--       ֻ�ڴ��������Ŀ����Ʒ�����м�ֵ��ΪԴ��Ʒ��ֵ���ߵ�2����4����Ʒ�м�����ѡĿ����Ʒ
	
	--       [����Ʒ��ֵ��������ϵ]��
	--       arydLowVal[1] <= arydLowVal[2] <  ��dSrcItemVal��  <= arydHiVal[1] <= arydHiVal[2]
	
	--       [���㺯��]��
	--       dSrcItemVal = dLowProb * (arydLowVal[1] * (1 - LOW_NEAR_PERCENT) + arydLowVal[2] * LOW_NEAR_PERCENT) + 
	--                     dHiProb * (arydHiVal[1] * HI_NEAR_PERCENT + arydHiVal[2] * (1 - HI_NEAR_PERCENT))
	--       dLowProb + dHiProb = 1
	
	--       [��Ŀ����Ʒ���ʽ��]��
	--       arydLowProb[1]	=	dLowProb * (1 - LOW_NEAR_PERCENT)
	--       arydLowProb[2]	=	dLowProb * LOW_NEAR_PERCENT
	--       arydHiProb[1]	=	dHiProb * HI_NEAR_PERCENT
	--       arydHiProb[2]	=	dHiProb * (1 - HI_NEAR_PERCENT)
	
	LOW_NEAR_PERCENT	= 0.95;		-- Դ��Ʒ��ֵ����1����Ʒ��ռ����
	HI_NEAR_PERCENT		= 0.95;		-- Դ��Ʒ��ֵ����1����Ʒ��ռ����
	
	function _transItemValImpl_2(dSrcItemVal, arydDesItemValSort, arydDesItemProbSort)
		-- ��Ŀ����Ʒ�м�ֵ�� > Դ��Ʒ��ֵ������͵�һ��Ŀ����Ʒ����
		local nSrcItemValIdx = 0;
		for i = 1, getn(arydDesItemValSort) do
			if (arydDesItemValSort[i] > dSrcItemVal) then
				nSrcItemValIdx = i;
				break;
			end
		end
		
		-- Դ��Ʒ��ֵ�� >= ���е���Ŀ����Ʒ�ļ�ֵ������100%ѡ����߼�ֵ����Ŀ����Ʒ
		if (nSrcItemValIdx == 0) then
			arydDesItemProbSort[getn(arydDesItemValSort)] = 1;
			return
		end
		-- Դ��Ʒ��ֵ�� < ���е���Ŀ����Ʒ�ļ�ֵ������ѡ�����κ�Ŀ����Ʒ������Ŀ����Ʒ���ʶ�����0%
		if (nSrcItemValIdx == 1) then
			return
		end
		
		-- �����2��Ŀ����Ʒ��ֵ�����ֵ
		local dLowValSum = 0;
		if (nSrcItemValIdx > 2) then
			dLowValSum = arydDesItemValSort[nSrcItemValIdx - 1] * LOW_NEAR_PERCENT + 
						 arydDesItemValSort[nSrcItemValIdx - 2] * (1 - LOW_NEAR_PERCENT);
		else
			dLowValSum = arydDesItemValSort[1];
		end
		-- �����2��Ŀ����Ʒ��ֵ�����ֵ
		local dHiValSum = 0;
		if (nSrcItemValIdx < getn(arydDesItemValSort)) then
			dHiValSum = arydDesItemValSort[nSrcItemValIdx] * HI_NEAR_PERCENT +
						arydDesItemValSort[nSrcItemValIdx + 1] * (1 - HI_NEAR_PERCENT);
		else
			dHiValSum = arydDesItemValSort[getn(arydDesItemValSort)];
		end
		
		-- �����2��Ŀ����Ʒ���ʺ�
		local dLowProb = (dHiValSum - dSrcItemVal) / (dHiValSum - dLowValSum);
		-- �����2��Ŀ����Ʒ���ʺ�
		local dHiProb = 1 - dLowProb;
		
		-- �����2��Ŀ����Ʒ�����ո���
		if (nSrcItemValIdx > 2) then
			arydDesItemProbSort[nSrcItemValIdx - 1] = dLowProb * LOW_NEAR_PERCENT;
			arydDesItemProbSort[nSrcItemValIdx - 2] = dLowProb * (1 - LOW_NEAR_PERCENT);
		else
			arydDesItemProbSort[1] = dLowProb;
		end
		-- �����2��Ŀ����Ʒ�����ո���
		if (nSrcItemValIdx < getn(arydDesItemValSort)) then
			arydDesItemProbSort[nSrcItemValIdx] = dHiProb * HI_NEAR_PERCENT;
			arydDesItemProbSort[nSrcItemValIdx + 1] = dHiProb * (1 - HI_NEAR_PERCENT);
		else
			arydDesItemProbSort[getn(arydDesItemValSort)] = dHiProb;
		end		
	end
	
	----------------------------------------------------------------------------------------------------------------------------

-- ʹ�ð汾2�ļ�ֵ������ת�ƺ���
transItemValImpl = _transItemValImpl_2;

--------------------------------------------------------------------------------------------------------------------------------

-- ��������
function inssort( aryNumber, nStartIdx, nEndIdx )
	if( nStartIdx >= nEndIdx ) then
		return
	end
	for i = nStartIdx + 1, nEndIdx do
		for j = i, nStartIdx + 1, -1 do
			if( aryNumber[j] < aryNumber[j-1] ) then
				aryNumber[j-1], aryNumber[j] = aryNumber[j], aryNumber[j-1];
			end
		end
	end
end