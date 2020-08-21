/* 
E/15/366
S.Thinesh
CO328 Unit Test lab
Test ex:01
*/


package ex1; 
 
import static org.junit.jupiter.api.Assertions.assertEquals; 
import static org.junit.jupiter.api.Assertions.assertThrows; 
 
import java.lang.Exception; 
import java.lang.reflect.Field; 
import org.junit.jupiter.api.Test; 
 
class HistoricalDataTest { 
 
   @Test    
   void addValueTest() {       
   HistoricalData hdt = new HistoricalData(0.0,0.0,0);       
   hdt.add(10);       
   assertEquals(10, hdt.max(), "after add 10 to 0, max should be 10");   
   } 
 
   @Test    
   public void divideByZeroException() {      
   HistoricalData hdt = new HistoricalData(0.0, 0.0, 0);      
   Exception exception = assertThrows(ArithmeticException.class, () -> hdt.average());       
   assertEquals("devide by zero", exception.getMessage());    
   } 
 
} 
 
 