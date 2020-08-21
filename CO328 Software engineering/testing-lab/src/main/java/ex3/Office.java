package ex3;

import java.util.Collections;
import java.util.List;

/** This class implements the scenario described in exercise 3 */
public class Office {
  static final int NUMBER_TO_BUY = 10;

  protected int maxibonsLeft;

  public Office(int maxibonsLeft) {
    this.maxibonsLeft = maxibonsLeft;
  }

  /** A single developer gets a Maxibon */
  public void openFridge(Developer developer) {
    openFridge(Collections.singletonList(developer));
  }

  /** A group of developers get Maxibons */
  public void openFridge(List<Developer> developers) {
    for (Developer developer : developers) {
      grabMaxibons(developer);
      //XXX
      if (maxibonsLeft < 2) {
        notifyWeShouldBuyMaxibon(developer);
        buyMaxibons();
      }
    }
  }

  private void grabMaxibons(Developer developer) {
    maxibonsLeft -= developer.numberOfMaxibonsToGrab;
    //XXX
  }

  private void notifyWeShouldBuyMaxibon(Developer developer) {
    System.out.println("Hi guys, I'm " + developer.name + ". We need more maxibons!");
  }

  private void buyMaxibons() {
    maxibonsLeft += NUMBER_TO_BUY;
  }
}
