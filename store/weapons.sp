#if defined STANDALONE_BUILD
#include <sourcemod>
#include <sdktools>
#include <tf2items>
#include <tf2_stocks>
#include <clientprefs>

#include <store>
#include <zephstocks>
#endif

enum S_Weapon
{
	String:W_Name[64],
	String:W_Att[PLATFORM_MAX_PATH],
	W_Index
}

new g_Weapons_Scout_Primary[16][S_Weapon];
new g_Weapons_Scout_Secondary[16][S_Weapon];
new g_Weapons_Scout_Melee[16][S_Weapon];

new g_Weapons_Soldier_Primary[16][S_Weapon];
new g_Weapons_Soldier_Secondary[16][S_Weapon];
new g_Weapons_Soldier_Melee[16][S_Weapon];

new g_Weapons_Pyro_Primary[16][S_Weapon];
new g_Weapons_Pyro_Secondary[16][S_Weapon];
new g_Weapons_Pyro_Melee[16][S_Weapon];

new g_Weapons_DemoMan_Primary[16][S_Weapon];
new g_Weapons_DemoMan_Secondary[16][S_Weapon];
new g_Weapons_DemoMan_Melee[16][S_Weapon];

new g_Weapons_Heavy_Primary[16][S_Weapon];
new g_Weapons_Heavy_Secondary[16][S_Weapon];
new g_Weapons_Heavy_Melee[16][S_Weapon];

new g_Weapons_Engineer_Primary[16][S_Weapon];
new g_Weapons_Engineer_Secondary[16][S_Weapon];
new g_Weapons_Engineer_Melee[16][S_Weapon];

new g_Weapons_Medic_Primary[16][S_Weapon];
new g_Weapons_Medic_Secondary[16][S_Weapon];
new g_Weapons_Medic_Melee[16][S_Weapon];

new g_Weapons_Sniper_Primary[16][S_Weapon];
new g_Weapons_Sniper_Secondary[16][S_Weapon];
new g_Weapons_Sniper_Melee[16][S_Weapon];

new g_Weapons_Spy_Primary[16][S_Weapon];
new g_Weapons_Spy_Secondary[16][S_Weapon];
new g_Weapons_Spy_Melee[16][S_Weapon];

new i_Weapons_Scout_Primary = 0;
new i_Weapons_Scout_Secondary = 0;
new i_Weapons_Scout_Melee = 0;

new i_Weapons_Soldier_Primary = 0;
new i_Weapons_Soldier_Secondary = 0;
new i_Weapons_Soldier_Melee = 0;

new i_Weapons_Pyro_Primary = 0;
new i_Weapons_Pyro_Secondary = 0;
new i_Weapons_Pyro_Melee = 0;

new i_Weapons_DemoMan_Primary = 0;
new i_Weapons_DemoMan_Secondary = 0;
new i_Weapons_DemoMan_Melee = 0;

new i_Weapons_Heavy_Primary = 0;
new i_Weapons_Heavy_Secondary = 0;
new i_Weapons_Heavy_Melee = 0;

new i_Weapons_Engineer_Primary = 0;
new i_Weapons_Engineer_Secondary = 0;
new i_Weapons_Engineer_Melee = 0;

new i_Weapons_Medic_Primary = 0;
new i_Weapons_Medic_Secondary = 0;
new i_Weapons_Medic_Melee = 0;

new i_Weapons_Sniper_Primary = 0;
new i_Weapons_Sniper_Secondary = 0;
new i_Weapons_Sniper_Melee = 0;

new i_Weapons_Spy_Primary = 0;
new i_Weapons_Spy_Secondary = 0;
new i_Weapons_Spy_Melee = 0;

