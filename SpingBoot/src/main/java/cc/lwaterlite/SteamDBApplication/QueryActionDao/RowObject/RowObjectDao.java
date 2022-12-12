package cc.lwaterlite.SteamDBApplication.QueryActionDao.RowObject;

import cc.lwaterlite.SteamDBApplication.QueryActionDao.DaoImp;
import cc.lwaterlite.SteamDBApplication.Utils.Item;
import jakarta.annotation.Resource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("RowObjectDao")
public class RowObjectDao implements DaoImp {

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

    public List<Item> queryItemListFromItem() {
        String sql = "SELECT * FROM item";
        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            Item item = new Item();
            item.setItemId(rs.getInt("item_id"));
            item.setItemLaunchDate(rs.getDate("item_launch_date"));
            return item;
        });
    }

    public List<Integer> queryItemIdsBydDeveloperId(int developerId) {
        String sql = "SELECT item_id FROM item_developer WHERE developer_id = ?";
        return jdbcTemplate.query(sql, (rs, i) -> rs.getInt("item_id"), developerId);
    }

    public List<Integer> queryItemIdsByPublisherId(int publisherId) {
        String sql = "SELECT item_id FROM item_publisher WHERE publisher_id = ?";
        return jdbcTemplate.query(sql, (rs, i) -> rs.getInt("item_id"), publisherId);
    }

    public List<Integer> queryItemIdsByTagId(int tagId) {
        String sql = "SELECT item_id FROM item_tag WHERE tag_id = ?";
        return jdbcTemplate.query(sql, (rs, i) -> rs.getInt("item_id"), tagId);
    }

    public String queryTagByLanguageIdAndTagId(int languageId, int tagId) {
        String sql = "SELECT tag FROM tag_language WHERE tag_id = ? AND language_id = ?";
        return jdbcTemplate.queryForObject(sql, String.class, languageId, tagId);
    }

}
