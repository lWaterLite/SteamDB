package cc.lwaterlite.SteamDBApplication.QueryActionDao.DetailItemObject;

import com.alibaba.fastjson2.JSONObject;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class DetailItemObject {
    private final int itemId;
    private final String name;
    private final String brief;
    private final String comment;
    private final Date date;
    private final float rate;
    private final float price;
    private final List<JSONObject> developer;
    private final List<JSONObject> publisher;
    private final List<JSONObject> tag;

    public DetailItemObject(int itemId, String name, String brief, String comment, Date date, float rate, float price,
                            List<JSONObject> developer, List<JSONObject> publisher, List<JSONObject> tag) {
        this.itemId = itemId;
        this.name = name;
        this.brief = brief;
        this.comment = comment;
        this.date = date;
        this.rate = rate;
        this.price = price;
        this.developer = developer;
        this.publisher = publisher;
        this.tag = tag;
    }

    @Override
    public String toString() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String j =  "{" +
                "'itemId': " + itemId +
                ", 'name': '" + name + '\'' +
                ", 'brief': '" + brief + '\'' +
                ", 'comment': '" + comment + '\'' +
                ", 'date': '" + simpleDateFormat.format(date)+ '\'' +
                ", 'rate':" + rate +
                ", 'price': " + price +
                ", 'developer': " + developer.toString() +
                ", 'publisher': " + publisher.toString() +
                ", 'tag': " + tag.toString() +
                '}';
        return JSONObject.parse(j).toJSONString();
    }
}
