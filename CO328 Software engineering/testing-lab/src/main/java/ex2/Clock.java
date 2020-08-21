package ex2;

/** A class that keeps track of the time. */
public class Clock {
    protected int hour, minute, second;

    public void setTime(int hour, int minute, int second) {
        this.hour = hour;
        this.minute = minute;
        this.second = 0;
    }

    /** Advances the time by one second */
    public void tick() {
        second++;
        if (second == 60) { second = 0; minute++; }
        if (minute == 60) { minute = 0; hour++; }
        //XXX
    }
}
