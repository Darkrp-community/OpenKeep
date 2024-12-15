//#define LOWMEMORYMODE //uncomment this to load centcom and roguetest and thats it.

#include "map_files\generic\CentCom.dmm"

#ifndef LOWMEMORYMODE
	#ifdef ALL_MAPS
		#include "map_files\roguetown\roguetown.dmm"
		#include "map_files\roguetest\roguetest.dmm"
		#include "map_files\dakkatown\dakkatown.dmm"
		#include "map_files\dun_manor\dun_manor.dmm"
		#include "map_files\Roguetown\otherz\roguehamlet.dmm"

		#ifdef CIBUILDING
			#include "templates.dm"
		#endif
	#endif
#endif