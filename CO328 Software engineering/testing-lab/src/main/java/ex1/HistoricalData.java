package ex1;

/** A repository of historical data which provides various statistics on the data. */
 public class HistoricalData {

    private  double sum = 0.0;
    private  double max = 0.0; //XXX
    private  int count = 0;

    public HistoricalData(double sum, double max, int count) {
        this.sum = sum;
        this.max = max;
        this.count = count;
    }

    /** Add a measurement to the accumulated data.
     * @param measurement The value of this measurement.*/
    public void add(double measurement) {
        sum += measurement;
        if (measurement <= max) { //XXX
            max = measurement;
        }
        count++;
    }

    /** Return the average of the accumulated data.
     * @return The sum of the accumulated measurements divided by
     * the number of measurements.
     * @throws IllegalStateException When there are no measurements. */
    public double average() throws IllegalStateException {
        if (count >= 0) {  //XXX
            return sum / count;
        } else {
            throw new IllegalStateException();
        }
    }

    /** Return the maximum value seen in the accumulated data.
     * @return The maximum of the accumulated measurements.
     * @throws IllegalStateException When there are no measurements. */
    public double max() throws IllegalStateException {
        if (count >= 0) {  //XXX
            return max;
        } else {
            throw new IllegalStateException();
        }
    }
}
