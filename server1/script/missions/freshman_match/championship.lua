Include("\\script\\missions\\freshman_match\\tryout\\head.lua")
function main()
	if ( not validateDate( CP_UPTO_TRYOUT,CP_END_TRYOUT ) ) then
		return
	end
	orgworld = SubWorld
	for i = 1, getn( CP_MAPTAB ) do
		mapid = CP_MAPTAB[ i ][ 1 ]
		mapindex = SubWorldID2Idx( mapid )
		if ( mapindex < 0 ) then
			print( "ANNOUNCE: Khu v�c thi ��u ki�t xu�t"..CP_MAPTAB[i][3].."Kh�ng c� tr�n sever, ", mapid );
		else
			SubWorld = mapindex
			if( GetMissionV( MS_STATE ) > 0 ) then
				return
			end
			OpenMission(MISSIONID)
			str = date( "%mth�ng%dng�y" ).."c�a V� l�m"..CP_MAPTAB[ i ][ 3 ].."Thi ��u ki�t xu�t m�n ph�i �� b�t ��u, ng��i ch�i mu�n b�o danh tham gia thi ��u h�y ��n L�m An ��i tho�i v�i S� gi� ki�t xu�t. �i�u ki�n b�o danh: ��ng c�p t� c�p 50 ��n c�p 90, s� l�n tham gia thi ��u �t h�n 40."
			WriteLog(date( "%Yn�m%mth�ng%dng�y%Hgi�%Mph�t:" ).."V� L�m"..CP_MAPTAB[ i ][ 3 ].."Thi ��u ki�t xu�t m�n ph�i �� b�t ��u!" )
			AddGlobalCountNews( str, 1 )
			SetMissionV( MS_STATE, 1 )
			SetMissionV( MS_ROUND, 1 )
		end
	end
	SubWorld = orgworld
end