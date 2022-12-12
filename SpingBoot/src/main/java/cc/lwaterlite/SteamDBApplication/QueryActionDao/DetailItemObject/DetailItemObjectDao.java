package cc.lwaterlite.SteamDBApplication.QueryActionDao.DetailItemObject;

import cc.lwaterlite.SteamDBApplication.QueryActionDao.DaoImp;
import com.alibaba.fastjson2.JSONObject;
import jakarta.annotation.Resource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("DetailItemObjectDao")
public class DetailItemObjectDao implements DaoImp {

    @Resource
    private JdbcTemplate jdbcTemplate;

    @Override
    public String queryNameByItemIdAndLanguageId(int itemId, int languageId) {
        String sql = "SELECT name FROM item_name_brief WHERE item_id = ? AND language_id = ?";
        return jdbcTemplate.queryForObject(sql, String.class, itemId, languageId);
    }
    @Override
    public String queryCommentByItemIdAndLanguageId(int itemId, int languageId) {
        String sql = "SELECT comment_id FROM item_comment WHERE item_id = ?";
        Integer commentId = jdbcTemplate.queryForObject(sql, Integer.class, itemId);
        sql = "SELECT comment FROM comment_language WHERE comment_id = ? AND language_id = ?";
        return jdbcTemplate.queryForObject(sql, String.class, commentId, languageId);
    }

    @Override
    public Float queryRateByItemId(int itemId) {
        String sql = "SELECT rate FROM item_comment WHERE item_id = ?";
        return jdbcTemplate.queryForObject(sql, Float.class, itemId);
    }

    @Override
    public Float queryPriceByItemIdAndLanguageId(int itemId, int languageId) {
        String sql = "SELECT currency_id FROM currency_language WHERE language_id = ?";
        Integer currencyId = this.jdbcTemplate.queryForObject(sql, Integer.class, languageId);
        sql = "SELECT price FROM item_price WHERE item_id = ? AND currency_id = ?";
        return this.jdbcTemplate.queryForObject(sql, Float.class, itemId, currencyId);
    }

    @Override
    public Date queryDateByItemId(int itemId) {
        String sql = "SELECT item_launch_date FROM item WHERE item_id = ?";
        return jdbcTemplate.queryForObject(sql, Date.class, itemId);
    }

    public String queryBriefByItemIdAndLanguageId(int itemId, int languageId) {
        String sql = "SELECT brief FROM item_name_brief WHERE item_id = ? AND language_id = ?";
        return jdbcTemplate.queryForObject(sql, String.class, itemId, languageId);
    }

    public List<JSONObject> queryDevelopersByItemId(int itemId) {
        String sql = "SELECT developer_id FROM item_developer WHERE item_id = ?";
        List<Integer> developerIds = jdbcTemplate.query(sql,
                (resultSet, i) -> resultSet.getInt("developer_id"), itemId);
        List<JSONObject> jsonObjectList = new ArrayList<>();
        for (Integer developerId: developerIds) {
            sql = "SELECT developer FROM developer WHERE developer_id = ?";
            jsonObjectList.add(JSONObject.parse(
                    "{'" + developerId.toString() + "'" +
                            ": " +
                            "'" + this.jdbcTemplate.queryForObject(sql, String.class, developerId) + "'}"
            ));
        }

        return jsonObjectList;
    }

    public List<JSONObject> queryPublisherByItemId(int itemId) {
        String sql = "SELECT publisher_id FROM item_publisher WHERE item_id = ?";
        List<Integer> publisherIds = jdbcTemplate.query(sql,
                (resultSet, i) -> resultSet.getInt("publisher_id"), itemId);
        List<JSONObject> jsonObjectList = new ArrayList<>();
        for (Integer publisherId: publisherIds) {
            sql = "SELECT publisher FROM publisher WHERE publisher_id = ?";
            jsonObjectList.add(
                JSONObject.parse(
                    "{'" + publisherId.toString() + "'" +
                        ": " +
                        "'" + this.jdbcTemplate.queryForObject(sql, String.class, publisherId) + "'}"
                ));
        }

        return jsonObjectList;
    }

    public List<JSONObject> queryTagByItemId(int itemId) {
        String sql = "SELECT tag_id FROM item_tag WHERE item_id = ?";
        List<Integer> tagIds = jdbcTemplate.query(sql,
            (resultSet, i) -> resultSet.getInt("tag_id"), itemId);
        List<JSONObject> jsonObjectList = new ArrayList<>();
        for (Integer tagId: tagIds) {
            sql = "SELECT tag FROM tag WHERE tag_id = ?";
            jsonObjectList.add(
                JSONObject.parse(
                    "{'" + tagId.toString() + "'" +
                        ": " +
                        "'" + this.jdbcTemplate.queryForObject(sql, String.class, tagId) + "'}"
                ));
        }

        return jsonObjectList;
    }

}
