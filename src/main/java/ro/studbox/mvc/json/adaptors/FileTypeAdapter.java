package ro.studbox.mvc.json.adaptors;

import java.lang.reflect.Type;

import ro.studbox.entities.File;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

public class FileTypeAdapter implements JsonSerializer<File> {
	
	@Override
	public JsonElement serialize(File file, Type typeOfSrc,
			JsonSerializationContext context) {
		JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("objectId", file.getObjectId());
        jsonObject.addProperty("name", file.getName());
        jsonObject.addProperty("contentLength", file.getContentLength());
        jsonObject.addProperty("contentType", file.getContentType());        
        jsonObject.addProperty("lastModifiedDateString", file.getLastModifiedDateString());
        jsonObject.add("owner", context.serialize(file.getOwner()));
        
        return jsonObject;      
	}

}
