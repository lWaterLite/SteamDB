package cc.lwaterlite.SteamDBApplication.QueryActionDao.RowObject;

import com.alibaba.fastjson2.JSONObject;

import java.text.SimpleDateFormat;
import java.util.Date;

public class RowObject {
    private final int itemId;
    private final String name;
    private final Date itemLaunchDate;
    private final String comment;
    private final float rate;
    private final float price;

    public RowObject(int itemId, String name, Date itemLaunchDate, String comment, float rate, float price) {
        this.itemId = itemId;
        this.name = name;
        this.itemLaunchDate = itemLaunchDate;
        this.comment = comment;
        this.rate = rate;
        this.price = price;
    }

    @Override
    public String toString() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String j =  "{" +
                "'itemId': " + itemId +
                ", 'name': '" + name + '\'' +
                ", 'date': '" + simpleDateFormat.format(itemLaunchDate) + '\'' +
                ", 'comment': '" + comment + '\'' +
                ", 'rate': " + rate +
                ", 'price': " + price +
                '}';
        return JSONObject.parse(j).toJSONString();
    }
}
