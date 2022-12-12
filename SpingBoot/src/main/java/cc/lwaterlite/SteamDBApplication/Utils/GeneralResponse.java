package cc.lwaterlite.SteamDBApplication.Utils;

import cc.lwaterlite.SteamDBApplication.QueryActionDao.RowObject.RowObject;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;

import java.util.List;

public class GeneralResponse {
    private final List<RowObject> rowObjectList;
    private final int exceptionCount;

    public GeneralResponse(List<RowObject> rowObjectList, int exceptionCount) {
        this.rowObjectList = rowObjectList;
        this.exceptionCount = exceptionCount;
    }

    @Override
    public String toString() {

        JSONArray jsonArray = new JSONArray();

        for (RowObject rowObject: rowObjectList) {
            jsonArray.add(JSONObject.parse(rowObject.toString()));
        }

        jsonArray.add(exceptionCount);

        return jsonArray.toJSONString();
    }

}
