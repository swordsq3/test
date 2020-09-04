#if defined STANDALONE_BUILD
#include <tf2attributes>

#include <store>
#include <zephstocks>
#endif

new g_att_370[16];
new i_att_370;

#if defined STANDALONE_BUILD
public OnPluginStart()
#else
public TfAtt_OnPluginStart()
#endif
{
	Store_RegisterHandler("tf2att_370_", "code", TfAtt_OnMapStart, TfAtt_Reset, TfAtt_370_Config, TfAtt_Equip_370, TfAtt_Remove_370, true);
}

#if defined STANDALONE_BUILD
public OnClientPutInServer(client)
#else
public TfAtt_OnClientPutInServer(client)
#endif
{
	CreateTimer(1.0,TfAttTimer,client);
}
public Action:TfAttTimer(Handle:Tiemr,any:client)
{
	att_370_PutInServer(client);
	return Plugin_Stop;
}

public TfAtt_OnMapStart()
{
}

public TfAtt_Reset()
{
	i_att_370 = 0;
}
//--------------------------config---------------------------------
//370
public TfAtt_370_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_att_370);

	g_att_370[i_att_370] = KvGetNum(kv, "code",0);
	++i_att_370;
	return true;
}

public TfAtt_Equip_370(client, id)
{
	new m_iData = Store_GetDataIndex(id);
	TF2Attrib_SetByDefIndex(client, 370, float(g_att_370[m_iData]));
	return -1;
}

public TfAtt_Remove_370(client)
{
	TF2Attrib_RemoveByDefIndex(client, 370);
}

stock att_370_PutInServer(client)
{
	new m_iEquippedAtt370=-1;
	m_iEquippedAtt370	 = Store_GetEquippedItem(client,"tf2att_370_");
	
	if(m_iEquippedAtt370 >=0)
	{
		new m_iData = Store_GetDataIndex(m_iEquippedAtt370);
		TF2Attrib_SetByDefIndex(client, 370, float(g_att_370[m_iData]));
	}
}

////////////---------------------------도발-----------------------------------------------------

public TF2_OnConditionAdded(int client, TFCond condition)
{
	if (condition == TFCond_Taunting)
	{
		CreateEffect(client, TauntEffect[client]);
		switch(code[client]){
			case 1:Timer_[client]=CreateTimer(2.6, Taunt_t, client,TIMER_REPEAT);
			case 2:Timer_[client]=CreateTimer(2.6, Taunt_t, client,TIMER_REPEAT);
			case 3:Timer_[client]=CreateTimer(0.9, Taunt_t, client,TIMER_REPEAT);
		}
	}
}

public TF2_OnConditionRemoved(client, TFCond:condition)
{
	if(condition == TFCond_Taunting)
	{
		if(TauntEffect1[client] > 0){
			if(c_Cehak[client]){
				decl Float:pos[3];
				GetClientAbsOrigin(client, pos);
				TeleportEntity(TauntEffect1[client], pos, NULL_VECTOR, NULL_VECTOR);
				CreateTimer(0.1, Taunt_Time, client);
			}
			else{ AcceptEntityInput(TauntEffect1[client], "Kill");}
		}
		c_Cehak[client]=false;
		code[client]=0;
		delete Timer_[client];
	}
}

