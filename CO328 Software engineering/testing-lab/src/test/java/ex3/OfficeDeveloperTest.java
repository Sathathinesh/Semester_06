/* 
E/15/366
S.Thinesh
CO328 Unit Test lab
Test ex:03  
*/

package ex3;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import java.lang.Exception;
import java.lang.reflect.Field;
import org.junit.jupiter.api.Test;
import java.util.*; 

class OfficeDeveloperTest {
	
	@Test
	void takeLeftMaxibonTest() {
	
	Developer PEDRO = Developer.PEDRO;
	Developer ALBERTO = Developer.ALBERTO;
	Developer DAVIDE = Developer.DAVIDE;
	Developer SERGIO = Developer.SERGIO;
	Developer JORGE = Developer.JORGE;

	Office office = new Office(15);


	List<Developer> developers = new ArrayList<>(); 
	developers.add(SERGIO);
	developers.add(JORGE);
	developers.add(ALBERTO);
	developers.add(PEDRO);
	developers.add(ALBERTO);
	developers.add(PEDRO);
	developers.add(SERGIO);
	developers.add(PEDRO);
	office.openFridge(developers);

	assertEquals(10,office.maxibonsLeft, "should be 10");
   }

}
