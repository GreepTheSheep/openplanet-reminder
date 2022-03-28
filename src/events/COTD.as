void checkCOTD(int eventHour){
    if (setting_cotd_30minutes && time.Hour == eventHour-1 && time.Minute == 30 && time.Second == 0){
        vec4 color = UI::HSV(0.5, 0.5, 0.5);
        UI::ShowNotification(Icons::Trophy + " The Cup of the day is starting in 30 minutes!", COTDNotifDesc(), color, 10000);
        PlaySound();
    }

    if (setting_cotd_15minutes && time.Hour == eventHour-1 && time.Minute == 45 && time.Second == 0){
        vec4 color = UI::HSV(0.375, 0.5, 0.5);
        UI::ShowNotification(Icons::Trophy + " The Cup of the day is starting in 15 minutes!", COTDNotifDesc(), color, 10000);
        PlaySound();
    }

    if (setting_cotd_10minutes && time.Hour == eventHour-1 && time.Minute == 50 && time.Second == 0){
        vec4 color = UI::HSV(0.25, 0.5, 0.5);
        UI::ShowNotification(Icons::Trophy + " The Cup of the day is starting in 10 minutes!", COTDNotifDesc(), color, 10000);
        PlaySound();
    }

    if (setting_cotd_5minutes && time.Hour == eventHour-1 && time.Minute == 55 && time.Second == 0){
        vec4 color = UI::HSV(0.125, 0.5, 0.5);
        UI::ShowNotification(Icons::Trophy + " The Cup of the day is starting in 5 minutes!", COTDNotifDesc(), color, 10000);
        PlaySound();
    }

    if (setting_cotd_0minutes && time.Hour == eventHour && time.Minute == 0 && time.Second == 0){
        vec4 color = UI::HSV(0, 0.5, 0.5);
        UI::ShowNotification(Icons::Trophy + " The Cup of the day is starting now !", "Good luck!", color, 5000);
    }
}