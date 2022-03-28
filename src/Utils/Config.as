class Config {
    string timeOffsetAPI;
    int offset;
    bool APIAlreadySet;
    array<int> cotdTimes;
    array<int> srTimes;

    Config() {
        APIAlreadySet = false;
        timeOffsetAPI = "https://openplanet.dev/plugin/reminder/config/times";
        offset = 0;
        cotdTimes = {19,3,11};
        srTimes = {20,4,12};
    }

    int getOffsetFromAPI() {
        fetchAPI();
        return offset;
    }

    void fetchAPI() {
        if (!APIAlreadySet) {
            Json::Value apiJson = API::GetAsync(timeOffsetAPI);
            trace(Json::Write(apiJson));
            offset = apiJson["offset"];

            Json::Value cotdArrayJson = apiJson["cotd"];
            for (uint i = 0; i < cotdArrayJson.Length; i++) {
                cotdTimes[i] = cotdArrayJson[i];
            }

            Json::Value srArrayJson = apiJson["sroyal"];
            for (uint i = 0; i < cotdArrayJson.Length; i++) {
                srTimes[i] = srArrayJson[i];
            }
            APIAlreadySet = true;
        }
    }
}

Config configClass;