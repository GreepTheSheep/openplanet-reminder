void checkSuperRoyal(int eventHour) {
    if (setting_royal_30minutes && time.Hour == eventHour-1 && time.Minute == 30 && time.Second == 0){
        vec4 color = UI::HSV(0.5, 0.5, 0.5);
        UI::ShowNotification(Icons::Diamond + " The Super Royal is starting in 30 minutes!", RoyalNotifDesc(), color, 10000);
        PlaySound();
    }

    if (setting_royal_15minutes && time.Hour == eventHour-1 && time.Minute == 45 && time.Second == 0){
        vec4 color = UI::HSV(0.375, 0.5, 0.5);
        UI::ShowNotification(Icons::Diamond + " The Super Royal is starting in 15 minutes!", RoyalNotifDesc(), color, 10000);
        PlaySound();
    }

    if (setting_royal_10minutes && time.Hour == eventHour-1 && time.Minute == 50 && time.Second == 0){
        vec4 color = UI::HSV(0.25, 0.5, 0.5);
        UI::ShowNotification(Icons::Diamond + " The Super Royal is starting in 10 minutes!", RoyalNotifDesc(), color, 10000);
        PlaySound();
    }

    if (setting_royal_5minutes && time.Hour == eventHour-1 && time.Minute == 55 && time.Second == 0){
        vec4 color = UI::HSV(0.125, 0.5, 0.5);
        UI::ShowNotification(Icons::Diamond + " The Super Royal is starting in 5 minutes!", RoyalNotifDesc(), color, 10000);
        PlaySound();
    }

    if (setting_royal_0minutes && time.Hour == eventHour && time.Minute == 0 && time.Second == 0){
        vec4 color = UI::HSV(0, 0.5, 0.5);
        UI::ShowNotification(Icons::Diamond + " The Super Royal is starting now !", "Good luck!", color, 5000);
    }
}