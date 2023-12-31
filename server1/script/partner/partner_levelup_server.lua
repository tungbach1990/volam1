IncludeLib("PARTNER");

FEATURE_PERIOD = {1, 60, 100};			-- 1级：1期面貌，	60级：2期面貌，	100级：3期面貌

function main(nPartnerIdx, nPartnerLevel)
	-- 		do 
	-- 	return Talk(1, "", "Ch鴆 n╪g ch璦 m�!")
	-- end
	
	local nPartnerSeries = PARTNER_GetSeries(nPartnerIdx)					 --获得同伴的五行
	
	if ( nPartnerLevel == 30 and nPartnerSeries == 0 ) then
		PARTNER_AddSkill( nPartnerIdx , 1 , 555 , 1, 0 ) 
		
	elseif ( nPartnerLevel == 60 and nPartnerSeries == 0 ) then
		PARTNER_AddSkill( nPartnerIdx , 1 , 556 , 1, 0 )
		
	elseif ( nPartnerLevel == 80 and nPartnerSeries == 0 ) then
		PARTNER_AddSkill( nPartnerIdx , 1 , 557 , 1, 0 )
		 
	elseif ( nPartnerLevel == 30 and nPartnerSeries == 1 ) then
		PARTNER_AddSkill( nPartnerIdx , 1 , 561 , 1, 0 )
		
	elseif ( nPartnerLevel == 60 and nPartnerSeries == 1 ) then
		PARTNER_AddSkill( nPartnerIdx , 1 , 562 , 1, 0 )
		
	elseif ( nPartnerLevel == 80 and nPartnerSeries == 1 ) then
		PARTNER_AddSkill( nPartnerIdx , 1 , 563 , 1, 0 )
		
	elseif ( nPartnerLevel == 30 and nPartnerSeries == 2 ) then
		PARTNER_AddSkill( nPartnerIdx , 1 , 567 , 1, 0 )
		 
	elseif ( nPartnerLevel == 60 and nPartnerSeries == 2 ) then
		PARTNER_AddSkill( nPartnerIdx , 1 , 568 , 1, 0 )
		
	elseif ( nPartnerLevel == 80 and nPartnerSeries == 2 ) then
		PARTNER_AddSkill( nPartnerIdx , 1 , 569 , 1, 0 )
		
	elseif ( nPartnerLevel == 30 and nPartnerSeries == 3 ) then
		PARTNER_AddSkill( nPartnerIdx , 1 , 573 , 1, 0 )
		
	elseif ( nPartnerLevel == 60 and nPartnerSeries == 3 ) then
		PARTNER_AddSkill( nPartnerIdx , 1 , 574 , 1, 0 )
		
	elseif ( nPartnerLevel == 80 and nPartnerSeries == 3 ) then
		PARTNER_AddSkill( nPartnerIdx , 1 , 575 , 1, 0 )
		
	elseif ( nPartnerLevel == 30 and nPartnerSeries == 4 ) then
		PARTNER_AddSkill( nPartnerIdx , 1 , 579 , 1, 0 )
		
	elseif ( nPartnerLevel == 60 and nPartnerSeries == 4 ) then
		PARTNER_AddSkill( nPartnerIdx , 1 , 581 , 1, 0 )
		
	elseif ( nPartnerLevel == 80 and nPartnerSeries == 4 ) then
		PARTNER_AddSkill( nPartnerIdx , 1 , 580 , 1, 0 )
	end
	
	if ( nPartnerLevel == 10 or nPartnerLevel == 30 or nPartnerLevel == 50 or nPartnerLevel == 90 ) then
		PARTNER_ReGenAttribsInc(nPartnerIdx)
	end
	
	for i = 1, getn(FEATURE_PERIOD) do
		if (nPartnerLevel == FEATURE_PERIOD[i]) then
			PARTNER_ChangeFeatureOfPeriod(nPartnerIdx, i);
			break
		end
	end
end