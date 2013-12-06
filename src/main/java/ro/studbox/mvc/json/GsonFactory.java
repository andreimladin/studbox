package ro.studbox.util.factory;

import org.apache.log4j.Logger;

import ro.studbox.entities.File;
import ro.studbox.entities.User;
import ro.studbox.mvc.controllers.FilesController;
import ro.studbox.mvc.json.adaptors.FileTypeAdapter;
import ro.studbox.mvc.json.adaptors.UserTypeAdapter;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class GsonFactory {
	
	private Logger logger = Logger.getLogger(FilesController.class);
	
	private GsonBuilder gsonBuilder = new GsonBuilder();
	
	public GsonFactory() {
		logger.debug("Registering the File type adapter to GsonBuilder");
		gsonBuilder.registerTypeAdapter(File.class, new FileTypeAdapter());		
		gsonBuilder.registerTypeAdapter(User.class, new UserTypeAdapter());
	}
	
	public static GsonFactory createInstance() {
		return new GsonFactory();		
	}
	
	public Gson createGson() {
		logger.debug("Creating the gson instance");
		return gsonBuilder.create();
	}	
	
}
