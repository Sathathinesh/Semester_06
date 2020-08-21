package ex2;

/** Extends Clock.class with the ability to set and alarm. */
class AlarmClock extends Clock {
    private int alarmHour, alarmMinute, alarmSecondsRemaining;
    protected boolean alarmRinging;

    public void setAlarmTime(int hour, int minute) {
        alarmHour = hour;
        alarmMinute = minute;
    }

    /** Checks whether alarm time is reached and rings alarm.
        If the alarm is ringing switch it off after 60s. */
    @Override
    public void tick() {
        super.tick();
        if (alarmSecondsRemaining > 0) {
            alarmSecondsRemaining--;
            //XXX
        } else if (hour == alarmHour && minute == alarmMinute) {
            alarmRinging = true;
            alarmSecondsRemaining = 60 - second;
        }
    }
}