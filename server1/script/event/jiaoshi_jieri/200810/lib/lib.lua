function jiaoshi0810_TransferDigit2CnNum(nDigit)
	local tbModelUnit = {
		[1]	= "",
		[2]	= " v�n",
		[3] = " tr�m tri�u", 	
	};
	
	local nDigitTmp = nDigit;	-- ��ʱ����,
	local n4LenNum	= 0;		-- ÿһ�ζ�nDigitȡ4λ����,n4LenNum��ʾȡ����������ֵ
	local nPreNum	= 0;		-- ��¼ǰһ�ν���ȡ4λ������n4LenNum��ֵ
	local szCnNum	= "";		-- ������Ҫ��Ľ��
	local szNumTmp	= "";		-- ��ʱ����,ÿȡ��λ�Ĳ����еõ�����������
	
	if (nDigit == 0) then
		szCnNum = "0";
		return szCnNum;
	end

	if (nDigit < 0) then
		nDigitTmp = -nDigit;
	end
	
	-- �ֱ�Ӹ�,��,�����ο���,��ΪnDigit��ֵС��1����,����ÿһ�ζ�������4λ
	for i = 1, getn(tbModelUnit) do
		szNumTmp	= "";
		n4LenNum	= mod(nDigitTmp , 10000);
		if (n4LenNum ~= 0) then
			--szNumTmp = transfer4LenDigit2CnNum(n4LenNum);					-- �õ�����λ�����ı��ʽ
			szNumTmp = n4LenNum
			szNumTmp = szNumTmp..tbModelUnit[i];								-- ���ϵ�λ
		end
		szCnNum	= szNumTmp..szCnNum;
		
		nPreNum	= n4LenNum;
		nDigitTmp = floor(nDigitTmp / 10000);
		if (nDigitTmp == 0) then
			break;
		end
	end
	if (nDigit < 0) then
		szCnNum = "-"..szCnNum;
	end
	return szCnNum;
end