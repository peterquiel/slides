package karate;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@SuppressWarnings("unused")
public class Util {

    public List<Map<String, Object>> addUuid(List<Map<String,Object>> params) {
        params.forEach(param -> param.put("id", random().toString()));
        return params;
    }

    public UUID random() {
        return UUID.randomUUID();
    }
}
