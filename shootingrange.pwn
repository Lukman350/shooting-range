#include <a_samp>
#include <crashdetect>
#include <zcmd>
#include <sscanf2>

new targ1[8];
new targ2[8];
new targ3[8];

new Float:speed[3];

new LoopStatus[3] = 0;

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" Targets system - Private200 ");
	print("--------------------------------------\n");
	return 1;
}

CMD:createtarget(playerid, params[])
{
	new id;
	if(sscanf(params, "d", id)) return SendClientMessage(playerid, -1, "{FF0000}{SYNTAX ERROR}: {FFFFFF}/createtarget [id]");
	if(id > 3 && id <= 0) return SendClientMessage(playerid, -1, "{FF0000}{ERROR}: {FFFFFF}ID must be between 1 and 3. MAX TARGETS: three");
	if(id == 1)
	{
		for(new i; i < sizeof targ1; i ++) if(IsValidObject(targ1[i])) return SendClientMessage(playerid, -1, "{FF0000}{ERROR}: {FFFFFF}One of the body parts has not been destroyed for this target. /destoytarget [id] to re-create them after.");

	    targ1[0] = CreateObject(3024, 292.87509, -138.10300, 1007.14838,   0.00000, 0.00000, 90.00000);
		targ1[1] = CreateObject(3023, 292.87289, -138.12180, 1007.15472,   0.00000, 0.00000, 90.00000);
		targ1[2] = CreateObject(3022, 292.87561, -138.09450, 1007.15472,   0.00000, 0.00000, 90.00000);
		targ1[3] = CreateObject(3021, 292.87598, -138.11237, 1007.14551,   0.00000, 0.00000, 90.00000);
		targ1[4] = CreateObject(3020, 292.87411, -138.12750, 1007.16388,   0.00000, 0.00000, 90.00000);
		targ1[5] = CreateObject(3019, 292.87280, -138.12511, 1007.16541,   0.00000, 0.00000, 90.00000);
		targ1[6] = CreateObject(3018, 292.87280, -138.10190, 1007.16541,   0.00000, 0.00000, 90.00000);
		LoopStatus[0] = 0;
	}
	else if(id == 2)
	{
	    for(new i; i < sizeof targ2; i ++) if(IsValidObject(targ2[i])) return SendClientMessage(playerid, -1, "{FF0000}{ERROR}: {FFFFFF}One of the body parts has not been destroyed for this target. /destoytarget [id] to re-create them after.");
        targ2[0] = CreateObject(3019, 285.00000, -130.88310, 1007.16541,   0.00000, 0.00000, 90.00000);
		targ2[1] = CreateObject(3020, 285.00000, -130.88550, 1007.16388,   0.00000, 0.00000, 90.00000);
		targ2[2] = CreateObject(3021, 285.00000, -130.87041, 1007.14551,   0.00000, 0.00000, 89.76000);
		targ2[3] = CreateObject(3018, 285.00000, -130.85989, 1007.16541,   0.00000, 0.00000, 90.00000);
		targ2[4] = CreateObject(3023, 285.10001, -130.87981, 1007.15472,   0.00000, 0.00000, 90.00000);
		targ2[5] = CreateObject(3024, 285.00000, -130.86099, 1007.14838,   0.00000, 0.00000, 90.00000);
		targ2[6] = CreateObject(3022, 285.10001, -130.85249, 1007.15472,   0.00000, 0.00000, 90.00000);
		LoopStatus[1] = 0;
	}
	else if(id == 3)
	{
	    for(new i; i < sizeof targ3; i ++) if(IsValidObject(targ3[i])) return SendClientMessage(playerid, -1, "{FF0000}{ERROR}: {FFFFFF}One of the body parts has not been destroyed for this target. /destoytarget [id] to re-create them after.");
        targ3[0] = CreateObject(3024, 288.00000, -138.10300, 1007.14838,   0.00000, 0.00000, 90.00000);
		targ3[1] = CreateObject(3023, 288.00000, -138.12180, 1007.15472,   0.00000, 0.00000, 90.00000);
		targ3[2] = CreateObject(3022, 288.00000, -138.09450, 1007.15472,   0.00000, 0.00000, 90.00000);
		targ3[3] = CreateObject(3021, 288.00000, -138.11240, 1007.14551,   0.00000, 0.00000, 89.76000);
		targ3[4] = CreateObject(3020, 288.00000, -138.12750, 1007.16388,   0.00000, 0.00000, 90.00000);
		targ3[5] = CreateObject(3019, 288.00000, -138.12511, 1007.16541,   0.00000, 0.00000, 90.00000);
		targ3[6] = CreateObject(3018, 288.00000, -138.10190, 1007.16541,   0.00000, 0.00000, 90.00000);
		LoopStatus[2] = 0;
	}
	return 1;
}

