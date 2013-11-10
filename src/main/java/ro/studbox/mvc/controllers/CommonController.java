package ro.studbox.mvc.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ro.studbox.mvc.forms.FeedbackForm;
import ro.studbox.service.EmailService;

import com.google.gson.Gson;

@Controller
public class CommonController {
	
	@Autowired
	@Qualifier("HtmlEmailService")
	private EmailService emailService;
	
	@Autowired
    private MessageSource messageSource;
	
	@Autowired
	private Gson gson;
	
	@RequestMapping("/contact")
	public String showContact(){
		return "common/contact";
	}
	
	@RequestMapping("/about")
	public String showAbout(){
		return "common/about";
	}
	
	@RequestMapping("/terms")
	public String showTerms(){
		return "common/terms";
	}
	
	@RequestMapping("/shortTerms")
	public String showShortTerms() {
        return "common/shortTerms";
    }

	@RequestMapping("/feedback")
    public ModelAndView showFeedback() {
		ModelAndView model = new ModelAndView();
		model.setViewName("common/feedback");
		model.addObject("feedbackForm", new FeedbackForm());
		
		return model;
    }

	@RequestMapping("/feedback/send")
    public String sendFeedback(@Valid FeedbackForm contactForm, BindingResult result) {
//		Map<String, Object> resultMap = new HashMap<String, Object>();
        if(result.hasErrors()) {
        	return "common/feedback";
//            resultMap.put("status", "error");
//            resultMap.put("errorMessage", messageSource.getMessage(result.getFieldError().getCode(), null, Locale.ENGLISH));
        } else {
            emailService.sendEmailFeedback(contactForm.getEmail(), contactForm.getSubject(), contactForm.getText());
//            resultMap.put("status", "success");
            return "common/feedbackSent";
        }
        
//        return gson.toJson(resultMap);
    }


}
