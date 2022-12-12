package cc.lwaterlite.SteamDBApplication.QueryActionDao;

import cc.lwaterlite.SteamDBApplication.QueryActionDao.DetailItemObject.DetailItemObjectDao;
import cc.lwaterlite.SteamDBApplication.QueryActionDao.RowObject.RowObject;
import cc.lwaterlite.SteamDBApplication.QueryActionDao.RowObject.RowObjectDao;
import cc.lwaterlite.SteamDBApplication.QueryActionDao.DetailItemObject.DetailItemObject;

import cc.lwaterlite.SteamDBApplication.Utils.GeneralResponse;
import cc.lwaterlite.SteamDBApplication.Utils.Item;
import com.alibaba.fastjson2.JSONObject;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("QueryAction")
public class QueryActionDao {

    @Resource
    private RowObjectDao rowObjectDao;

    public GeneralResponse getGeneral(int languageId) {

        List<RowObject> rowObjects = new ArrayList<>();
        int exceptionCount = 0;

        List<Item> items = rowObjectDao.queryItemListFromItem();
        for (Item item: items) {

            try {
                int itemId = item.getItemId();
                String name = rowObjectDao.queryNameByItemIdAndLanguageId(itemId, languageId);
                Date itemLaunchDate = item.getItemLaunchDate();
                float rate = rowObjectDao.queryRateByItemId(itemId);
                String comment = rowObjectDao.queryCommentByItemIdAndLanguageId(itemId, languageId);
                float price = rowObjectDao.queryPriceByItemIdAndLanguageId(itemId, languageId);
                rowObjects.add(new RowObject(itemId, name, itemLaunchDate, comment, rate, price));
            } catch (Exception e){
                exceptionCount++;
            }
        }

        return new GeneralResponse(rowObjects, exceptionCount);
    }

    private RowObject getRowObjectByItemId(int itemId, int languageId) {
        String name = rowObjectDao.queryNameByItemIdAndLanguageId(itemId, languageId);
        Date date = rowObjectDao.queryDateByItemId(itemId);
        String comment = rowObjectDao.queryCommentByItemIdAndLanguageId(itemId, languageId);
        Float rate = rowObjectDao.queryRateByItemId(itemId);
        Float price = rowObjectDao.queryPriceByItemIdAndLanguageId(itemId, languageId);
        return new RowObject(itemId, name, date, comment, rate, price);
    }

    public GeneralResponse getRowObjectsByDeveloperId(int languageId, int developerId) throws SQLException {

        List<RowObject> rowObjects = new ArrayList<>();
        int exceptionCount = 0;

        List<Integer> itemIds = rowObjectDao.queryItemIdsBydDeveloperId(developerId);
        if (itemIds.isEmpty()) throw new SQLException("error with developer id");
        for (Integer itemId: itemIds) {
            try {
                rowObjects.add(getRowObjectByItemId(itemId, languageId));
            } catch (Exception e) {
                exceptionCount++;
            }
        }

        return new GeneralResponse(rowObjects, exceptionCount);
    }

    public GeneralResponse getRowObjectByPublisherId(int languageId, int publisherId) throws SQLException {

        List<RowObject> rowObjects = new ArrayList<>();
        int exceptionCount = 0;

        List<Integer> itemIds = rowObjectDao.queryItemIdsByPublisherId(publisherId);
        if (itemIds.isEmpty()) throw new SQLException("error with publisher id");
        for (Integer itemId: itemIds) {
            try {
                rowObjects.add(getRowObjectByItemId(itemId, languageId));
            } catch (Exception e) {
                exceptionCount++;
            }
        }

        return new GeneralResponse(rowObjects, exceptionCount);
    }

    public GeneralResponse getRowObjectByTagId(int languageId, int tagId) throws SQLException {

        List<RowObject> rowObjects = new ArrayList<>();
        int exceptionCount = 0;

        List<Integer> itemIds = rowObjectDao.queryItemIdsByTagId(tagId);
        if (itemIds.isEmpty()) throw new SQLException("error with tag id");
        for (Integer itemId: itemIds) {
            try {
                rowObjects.add(getRowObjectByItemId(itemId, languageId));
            } catch (Exception e) {
                exceptionCount++;
            }
        }

        return new GeneralResponse(rowObjects, exceptionCount);
    }

    public String getTagByTagId(int languageId, int tagId) {
        return rowObjectDao.queryTagByLanguageIdAndTagId(languageId, tagId);
    }

    @Resource
    private DetailItemObjectDao detailItemObjectDao;

    public DetailItemObject getDetailItem(int itemId, int languageId) {
        String name = detailItemObjectDao.queryNameByItemIdAndLanguageId(itemId, languageId);
        String brief = detailItemObjectDao.queryBriefByItemIdAndLanguageId(itemId, languageId);
        String comment = detailItemObjectDao.queryCommentByItemIdAndLanguageId(itemId, languageId);
        Date date = detailItemObjectDao.queryDateByItemId(itemId);
        Float rate = detailItemObjectDao.queryRateByItemId(itemId);
        Float price = detailItemObjectDao.queryPriceByItemIdAndLanguageId(itemId, languageId);
        List<JSONObject> developer = detailItemObjectDao.queryDevelopersByItemId(itemId);
        List<JSONObject> publisher = detailItemObjectDao.queryPublisherByItemId(itemId);
        List<JSONObject> tag = detailItemObjectDao.queryTagByItemId(itemId);

        return new DetailItemObject(itemId, name, brief, comment, date, rate, price, developer, publisher, tag);
    }

}