CMD:destroytarget(playerid, params[])
{
	new id, destroyed;
	if(sscanf(params, "d", id)) return SendClientMessage(playerid, -1, "{FF0000}{SYNTAX ERROR}: {FFFFFF}/destroytarget [id]");
	if(id > 3 && id <= 0) return SendClientMessage(playerid, -1, "{FF0000}{ERROR}: {FFFFFF}ID must be between 1 and 3. MAX TARGETS: three");
	if(id == 1)
	{
	    for(new i; i < sizeof targ1; i++)
	    {
            destroyed++;
            DestroyObject(targ1[i]);
            LoopStatus[0] = 0;
		}
	}
	else if(id == 2)
	{
	    for(new i; i < sizeof targ2; i++)
	    {
            destroyed++;
            DestroyObject(targ2[i]);
            LoopStatus[1] = 0;
		}
	}
	else if(id == 3)
	{
	    for(new i; i < sizeof targ3; i++)
	    {
            destroyed++;
            DestroyObject(targ3[i]);
            LoopStatus[2] = 0;
		}
	}
	new string[128];
	format(string, sizeof string, "%d objects have been deleted from target no#%d;", destroyed, id);
	SendClientMessage(playerid, -1, string);
	return 1;
}

CMD:movetarget(playerid, params[])
{
    new id, Float:speedx;
	if(sscanf(params, "df", id, speedx)) return SendClientMessage(playerid, -1, "{FF0000}{SYNTAX ERROR}: {FFFFFF}/movetarget [id] [speed]");
	if(id > 3 && id <= 0) return SendClientMessage(playerid, -1, "{FF0000}{ERROR}: {FFFFFF}ID must be between 1 and 3. MAX TARGETS: three");
	if(id == 1)
	{
	    if(LoopStatus[0] == 0)
	    {
        	MoveObject(targ1[0], 292.87509, -130.86099, 1007.14838, speedx, 0.00000, 0.00000, 90.00000);
			MoveObject(targ1[1], 292.87289, -130.87981, 1007.15472, speedx, 0.00000, 0.00000, 90.00000);
        	MoveObject(targ1[2], 292.87561, -130.85249, 1007.15472, speedx, 0.00000, 0.00000, 90.00000);
        	MoveObject(targ1[3], 292.87601, -130.87041, 1007.14551, speedx, 0.00000, 0.00000, 90.00000);
        	MoveObject(targ1[4], 292.87411, -130.88550, 1007.16388, speedx, 0.00000, 0.00000, 90.00000);
        	MoveObject(targ1[5], 292.87280, -130.88310, 1007.16541, speedx, 0.00000, 0.00000, 90.00000);
        	MoveObject(targ1[6], 292.87280, -130.85989, 1007.16541, speedx, 0.00000, 0.00000, 90.00000);
	        LoopStatus[0] = 1;
	        speed[0] = speedx;
		}
  		else SendClientMessage(playerid, -1, "{FF0000}{ERROR}: {FFFFFF}The target is already in movement. Destroy them and create them again OR wait for them to stop moving.");
	}
	else if(id == 2)
	{
	    if(LoopStatus[1] == 0)
	    {
			MoveObject(targ2[0], 285.00000, -138.12511, 1007.16541, speedx, 0.00000, 0.00000, 90.00000);
	        MoveObject(targ2[1], 285.00000, -138.12750, 1007.16388, speedx, 0.00000, 0.00000, 90.00000);
		    MoveObject(targ2[2], 285.00000, -138.11240, 1007.14551, speedx, 0.00000, 0.00000, 90.00000);
		    MoveObject(targ2[3], 285.00000, -138.10190, 1007.16541, speedx, 0.00000, 0.00000, 90.00000);
		    MoveObject(targ2[4], 285.00000, -138.12180, 1007.15472, speedx, 0.00000, 0.00000, 90.00000);
		    MoveObject(targ2[5], 285.00000, -138.10300, 1007.14838, speedx, 0.00000, 0.00000, 90.00000);
		    MoveObject(targ2[6], 285.00000, -138.09450, 1007.15472, speedx, 0.00000, 0.00000, 90.00000);
	        LoopStatus[1] = 1;
	        speed[1] = speedx;
		}
		else SendClientMessage(playerid, -1, "{FF0000}{ERROR}: {FFFFFF}The target is already in movement. Destroy them and create them again OR wait for them to stop moving.");
	}
	else if(id == 3)
	{
	    if(LoopStatus[2] == 0)
	    {
			MoveObject(targ3[0], 288.00000, -130.86099, 1007.14838, speedx, 0.00000, 0.00000, 90.00000);
        	MoveObject(targ3[1], 288.00000, -130.89430, 1007.15472, speedx, 0.00000, 0.00000, 90.00000);
        	MoveObject(targ3[2], 288.00000, -130.85249, 1007.15472, speedx, 0.00000, 0.00000, 90.00000);
        	MoveObject(targ3[3], 288.00000, -130.87041, 1007.14551, speedx, 0.00000, 0.00000, 90.00000);
        	MoveObject(targ3[4], 288.00000, -130.88550, 1007.16388, speedx, 0.00000, 0.00000, 90.00000);
        	MoveObject(targ3[5], 288.00000, -130.88310, 1007.16541, speedx, 0.00000, 0.00000, 90.00000);
        	MoveObject(targ3[6], 288.00000, -130.85989, 1007.165412, speedx, 0.00000, 0.00000, 90.00000);
	        LoopStatus[2] = 1;
	        speed[2] = speedx;
		}
		else SendClientMessage(playerid, -1, "{FF0000}{ERROR}: {FFFFFF}The target is already in movement. Destroy them and create them again OR wait for them to stop moving.");
	}
	return 1;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
    if(hittype == 3)
    {
        if(hitid == targ1[0]) DestroyObject(targ1[0]), targ1[0] = 0;
		if(hitid == targ1[1]) DestroyObject(targ1[1]), targ1[1] = 0;
		if(hitid == targ1[2]) DestroyObject(targ1[2]), targ1[2] = 0;
		if(hitid == targ1[3]) DestroyObject(targ1[3]), targ1[3] = 0;
	 	if(hitid == targ1[4]) DestroyObject(targ1[4]), targ1[4] = 0;
		if(hitid == targ1[5]) DestroyObject(targ1[5]), targ1[5] = 0;
		if(hitid == targ1[6]) DestroyObject(targ1[6]), targ1[6] = 0;
		if(hitid == targ2[0]) DestroyObject(targ2[0]), targ2[0] = 0;
		if(hitid == targ2[1]) DestroyObject(targ2[1]), targ2[1] = 0;
		if(hitid == targ2[2]) DestroyObject(targ2[2]), targ2[2] = 0;
		if(hitid == targ2[3]) DestroyObject(targ2[3]), targ2[3] = 0;
		if(hitid == targ2[4]) DestroyObject(targ2[4]), targ2[4] = 0;
		if(hitid == targ2[5]) DestroyObject(targ2[5]), targ2[5] = 0;
		if(hitid == targ2[6]) DestroyObject(targ2[6]), targ2[6] = 0;
		if(hitid == targ3[0]) DestroyObject(targ3[0]), targ3[0] = 0;
		if(hitid == targ3[1]) DestroyObject(targ3[1]), targ3[1] = 0;
		if(hitid == targ3[2]) DestroyObject(targ3[2]), targ3[2] = 0;
		if(hitid == targ3[3]) DestroyObject(targ3[3]), targ3[3] = 0;
		if(hitid == targ3[4]) DestroyObject(targ3[4]), targ3[4] = 0;
		if(hitid == targ3[5]) DestroyObject(targ3[5]), targ3[5] = 0;
		if(hitid == targ3[6]) DestroyObject(targ3[6]), targ3[6] = 0;
	}
    return 1;
}

