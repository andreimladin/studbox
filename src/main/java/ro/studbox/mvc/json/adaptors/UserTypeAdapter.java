package ro.studbox.mvc.json.adaptors;

import java.lang.reflect.Type;

import ro.studbox.entities.User;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

public class UserTypeAdapter implements JsonSerializer<User> {

	@Override
	public JsonElement serialize(User user, Type typeOfSrc,
			JsonSerializationContext context) {
		JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("username", user.getUsername());

        return jsonObject; 
	}

}
