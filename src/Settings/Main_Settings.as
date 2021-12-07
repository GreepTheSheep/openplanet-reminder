[Setting name="Enable custom UTC" category="Timezone" description="Set a custom timezone offset (useful if the alerts are not correct)"]
bool setting_customUTC = false;

[Setting name="Custom UTC offset" category="Timezone" min=-12 max=12 description="If disabled, the timezone is set automatically to CET (may require a plugin restart)"]
int setting_customUTC_offset = 0;