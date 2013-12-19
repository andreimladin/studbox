package ro.studbox.mvc.controllers;

import org.joda.time.DateTime;
import org.joda.time.DateTimeZone;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/TimeZone")
public class TimeZoneController {
	
	@Autowired
	private DateTimeZone dtZone;
	
	@RequestMapping(value="/Bucharest", method = RequestMethod.GET)
	public @ResponseBody String getBucharestTime() {
		return DateTime.now(dtZone).toString();
	}
	
	@RequestMapping(value="/Amsterdam", method = RequestMethod.GET)
	public @ResponseBody String getAmsterdamTime() {
		return DateTime.now(DateTimeZone.forID("Europe/Amsterdam")).toString();
	}
	
	@RequestMapping(value="/Server", method = RequestMethod.GET)
	public @ResponseBody String getServerTime() {		
		return DateTime.now().toString();
	}

}
