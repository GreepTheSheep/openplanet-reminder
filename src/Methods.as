// -------- Time convert -----------
// Offsets: 1=CET, 2=CEST

Time::Info TimeParseFromConfig(){
    Time::Info utc = Time::ParseUTC();
    utc.Hour += configClass.getOffsetFromAPI();
    if(utc.Hour > 24){
        utc.Hour -= 24;
        utc.Day++;
    }
    if(utc.Hour < 0){
        utc.Hour += 24;
        utc.Day--;
    }
    return utc;
}

Time::Info TimeParseCustom(int offset){
    Time::Info utc = Time::ParseUTC();
    utc.Hour += offset;
    if(utc.Hour > 24){
        utc.Hour -= 24;
        utc.Day++;
    }
    if(utc.Hour < 0){
        utc.Hour += 24;
        utc.Day--;
    }
    return utc;
}

// -------- Notification desc -----------

string COTDNotifDesc(){
    string desc = setting_cotd_message;
    if (desc == "") desc = "Warm up your tyres!";
    return desc;
}

string RoyalNotifDesc(){
    string desc = setting_royal_message;
    if (desc == "") desc = "Prepare to dive!";
    return desc;
}

// --- Sounds (Thanks Nsgr) ---

void PlaySound(string FileName = "Race3.wav", float Volume = 0.6, float Pitch = 1.25) {
    auto audioPort = GetApp().AudioPort;
    for (uint i = 0; i < audioPort.Sources.Length; i++) {
        auto source = audioPort.Sources[i];
        auto sound = source.PlugSound;
        if (cast<CSystemFidFile>(GetFidFromNod(sound.PlugFile)).FileName == FileName) {
            source.Stop();
            // Yield twice : Later while loop will be exited by already playing sounds
            // Their coroutines will end and the pitch and volume will be set to the correct values
            yield();yield();
            float PrevPitch = sound.Pitch;
            float PrevSoundVol = sound.VolumedB;
            float PrevSourceVol = source.VolumedB;
            sound.Pitch = Pitch;
            sound.VolumedB = Volume;
            source.VolumedB = Volume;
            source.Play();
            while (source.IsPlaying) {
                yield();
            }
            sound.Pitch = PrevPitch;
            sound.VolumedB = PrevSoundVol;
            source.VolumedB = PrevSourceVol;
            return;
        }
    }
    error("Couldn't find sound to play!");

    // Backup sound: "Race3.wav"
    for (uint i = 0; i < audioPort.Sources.Length; i++) {
        auto source = audioPort.Sources[i];
        auto sound = source.PlugSound;
        if (cast<CSystemFidFile>(GetFidFromNod(sound.PlugFile)).FileName == "Race3.wav") {
            source.Stop();
            // Yield twice : Later while loop will be exited by already playing sounds, ending their coroutines
            yield();yield();
            float PrevPitch = sound.Pitch;
            float PrevSoundVol = sound.VolumedB;
            float PrevSourceVol = source.VolumedB;
            sound.Pitch = 1.5;
            source.VolumedB = Volume;
            source.Play();
            while (source.IsPlaying) {
                yield();
            }
            sound.Pitch = PrevPitch;
            sound.VolumedB = PrevSoundVol;
            source.VolumedB = PrevSourceVol;
            return;
        }
    }
    error("Couldn't find backup Race3.wav");
}
