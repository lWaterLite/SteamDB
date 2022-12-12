package cc.lwaterlite.SteamDBApplication.QueryActionDao;

import jakarta.annotation.Resource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service("LanguageResponse")
public class LanguageIdDao {

    @Resource
    private JdbcTemplate jdbcTemplate;

    public Integer getLanguageId(String language) {
        String sql = "SELECT language_id FROM language WHERE language = ?";
        return this.jdbcTemplate.queryForObject(sql, Integer.class, language);
    }

}
