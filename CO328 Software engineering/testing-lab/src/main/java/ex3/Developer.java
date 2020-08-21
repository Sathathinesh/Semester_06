package ex3;

/** A class to hold our developers. Nothing to test here. */
public enum Developer {
    PEDRO("Pedro", 3),
    ALBERTO("Alberto", 1),
    DAVIDE("Davide", 0),
    SERGIO("Sergio", 2),
    JORGE("Jorge", 1);

    final String name;
    final int numberOfMaxibonsToGrab;

    Developer(String name, int numberOfMaxibonsToGrab) {
        this.name = name;
        this.numberOfMaxibonsToGrab = numberOfMaxibonsToGrab;
    }

}