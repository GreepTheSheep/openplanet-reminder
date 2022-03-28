// COTD: every day at 19h, 03h and 11h CEST
// Super Royal: every day at 20h, 04h and 12h CEST

Time::Info time;

void Main(){
    configClass.fetchAPI();
    while (true){
        yield();

        if (setting_customUTC) {
            time = TimeParseCustom(setting_customUTC_offset);
        } else {
            time = TimeParseFromConfig();
        }

        if (Permissions::PlayCurrentOfficialMonthlyCampaign() && setting_cotd_enable){ // COTD (check if they can play TOTDs)
            if (setting_cotd_enable_main) checkCOTD(configClass.cotdTimes[0]); // COTD main (19h CEST)
            if (setting_cotd_enable_rerun1) checkCOTD(configClass.cotdTimes[1]); // COTD rerun 1 (03h CEST)
            if (setting_cotd_enable_rerun2) checkCOTD(configClass.cotdTimes[2]); // COTD rerun 2 (11h CEST)
        }
        if (setting_royal_enable){ // Super Royal
            if (setting_royal_enable_main) checkSuperRoyal(configClass.srTimes[0]); // Super Royal main (20h CEST)
            if (setting_royal_enable_rerun1) checkSuperRoyal(configClass.srTimes[1]); // Super Royal rerun 1 (04h CEST)
            if (setting_royal_enable_rerun2) checkSuperRoyal(configClass.srTimes[2]); // Super Royal rerun 2 (12h CEST)
        }
        sleep(1000);
    }
}