public OnObjectMoved(objectid)
{
	if(LoopStatus[0] == 1)
	{
	    if(objectid == targ1[0] || objectid == targ1[1] || objectid == targ1[2] || objectid == targ1[3] || objectid == targ1[4] || objectid == targ1[5] || objectid == targ1[6])
	    {
	        MoveObject(targ1[0], 292.87509, -138.10300, 1007.14838,speed[0], 0.00000, 0.00000, 90.00000);
	        MoveObject(targ1[1], 292.87289, -138.12180, 1007.15472,speed[0], 0.00000, 0.00000, 90.00000);
			MoveObject(targ1[2], 292.87561, -138.09450, 1007.15472,speed[0], 0.00000, 0.00000, 90.00000);
			MoveObject(targ1[3], 292.87598, -138.11237, 1007.14551,speed[0], 0.00000, 0.00000, 90.00000);
			MoveObject(targ1[4], 292.87411, -138.12750, 1007.16388,speed[0], 0.00000, 0.00000, 90.00000);
			MoveObject(targ1[5], 292.87280, -138.12511, 1007.16541, speed[0], 0.00000, 0.00000, 90.00000);
			MoveObject(targ1[6], 292.87280, -138.10190, 1007.16541, speed[0], 0.00000, 0.00000, 90.00000);
			LoopStatus[0] = -1;
		}
	}
	else if(LoopStatus[0] == -1)
	{
	    if(objectid == targ1[0] || objectid == targ1[1] || objectid == targ1[2] || objectid == targ1[3] || objectid == targ1[4] || objectid == targ1[5] || objectid == targ1[6])
	    {
		    MoveObject(targ1[0], 292.87509, -130.86099, 1007.14838, speed[0], 0.00000, 0.00000, 90.00000);
			MoveObject(targ1[1], 292.87289, -130.87981, 1007.15472, speed[0], 0.00000, 0.00000, 90.00000);
	    	MoveObject(targ1[2], 292.87561, -130.85249, 1007.15472, speed[0], 0.00000, 0.00000, 90.00000);
	    	MoveObject(targ1[3], 292.87601, -130.87041, 1007.14551, speed[0], 0.00000, 0.00000, 90.00000);
	    	MoveObject(targ1[4], 292.87411, -130.88550, 1007.16388, speed[0], 0.00000, 0.00000, 90.00000);
	    	MoveObject(targ1[5], 292.87280, -130.88310, 1007.16541, speed[0], 0.00000, 0.00000, 90.00000);
	    	MoveObject(targ1[6], 292.87280, -130.85989, 1007.16541, speed[0], 0.00000, 0.00000, 90.00000);
		    LoopStatus[0] = 1;
		}
		
	}
	if(LoopStatus[1] == 1)
	{
	    if(objectid == targ2[0] || objectid == targ2[1] || objectid == targ2[2] || objectid == targ2[3] || objectid == targ2[4] || objectid == targ2[5] || objectid == targ2[6])
	    {
	        MoveObject(targ2[0], 285.00000, -130.88310, 1007.16541, speed[1], 0.00000, 0.00000, 90.00000);
	        MoveObject(targ2[1], 285.00000, -130.88550, 1007.16388,speed[1], 0.00000, 0.00000, 90.00000);
			MoveObject(targ2[2], 285.00000, -130.87041, 1007.14551,speed[1], 0.00000, 0.00000, 90.00000);
			MoveObject(targ2[3], 285.00000, -130.85989, 1007.16541,speed[1], 0.00000, 0.00000, 90.00000);
			MoveObject(targ2[4], 285.10001, -130.87981, 1007.15472,speed[1], 0.00000, 0.00000, 90.00000);
			MoveObject(targ2[5], 285.00000, -130.86099, 1007.14838,speed[1], 0.00000, 0.00000, 90.00000);
			MoveObject(targ2[6], 285.10001, -130.85249, 1007.15472,speed[1], 0.00000, 0.00000, 90.00000);
			LoopStatus[1] = -1;
		}
	}
	else if(LoopStatus[1] == -1)
	{
	    if(objectid == targ2[0] || objectid == targ2[1] || objectid == targ2[2] || objectid == targ2[3] || objectid == targ2[4] || objectid == targ2[5] || objectid == targ2[6])
	    {
		    MoveObject(targ2[0], 285.00000, -138.12511, 1007.16541, speed[1], 0.00000, 0.00000, 90.00000);
	        MoveObject(targ2[1], 285.00000, -138.12750, 1007.16388, speed[1], 0.00000, 0.00000, 90.00000);
		    MoveObject(targ2[2], 285.00000, -138.11240, 1007.14551, speed[1], 0.00000, 0.00000, 90.00000);
		    MoveObject(targ2[3], 285.00000, -138.10190, 1007.16541, speed[1], 0.00000, 0.00000, 90.00000);
		    MoveObject(targ2[4], 285.00000, -138.12180, 1007.15472, speed[1], 0.00000, 0.00000, 90.00000);
		    MoveObject(targ2[5], 285.00000, -138.10300, 1007.14838, speed[1], 0.00000, 0.00000, 90.00000);
		    MoveObject(targ2[6], 285.00000, -138.09450, 1007.15472, speed[1], 0.00000, 0.00000, 90.00000);
	        LoopStatus[1] = 1;
		}
	}
	if(LoopStatus[2] == 1)
	{
	    if(objectid == targ3[0] || objectid == targ3[1] || objectid == targ3[2] || objectid == targ3[3] || objectid == targ3[4] || objectid == targ3[5] || objectid == targ3[6])
	    {
	        MoveObject(targ3[0], 288.00000, -138.10300, 1007.14838, speed[2], 0.00000, 0.00000, 90.00000);
	        MoveObject(targ3[1], 288.00000, -138.12180, 1007.15472,speed[2], 0.00000, 0.00000, 90.00000);
			MoveObject(targ3[2], 288.00000, -138.09450, 1007.15472,speed[2], 0.00000, 0.00000, 90.00000);
			MoveObject(targ3[3], 288.00000, -138.11240, 1007.14551,speed[2], 0.00000, 0.00000, 90.00000);
			MoveObject(targ3[4], 288.00000, -138.12750, 1007.16388,speed[2], 0.00000, 0.00000, 90.00000);
			MoveObject(targ3[5], 288.00000, -138.12511, 1007.16541,speed[2], 0.00000, 0.00000, 90.00000);
			MoveObject(targ3[6], 288.00000, -138.10190, 1007.16541,speed[2], 0.00000, 0.00000, 90.00000);
			LoopStatus[2] = -1;
		}
	}
	else if(LoopStatus[2] == -1)
	{
	    if(objectid == targ3[0] || objectid == targ3[1] || objectid == targ3[2] || objectid == targ3[3] || objectid == targ3[4] || objectid == targ3[5] || objectid == targ3[6])
	    {
		    MoveObject(targ3[0], 288.00000, -130.86099, 1007.14838, speed[2], 0.00000, 0.00000, 90.00000);
	    	MoveObject(targ3[1], 288.00000, -130.89430, 1007.15472, speed[2], 0.00000, 0.00000, 90.00000);
	    	MoveObject(targ3[2], 288.00000, -130.85249, 1007.15472, speed[2], 0.00000, 0.00000, 90.00000);
	    	MoveObject(targ3[3], 288.00000, -130.87041, 1007.14551, speed[2], 0.00000, 0.00000, 90.00000);
	    	MoveObject(targ3[4], 288.00000, -130.88550, 1007.16388, speed[2], 0.00000, 0.00000, 90.00000);
	    	MoveObject(targ3[5], 288.00000, -130.88310, 1007.16541, speed[2], 0.00000, 0.00000, 90.00000);
	    	MoveObject(targ3[6], 288.00000, -130.85989, 1007.165412, speed[2], 0.00000, 0.00000, 90.00000);
	        LoopStatus[2] = 1;
        }
	}
	return 1;
}

CMD:god(playerid)
{
	SetPlayerHealth(playerid, 10000);
	SetPlayerArmour(playerid, 10000);
	return 1;
}

CMD:ready(playerid)
{
	GivePlayerWeapon(playerid, 24, 100);
	GivePlayerWeapon(playerid, 30, 100);
	SetPlayerPos(playerid, 302.292877,-143.139099,1004.062500);
	SetPlayerInterior(playerid, 7);
	return 1;
}