public Action:Taunt_Time(Handle:timer, any:client)
{
	if(TauntEffect1[client] > 0){
		AcceptEntityInput(TauntEffect1[client], "Kill");
	}
	TauntEffect1[client] = -1;
}
//---------------------------------------------------------------------------------------------------
stock CreateEffect(client, effectid)
{
	new particle1 = CreateEntityByName("info_particle_system");
	new String:tName[48];
	Format(tName, sizeof(tName), "target%i", client);
	DispatchKeyValue(client, "targetname", tName);
	DispatchKeyValue(particle1, "parentname", tName);
	switch(effectid)
	{
		case 1:
		{
			DispatchKeyValue(particle1, "effect_name", "utaunt_firework_teamcolor_red");
			code[client]=1;
		}
		case 2:
		{
			DispatchKeyValue(particle1, "effect_name", "utaunt_firework_teamcolor_blue");
			code[client]=2;
		}
		case 3: DispatchKeyValue(particle1, "effect_name", "utaunt_beams_yellow");
		case 4: DispatchKeyValue(particle1, "effect_name", "utaunt_disco_party");
		case 5: DispatchKeyValue(particle1, "effect_name", "utaunt_hearts_glow_parent");
		case 6: DispatchKeyValue(particle1, "effect_name", "utaunt_meteor_parent");
		case 7: DispatchKeyValue(particle1, "effect_name", "utaunt_cash_confetti");
		case 8: DispatchKeyValue(particle1, "effect_name", "utaunt_tornado_parent_black");
		case 9: DispatchKeyValue(particle1, "effect_name", "utaunt_tornado_parent_white");
		case 10:
		{
			DispatchKeyValue(particle1, "effect_name", "utaunt_lightning_parent");
			code[client]=3;
		}
		case 11: DispatchKeyValue(particle1, "effect_name", "utaunt_souls_green_parent");
		case 12: DispatchKeyValue(particle1, "effect_name", "utaunt_souls_purple_parent");
		case 13: DispatchKeyValue(particle1, "effect_name", "utaunt_hellpit_parent");
		case 14: {DispatchKeyValue(particle1, "effect_name", "utaunt_hellswirl");c_Cehak[client]=true;}
		case 15: {DispatchKeyValue(particle1, "effect_name", "utaunt_headless");c_Cehak[client]=true;}
		case 16: {DispatchKeyValue(particle1, "effect_name", "utaunt_merasmus");c_Cehak[client]=true;}
		case 17: DispatchKeyValue(particle1, "effect_name", "utaunt_firework_dragon_parent");
		case 18: DispatchKeyValue(particle1, "effect_name", "utaunt_bubbles_glow_orange_parent");
		case 19: DispatchKeyValue(particle1, "effect_name", "utaunt_bubbles_glow_purple_parent");
		case 20: DispatchKeyValue(particle1, "effect_name", "utaunt_bubbles_glow_green_parent");
		case 21: {DispatchKeyValue(particle1, "effect_name", "utaunt_smoke_moon_parent");c_Cehak[client]=true;}
		case 22: {DispatchKeyValue(particle1, "effect_name", "utaunt_smoke_moon_green_parent");c_Cehak[client]=true;}
		case 23: DispatchKeyValue(particle1, "effect_name", "utaunt_portalswirl_purple_parent");
		case 24: DispatchKeyValue(particle1, "effect_name", "utaunt_electric_mist_parent");
		case 25: DispatchKeyValue(particle1, "effect_name", "utaunt_arcane_green_parent");
		case 26: DispatchKeyValue(particle1, "effect_name", "utaunt_arcane_purple_parent");
		case 27: DispatchKeyValue(particle1, "effect_name", "utaunt_arcane_yellow_parent");
		case 28: DispatchKeyValue(particle1, "effect_name", "utaunt_present_parent");
		case 29: DispatchKeyValue(particle1, "effect_name", "utaunt_snowring_icy_parent");
		case 30: DispatchKeyValue(particle1, "effect_name", "utaunt_snowring_space_parent");
		case 31: DispatchKeyValue(particle1, "effect_name", "utaunt_spirit_festive_parent");
		case 32: DispatchKeyValue(particle1, "effect_name", "utaunt_spirit_magical_parent");
		case 33: DispatchKeyValue(particle1, "effect_name", "utaunt_spirit_winter_parent");
		case 34: DispatchKeyValue(particle1, "effect_name", "utaunt_spirit_winter_snow");
		case 35: DispatchKeyValue(particle1, "effect_name", "utaunt_spirit_winter_rings");
		case 36: DispatchKeyValue(particle1, "effect_name", "utaunt_spirit_winter_sparkles_amb");
		case 37: DispatchKeyValue(particle1, "effect_name", "utaunt_electricity_cloud_parent_WY");
		case 38: DispatchKeyValue(particle1, "effect_name", "utaunt_electricity_cloud_parent_WB");
		case 39: DispatchKeyValue(particle1, "effect_name", "utaunt_electricity_cloud_parent_WP");
	}
	decl Float:pos[3];
	GetClientAbsOrigin(client, pos);
	
	TeleportEntity(particle1, pos, NULL_VECTOR, NULL_VECTOR);
	DispatchSpawn(particle1);
	SetVariantString(tName);
	AcceptEntityInput(particle1, "SetParent", particle1, particle1, 0);
	ActivateEntity(particle1);
	AcceptEntityInput(particle1, "Start"); 
	TauntEffect1[client] = particle1;
}

public Action:Taunt_t(Handle:timer, any:client)
{
	new particle1 = CreateEntityByName("info_particle_system");
	switch(code[client]){
		case 1:DispatchKeyValue(particle1, "effect_name", "utaunt_firework_teamcolor_red");
		case 2:DispatchKeyValue(particle1, "effect_name", "utaunt_firework_teamcolor_blue");
		case 3:DispatchKeyValue(particle1, "effect_name", "utaunt_lightning_parent");
	}
	decl Float:pos[3];
	GetClientAbsOrigin(client, pos);
	
	TeleportEntity(particle1, pos, NULL_VECTOR, NULL_VECTOR);
	DispatchSpawn(particle1);
	ActivateEntity(particle1);
	AcceptEntityInput(particle1, "Start"); 
	TauntEffect1[client] = particle1;
	return Plugin_Continue; 
}





