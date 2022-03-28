[Setting hidden]
bool setting_customUTC = false;

[Setting hidden]
int setting_customUTC_offset = 0;

[SettingsTab name="Timezone"]
void RenderTimezoneSettingsTab() {
    setting_customUTC = UI::Checkbox("Enable custom UTC", setting_customUTC);
    UI::SetPreviousTooltip("Set a custom timezone offset (useful if the alerts are not correct)");
    if (setting_customUTC) {
        setting_customUTC_offset = UI::SliderInt("Custom UTC offset", setting_customUTC_offset, -12, 12);
        UI::Text("Actual Time with offset: " + time.Hour + ":" + time.Minute);
    }
}

[SettingsTab name="Configs"]
void RenderConfigSettingsTab() {

    UI::TextWrapped("Theres configs are fetched from the plugin config, if they are wrong, please @Greep#3022 on the Openplanet Discord server");
    if (UI::Button(Icons::DiscordAlt + " Join Openplanet Discord")) {
        OpenBrowserURL("https://openplanet.dev/link/discord");
    }

    UI::Separator();

    if (!setting_customUTC) {
        UI::Text("\\$090Active \\$zUTC Offset: UTC+" + tostring(configClass.offset));
    } else {
        UI::Text("\\$990Custom \\$zUTC Offset: UTC+" + tostring(setting_customUTC_offset));
    }
    UI::Text("Actual Time with offset: " + time.Hour + ":" + time.Minute + ":" + time.Second);

    UI::Separator();

    UI::Text("Cup of the day times:");
    for (uint i = 0; i < configClass.cotdTimes.Length; i++) {
        UI::SameLine();
        UI::Text("\\$090" + configClass.cotdTimes[i]);
    }

    UI::Text("Super Royal times:");
    for (uint i = 0; i < configClass.srTimes.Length; i++) {
        UI::SameLine();
        UI::Text("\\$090" + configClass.srTimes[i]);
    }

    UI::Separator();

    if (UI::Button(Icons::Refresh + " Refresh configs")) {
        startnew(refreshAPI);
    }
}

void refreshAPI() {
    configClass.APIAlreadySet = false;
    configClass.fetchAPI();
}