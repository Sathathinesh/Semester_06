/* 
E/15/366
S.Thinesh
CO328 Unit Test lab
Test ex:02 
*/

package ex2;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import java.lang.Exception;
import java.lang.reflect.Field;
import org.junit.jupiter.api.Test;

class AlarmClockTest {

	@Test
	void alarmTest() {
	AlarmClock clk = new AlarmClock();
	clk.alarmRinging=true;

	for(int i=0;i<60;i++){
	   clk.tick();
	}
	assertEquals(false,clk.alarmRinging, "after 60 seconds  alarmRinging must be false");
   }
}