#if defined STANDALONE_BUILD
public OnPluginStart()
#else
public Weapons_OnPluginStart()
#endif
{
	Store_RegisterHandler("w_scout_p_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_Scout_Primary_Config, Weapons_Equip, Weapons_Remove, true);
	Store_RegisterHandler("w_scout_s_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_Scout_Secondary_Config, Weapons_Equip, Weapons_Remove, true);
	Store_RegisterHandler("w_scout_m_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_Scout_Melee_Config, Weapons_Equip, Weapons_Remove, true);
	
	Store_RegisterHandler("w_soldier_p_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_Soldier_Primary_Config, Weapons_Equip, Weapons_Remove, true);
	Store_RegisterHandler("w_soldier_s_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_Soldier_Secondary_Config, Weapons_Equip, Weapons_Remove, true);
	Store_RegisterHandler("w_soldier_m_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_Soldier_Melee_Config, Weapons_Equip, Weapons_Remove, true);
	
	Store_RegisterHandler("w_pyro_p_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_Pyro_Primary_Config, Weapons_Equip, Weapons_Remove, true);
	Store_RegisterHandler("w_pyro_s_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_Pyro_Secondary_Config, Weapons_Equip, Weapons_Remove, true);
	Store_RegisterHandler("w_pyro_m_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_Pyro_Melee_Config, Weapons_Equip, Weapons_Remove, true);
	
	Store_RegisterHandler("w_demoman_p_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_DemoManPrimary_Config, Weapons_Equip, Weapons_Remove, true);
	Store_RegisterHandler("w_demoman_s_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_DemoMan_Secondary_Config, Weapons_Equip, Weapons_Remove, true);
	Store_RegisterHandler("w_demoman_m_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_DemoMan_Melee_Config, Weapons_Equip, Weapons_Remove, true);
	
	Store_RegisterHandler("w_heavy_p_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_Heavy_Primary_Config, Weapons_Equip, Weapons_Remove, true);
	Store_RegisterHandler("w_heavy_s_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_Heavy_Secondary_Config, Weapons_Equip, Weapons_Remove, true);
	Store_RegisterHandler("w_heavy_m_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_Heavy_Melee_Config, Weapons_Equip, Weapons_Remove, true);
	
	Store_RegisterHandler("w_engineer_p_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_Engineer_Primary_Config, Weapons_Equip, Weapons_Remove, true);
	Store_RegisterHandler("w_engineer_s_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_Engineer_Secondary_Config, Weapons_Equip, Weapons_Remove, true);
	Store_RegisterHandler("w_engineer_m_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_Engineer_Melee_Config, Weapons_Equip, Weapons_Remove, true);
	
	Store_RegisterHandler("w_medic_p_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_Medic_Primary_Config, Weapons_Equip, Weapons_Remove, true);
	Store_RegisterHandler("w_medic_s_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_Medic_Secondary_Config, Weapons_Equip, Weapons_Remove, true);
	Store_RegisterHandler("w_medic_m_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_Medic_Melee_Config, Weapons_Equip, Weapons_Remove, true);
	
	Store_RegisterHandler("w_sniper_p_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_Sniper_Primary_Config, Weapons_Equip, Weapons_Remove, true);
	Store_RegisterHandler("w_sniper_s_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_Sniper_Secondary_Config, Weapons_Equip, Weapons_Remove, true);
	Store_RegisterHandler("w_sniper_m_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_Sniper_Melee_Config, Weapons_Equip, Weapons_Remove, true);
	
	Store_RegisterHandler("w_spy_p_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_Spy_Primary_Config, Weapons_Equip, Weapons_Remove, true);
	Store_RegisterHandler("w_spy_s_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_Spy_Secondary_Config, Weapons_Equip, Weapons_Remove, true);
	Store_RegisterHandler("w_spy_m_", "index", Weapons_OnMapStart, Weapons_Reset, Weapons_Spy_Melee_Config, Weapons_Equip, Weapons_Remove, true);
	
	HookEvent("post_inventory_application", Weapon_post);
}

public Weapons_OnMapStart()
{
}

public Weapons_Reset()
{
	i_Weapons_Scout_Primary = 0;
	i_Weapons_Scout_Secondary = 0;
	i_Weapons_Scout_Melee = 0;

	i_Weapons_Soldier_Primary = 0;
	i_Weapons_Soldier_Secondary = 0;
	i_Weapons_Soldier_Melee = 0;

	i_Weapons_Pyro_Primary = 0;
	i_Weapons_Pyro_Secondary = 0;
	i_Weapons_Pyro_Melee = 0;

	i_Weapons_DemoMan_Primary = 0;
	i_Weapons_DemoMan_Secondary = 0;
	i_Weapons_DemoMan_Melee = 0;

	i_Weapons_Heavy_Primary = 0;
	i_Weapons_Heavy_Secondary = 0;
	i_Weapons_Heavy_Melee = 0;

	i_Weapons_Engineer_Primary = 0;
	i_Weapons_Engineer_Secondary = 0;
	i_Weapons_Engineer_Melee = 0;

	i_Weapons_Medic_Primary = 0;
	i_Weapons_Medic_Secondary = 0;
	i_Weapons_Medic_Melee = 0;

	i_Weapons_Sniper_Primary = 0;
	i_Weapons_Sniper_Secondary = 0;
	i_Weapons_Sniper_Melee = 0;

	i_Weapons_Spy_Primary = 0;
	i_Weapons_Spy_Secondary = 0;
	i_Weapons_Spy_Melee = 0;
}
///////////////////////
public Weapons_Scout_Primary_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_Scout_Primary);
	
	KvGetString(kv, "name", g_Weapons_Scout_Primary[i_Weapons_Scout_Primary][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_Scout_Primary[i_Weapons_Scout_Primary][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_Scout_Primary[i_Weapons_Scout_Primary][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_Scout_Primary;
	return true;
}
public Weapons_Scout_Secondary_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_Scout_Secondary);
	
	KvGetString(kv, "name", g_Weapons_Scout_Secondary[i_Weapons_Scout_Secondary][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_Scout_Secondary[i_Weapons_Scout_Secondary][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_Scout_Secondary[i_Weapons_Scout_Secondary][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_Scout_Secondary;
	return true;
}
public Weapons_Scout_Melee_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_Scout_Melee);
	
	KvGetString(kv, "name", g_Weapons_Scout_Melee[i_Weapons_Scout_Melee][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_Scout_Melee[i_Weapons_Scout_Melee][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_Scout_Melee[i_Weapons_Scout_Melee][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_Scout_Melee;
	return true;
}

//////////////////////////
public Weapons_Soldier_Primary_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_Soldier_Primary);
	
	KvGetString(kv, "name", g_Weapons_Soldier_Primary[i_Weapons_Soldier_Primary][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_Soldier_Primary[i_Weapons_Soldier_Primary][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_Soldier_Primary[i_Weapons_Soldier_Primary][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_Soldier_Primary;
	return true;
}
public Weapons_Soldier_Secondary_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_Soldier_Secondary);
	
	KvGetString(kv, "name", g_Weapons_Soldier_Secondary[i_Weapons_Soldier_Secondary][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_Soldier_Secondary[i_Weapons_Soldier_Secondary][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_Soldier_Secondary[i_Weapons_Soldier_Secondary][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_Soldier_Secondary;
	return true;
}
public Weapons_Soldier_Melee_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_Soldier_Melee);
	
	KvGetString(kv, "name", g_Weapons_Soldier_Melee[i_Weapons_Soldier_Melee][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_Soldier_Melee[i_Weapons_Soldier_Melee][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_Soldier_Melee[i_Weapons_Soldier_Melee][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_Soldier_Melee;
	return true;
}

/////////////////////
public Weapons_Pyro_Primary_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_Pyro_Primary);
	
	KvGetString(kv, "name", g_Weapons_Pyro_Primary[i_Weapons_Pyro_Primary][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_Pyro_Primary[i_Weapons_Pyro_Primary][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_Pyro_Primary[i_Weapons_Pyro_Primary][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_Pyro_Primary;
	return true;
}
public Weapons_Pyro_Secondary_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_Pyro_Secondary);
	
	KvGetString(kv, "name", g_Weapons_Pyro_Primary[i_Weapons_Pyro_Secondary][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_Pyro_Primary[i_Weapons_Pyro_Secondary][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_Pyro_Primary[i_Weapons_Pyro_Secondary][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_Pyro_Secondary;
	return true;
}
public Weapons_Pyro_Melee_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_Pyro_Melee);
	
	KvGetString(kv, "name", g_Weapons_Pyro_Melee[i_Weapons_Pyro_Melee][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_Pyro_Melee[i_Weapons_Pyro_Melee][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_Pyro_Melee[i_Weapons_Pyro_Melee][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_Pyro_Melee;
	return true;
}

/////////////////////
public Weapons_DemoManPrimary_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_DemoMan_Primary);
	
	KvGetString(kv, "name", g_Weapons_DemoMan_Primary[i_Weapons_DemoMan_Primary][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_DemoMan_Primary[i_Weapons_DemoMan_Primary][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_DemoMan_Primary[i_Weapons_DemoMan_Primary][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_DemoMan_Primary;
	return true;
}
public Weapons_DemoMan_Secondary_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_DemoMan_Secondary);
	
	KvGetString(kv, "name", g_Weapons_DemoMan_Secondary[i_Weapons_DemoMan_Secondary][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_DemoMan_Secondary[i_Weapons_DemoMan_Secondary][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_DemoMan_Secondary[i_Weapons_DemoMan_Secondary][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_DemoMan_Secondary;
	return true;
}
public Weapons_DemoMan_Melee_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_DemoMan_Melee);
	
	KvGetString(kv, "name", g_Weapons_DemoMan_Melee[i_Weapons_DemoMan_Melee][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_DemoMan_Melee[i_Weapons_DemoMan_Melee][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_DemoMan_Melee[i_Weapons_DemoMan_Melee][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_DemoMan_Melee;
	return true;
}

/////////////////////
public Weapons_Heavy_Primary_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_Heavy_Primary);
	
	KvGetString(kv, "name", g_Weapons_Heavy_Primary[i_Weapons_Heavy_Primary][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_Heavy_Primary[i_Weapons_Heavy_Primary][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_Heavy_Primary[i_Weapons_Heavy_Primary][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_Heavy_Primary;
	return true;
}
public Weapons_Heavy_Secondary_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_Heavy_Secondary);
	
	KvGetString(kv, "name", g_Weapons_Heavy_Secondary[i_Weapons_Heavy_Secondary][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_Heavy_Secondary[i_Weapons_Heavy_Secondary][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_Heavy_Secondary[i_Weapons_Heavy_Secondary][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_Heavy_Secondary;
	return true;
}
public Weapons_Heavy_Melee_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_Heavy_Melee);
	
	KvGetString(kv, "name", g_Weapons_Heavy_Melee[i_Weapons_Heavy_Melee][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_Heavy_Melee[i_Weapons_Heavy_Melee][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_Heavy_Melee[i_Weapons_Heavy_Melee][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_Heavy_Melee;
	return true;
}

/////////////////////
public Weapons_Engineer_Primary_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_Engineer_Primary);
	
	KvGetString(kv, "name", g_Weapons_Engineer_Primary[i_Weapons_Engineer_Primary][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_Engineer_Primary[i_Weapons_Engineer_Primary][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_Engineer_Primary[i_Weapons_Engineer_Primary][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_Engineer_Primary;
	return true;
}
public Weapons_Engineer_Secondary_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_Engineer_Secondary);
	
	KvGetString(kv, "name", g_Weapons_Engineer_Secondary[i_Weapons_Engineer_Secondary][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_Engineer_Secondary[i_Weapons_Engineer_Secondary][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_Engineer_Secondary[i_Weapons_Engineer_Secondary][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_Engineer_Secondary;
	return true;
}
public Weapons_Engineer_Melee_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_Engineer_Melee);
	
	KvGetString(kv, "name", g_Weapons_Engineer_Melee[i_Weapons_Engineer_Melee][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_Engineer_Melee[i_Weapons_Engineer_Melee][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_Engineer_Melee[i_Weapons_Engineer_Melee][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_Engineer_Melee;
	return true;
}

/////////////////////
public Weapons_Medic_Primary_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_Medic_Primary);
	
	KvGetString(kv, "name", g_Weapons_Medic_Primary[i_Weapons_Medic_Primary][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_Medic_Primary[i_Weapons_Medic_Primary][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_Medic_Primary[i_Weapons_Medic_Primary][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_Medic_Primary;
	return true;
}
public Weapons_Medic_Secondary_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_Medic_Secondary);
	
	KvGetString(kv, "name", g_Weapons_Medic_Secondary[i_Weapons_Medic_Secondary][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_Medic_Secondary[i_Weapons_Medic_Secondary][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_Medic_Secondary[i_Weapons_Medic_Secondary][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_Medic_Secondary;
	return true;
}
public Weapons_Medic_Melee_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_Medic_Melee);
	
	KvGetString(kv, "name", g_Weapons_Medic_Melee[i_Weapons_Medic_Melee][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_Medic_Melee[i_Weapons_Medic_Melee][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_Medic_Melee[i_Weapons_Medic_Melee][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_Medic_Melee;
	return true;
}

/////////////////////
public Weapons_Sniper_Primary_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_Sniper_Primary);
	
	KvGetString(kv, "name", g_Weapons_Sniper_Primary[i_Weapons_Sniper_Primary][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_Sniper_Primary[i_Weapons_Sniper_Primary][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_Sniper_Primary[i_Weapons_Sniper_Primary][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_Sniper_Primary;
	return true;
}
public Weapons_Sniper_Secondary_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_Sniper_Secondary);
	
	KvGetString(kv, "name", g_Weapons_Sniper_Secondary[i_Weapons_Sniper_Secondary][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_Sniper_Secondary[i_Weapons_Sniper_Secondary][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_Sniper_Secondary[i_Weapons_Sniper_Secondary][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_Sniper_Secondary;
	return true;
}
public Weapons_Sniper_Melee_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_Sniper_Melee);
	
	KvGetString(kv, "name", g_Weapons_Sniper_Melee[i_Weapons_Sniper_Melee][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_Sniper_Melee[i_Weapons_Sniper_Melee][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_Sniper_Melee[i_Weapons_Sniper_Melee][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_Sniper_Melee;
	return true;
}

/////////////////////
public Weapons_Spy_Primary_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_Spy_Primary);
	
	KvGetString(kv, "name", g_Weapons_Spy_Primary[i_Weapons_Spy_Primary][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_Spy_Primary[i_Weapons_Spy_Primary][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_Spy_Primary[i_Weapons_Spy_Primary][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_Spy_Primary;
	return true;
}
public Weapons_Spy_Secondary_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_Spy_Secondary);
	
	KvGetString(kv, "name", g_Weapons_Spy_Secondary[i_Weapons_Spy_Secondary][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_Spy_Secondary[i_Weapons_Spy_Secondary][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_Spy_Secondary[i_Weapons_Spy_Secondary][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_Spy_Secondary;
	return true;
}
public Weapons_Spy_Melee_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_Weapons_Spy_Melee);
	
	KvGetString(kv, "name", g_Weapons_Spy_Melee[i_Weapons_Spy_Melee][W_Name], PLATFORM_MAX_PATH);
	KvGetString(kv, "att", g_Weapons_Spy_Melee[i_Weapons_Spy_Melee][W_Att], PLATFORM_MAX_PATH);
	g_Weapons_Spy_Melee[i_Weapons_Spy_Melee][W_Index] = KvGetNum(kv, "index",1);
	++i_Weapons_Spy_Melee;
	return true;
}

public Weapons_Equip(client, id)
{
	return -1;
}

public Weapons_Remove(client)
{
}

public Action:Weapon_post(Handle:event, const String:name[], bool:dontBroadcast)
{
	new client = GetClientOfUserId(GetEventInt(event, "userid"));
	
	if(!IsValidClient(client))//||GetClientTeam(client)!=2
		return Plugin_Continue;

	new TFClassType:iClass = TF2_GetPlayerClass(client);
	new m_iEquippedPrimary=-1;
	new m_iEquippedSecondary=-1;
	new m_iEquippedMelee=-1;
	switch(iClass){
		case TFClass_Scout:{
				m_iEquippedPrimary	 = Store_GetEquippedItem(client,"w_scout_p_");
				m_iEquippedSecondary = Store_GetEquippedItem(client,"w_scout_s_");
				m_iEquippedMelee	 = Store_GetEquippedItem(client,"w_scout_m_");
			}
		case TFClass_Soldier:{
				m_iEquippedPrimary	 = Store_GetEquippedItem(client,"w_soldier_p_");
				m_iEquippedSecondary = Store_GetEquippedItem(client,"w_soldier_s_");
				m_iEquippedMelee	 = Store_GetEquippedItem(client,"w_soldier_m_");
			}
		case TFClass_Pyro:{
				m_iEquippedPrimary	 = Store_GetEquippedItem(client,"w_pyro_p_");
				m_iEquippedSecondary = Store_GetEquippedItem(client,"w_pyro_s_");
				m_iEquippedMelee	 = Store_GetEquippedItem(client,"w_pyro_m_");
			}
		case TFClass_DemoMan:{
				m_iEquippedPrimary	 = Store_GetEquippedItem(client,"w_demoman_p_");
				m_iEquippedSecondary = Store_GetEquippedItem(client,"w_demoman_s_");
				m_iEquippedMelee	 = Store_GetEquippedItem(client,"w_demoman_m_");
			}
		case TFClass_Heavy:{
				m_iEquippedPrimary	 = Store_GetEquippedItem(client,"w_heavy_p_");
				m_iEquippedSecondary = Store_GetEquippedItem(client,"w_heavy_s_");
				m_iEquippedMelee	 = Store_GetEquippedItem(client,"w_heavy_m_");
			}
		case TFClass_Engineer:{
				m_iEquippedPrimary	 = Store_GetEquippedItem(client,"w_engineer_p_");
				m_iEquippedSecondary = Store_GetEquippedItem(client,"w_engineer_s_");
				m_iEquippedMelee	 = Store_GetEquippedItem(client,"w_engineer_m_");
			}
		case TFClass_Medic:{
				m_iEquippedPrimary	 = Store_GetEquippedItem(client,"w_medic_p_");
				m_iEquippedSecondary = Store_GetEquippedItem(client,"w_medic_s_");
				m_iEquippedMelee	 = Store_GetEquippedItem(client,"w_medic_m_");
			}
		case TFClass_Sniper:{
				m_iEquippedPrimary	 = Store_GetEquippedItem(client,"w_sniper_p_");
				m_iEquippedSecondary = Store_GetEquippedItem(client,"w_sniper_s_");
				m_iEquippedMelee	 = Store_GetEquippedItem(client,"w_sniper_m_");
			}
		case TFClass_Spy:{
				m_iEquippedPrimary	 = Store_GetEquippedItem(client,"w_spy_p_");
				m_iEquippedSecondary = Store_GetEquippedItem(client,"w_spy_s_");
				m_iEquippedMelee	 = Store_GetEquippedItem(client,"w_spy_m_");
			}
		
	}
	if(m_iEquippedPrimary < 0 && m_iEquippedSecondary < 0 && m_iEquippedMelee < 0)
		return Plugin_Continue;
	if(m_iEquippedPrimary >= 0)
	{
		new m_iData = Store_GetDataIndex(m_iEquippedPrimary);
		TF2_RemoveWeaponSlot(client, 0);
		
		switch(iClass){
			case TFClass_Scout:{
					SpawnWeapon(client,g_Weapons_Scout_Primary[m_iData][W_Name],g_Weapons_Scout_Primary[m_iData][W_Index],g_Weapons_Scout_Primary[m_iData][W_Att]);
				}
			case TFClass_Soldier:{
					SpawnWeapon(client,g_Weapons_Soldier_Primary[m_iData][W_Name],g_Weapons_Soldier_Primary[m_iData][W_Index],g_Weapons_Soldier_Primary[m_iData][W_Att]);
				}
			case TFClass_Pyro:{
					SpawnWeapon(client,g_Weapons_Pyro_Primary[m_iData][W_Name],g_Weapons_Pyro_Primary[m_iData][W_Index],g_Weapons_Pyro_Primary[m_iData][W_Att]);
				}
			case TFClass_DemoMan:{
					SpawnWeapon(client,g_Weapons_DemoMan_Primary[m_iData][W_Name],g_Weapons_DemoMan_Primary[m_iData][W_Index],g_Weapons_DemoMan_Primary[m_iData][W_Att]);
				}
			case TFClass_Heavy:{
					SpawnWeapon(client,g_Weapons_Heavy_Primary[m_iData][W_Name],g_Weapons_Heavy_Primary[m_iData][W_Index],g_Weapons_Heavy_Primary[m_iData][W_Att]);
				}
			case TFClass_Engineer:{
					SpawnWeapon(client,g_Weapons_Engineer_Primary[m_iData][W_Name],g_Weapons_Engineer_Primary[m_iData][W_Index],g_Weapons_Engineer_Primary[m_iData][W_Att]);
				}
			case TFClass_Medic:{
					SpawnWeapon(client,g_Weapons_Medic_Primary[m_iData][W_Name],g_Weapons_Medic_Primary[m_iData][W_Index],g_Weapons_Medic_Primary[m_iData][W_Att]);
				}
			case TFClass_Sniper:{
					SpawnWeapon(client,g_Weapons_Sniper_Primary[m_iData][W_Name],g_Weapons_Sniper_Primary[m_iData][W_Index],g_Weapons_Sniper_Primary[m_iData][W_Att]);
				}
			case TFClass_Spy:{
					SpawnWeapon(client,g_Weapons_Spy_Primary[m_iData][W_Name],g_Weapons_Spy_Primary[m_iData][W_Index],g_Weapons_Spy_Primary[m_iData][W_Att]);
				}
		}
		
	}
	if(m_iEquippedSecondary >= 0)
	{
		new m_iData = Store_GetDataIndex(m_iEquippedSecondary);
		TF2_RemoveWeaponSlot(client, 1);
		
		switch(iClass){
			case TFClass_Scout:{
					SpawnWeapon(client,g_Weapons_Scout_Secondary[m_iData][W_Name],g_Weapons_Scout_Secondary[m_iData][W_Index],g_Weapons_Scout_Secondary[m_iData][W_Att]);
				}
			case TFClass_Soldier:{
					SpawnWeapon(client,g_Weapons_Soldier_Secondary[m_iData][W_Name],g_Weapons_Soldier_Secondary[m_iData][W_Index],g_Weapons_Soldier_Secondary[m_iData][W_Att]);
				}
			case TFClass_Pyro:{
					SpawnWeapon(client,g_Weapons_Pyro_Secondary[m_iData][W_Name],g_Weapons_Pyro_Secondary[m_iData][W_Index],g_Weapons_Pyro_Secondary[m_iData][W_Att]);
				}
			case TFClass_DemoMan:{
					SpawnWeapon(client,g_Weapons_DemoMan_Secondary[m_iData][W_Name],g_Weapons_DemoMan_Secondary[m_iData][W_Index],g_Weapons_DemoMan_Secondary[m_iData][W_Att]);
				}
			case TFClass_Heavy:{
					SpawnWeapon(client,g_Weapons_Heavy_Secondary[m_iData][W_Name],g_Weapons_Heavy_Secondary[m_iData][W_Index],g_Weapons_Heavy_Secondary[m_iData][W_Att]);
				}
			case TFClass_Engineer:{
					SpawnWeapon(client,g_Weapons_Engineer_Secondary[m_iData][W_Name],g_Weapons_Engineer_Secondary[m_iData][W_Index],g_Weapons_Engineer_Secondary[m_iData][W_Att]);
				}
			case TFClass_Medic:{
					SpawnWeapon(client,g_Weapons_Medic_Secondary[m_iData][W_Name],g_Weapons_Medic_Secondary[m_iData][W_Index],g_Weapons_Medic_Secondary[m_iData][W_Att]);
				}
			case TFClass_Sniper:{
					SpawnWeapon(client,g_Weapons_Sniper_Secondary[m_iData][W_Name],g_Weapons_Sniper_Secondary[m_iData][W_Index],g_Weapons_Sniper_Secondary[m_iData][W_Att]);
				}
			case TFClass_Spy:{
					SpawnWeapon(client,g_Weapons_Spy_Secondary[m_iData][W_Name],g_Weapons_Spy_Secondary[m_iData][W_Index],g_Weapons_Spy_Secondary[m_iData][W_Att]);
				}
		}
		
	}
	if(m_iEquippedMelee >= 0)
	{
		new m_iData = Store_GetDataIndex(m_iEquippedMelee);
		TF2_RemoveWeaponSlot(client, 2);
		
		switch(iClass){
			case TFClass_Scout:{
					SpawnWeapon(client,g_Weapons_Scout_Melee[m_iData][W_Name],g_Weapons_Scout_Melee[m_iData][W_Index],g_Weapons_Scout_Melee[m_iData][W_Att]);
				}
			case TFClass_Soldier:{
					SpawnWeapon(client,g_Weapons_Soldier_Melee[m_iData][W_Name],g_Weapons_Soldier_Melee[m_iData][W_Index],g_Weapons_Soldier_Melee[m_iData][W_Att]);
				}
			case TFClass_Pyro:{
					SpawnWeapon(client,g_Weapons_Pyro_Melee[m_iData][W_Name],g_Weapons_Pyro_Melee[m_iData][W_Index],g_Weapons_Pyro_Melee[m_iData][W_Att]);
				}
			case TFClass_DemoMan:{
					SpawnWeapon(client,g_Weapons_DemoMan_Melee[m_iData][W_Name],g_Weapons_DemoMan_Melee[m_iData][W_Index],g_Weapons_DemoMan_Melee[m_iData][W_Att]);
				}
			case TFClass_Heavy:{
					SpawnWeapon(client,g_Weapons_Heavy_Melee[m_iData][W_Name],g_Weapons_Heavy_Melee[m_iData][W_Index],g_Weapons_Heavy_Melee[m_iData][W_Att]);
				}
			case TFClass_Engineer:{
					SpawnWeapon(client,g_Weapons_Engineer_Melee[m_iData][W_Name],g_Weapons_Engineer_Melee[m_iData][W_Index],g_Weapons_Engineer_Melee[m_iData][W_Att]);
				}
			case TFClass_Medic:{
					SpawnWeapon(client,g_Weapons_Medic_Melee[m_iData][W_Name],g_Weapons_Medic_Melee[m_iData][W_Index],g_Weapons_Medic_Melee[m_iData][W_Att]);
				}
			case TFClass_Sniper:{
					SpawnWeapon(client,g_Weapons_Sniper_Melee[m_iData][W_Name],g_Weapons_Sniper_Melee[m_iData][W_Index],g_Weapons_Sniper_Melee[m_iData][W_Att]);
				}
			case TFClass_Spy:{
					SpawnWeapon(client,g_Weapons_Spy_Melee[m_iData][W_Name],g_Weapons_Spy_Melee[m_iData][W_Index],g_Weapons_Spy_Melee[m_iData][W_Att]);
				}
		}
		
	}
	
	return Plugin_Continue;
}

public IsValidClient (client)
{
	if (client <= 0 || client > MaxClients || !IsClientConnected(client) || IsFakeClient(client) || IsClientReplay(client) || IsClientSourceTV(client))
		return false;

	return IsClientInGame(client);
}

stock SpawnWeapon(client, String:name[], index, String:att[])
{
	int flags = OVERRIDE_ALL|FORCE_GENERATION;
	flags |= PRESERVE_ATTRIBUTES;
	
	new Handle:hWeapon=TF2Items_CreateItem(flags);
	if(hWeapon==INVALID_HANDLE)
	{
		return -1;
	}
	
	TF2Items_SetClassname(hWeapon, name);
	TF2Items_SetItemIndex(hWeapon, index);
	TF2Items_SetLevel(hWeapon, 11);
	TF2Items_SetQuality(hWeapon, 6);
	new String:atts[32][32];
	new count=ExplodeString(att, ";", atts, 32, 32);

	if(count % 2)
	{
		--count;
	}

	if(count>0)
	{
		TF2Items_SetNumAttributes(hWeapon, count/2);
		new i2;
		for(new i; i<count; i+=2)
		{
			new attrib=StringToInt(atts[i]);
			if(!attrib)
			{
				LogError("Bad weapon attribute passed: %s ; %s", atts[i], atts[i+1]);
				CloseHandle(hWeapon);
				return -1;
			}

			TF2Items_SetAttribute(hWeapon, i2, attrib, StringToFloat(atts[i+1]));
			i2++;
		}
	}
	else
	{
		TF2Items_SetNumAttributes(hWeapon, 0);
	}

	new entity=TF2Items_GiveNamedItem(client, hWeapon);
	CloseHandle(hWeapon);
	EquipPlayerWeapon(client, entity);
	return entity;
}

