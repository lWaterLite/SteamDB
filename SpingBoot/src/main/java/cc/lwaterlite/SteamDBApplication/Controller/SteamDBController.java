package cc.lwaterlite.SteamDBApplication.Controller;

import cc.lwaterlite.SteamDBApplication.QueryActionDao.LanguageIdDao;
import cc.lwaterlite.SteamDBApplication.QueryActionDao.DetailItemObject.DetailItemObject;
import cc.lwaterlite.SteamDBApplication.QueryActionDao.QueryActionDao;
import cc.lwaterlite.SteamDBApplication.Utils.GeneralResponse;
import jakarta.annotation.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.SQLException;

@RestController
@RequestMapping("/api/{language}")
public class SteamDBController {

    @Resource
    private QueryActionDao queryActionDao;
    @Resource
    private LanguageIdDao languageIdDao;


    /**
     * This api is to get general items for main page.
     *
     * @param language the requested language code.
     * @return response with Content-Type of application/json, see more in api docs.
     */
    @RequestMapping("/general")
    public ResponseEntity<Object> getGeneral(@PathVariable String language) {

        int languageId;
        GeneralResponse generalResponse;

        try {
            languageId = languageIdDao.getLanguageId(language);
        }catch (Exception e) {
            return ResponseEntity.status(500).contentType(MediaType.TEXT_PLAIN).body("error with language code\n" + e);
        }

        generalResponse = queryActionDao.getGeneral(languageId);

        return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON).body(generalResponse.toString());
    }

    /**
     * This api is to get single item details by id.
     *
     * @param itemId the requested item id.
     * @param language the requested language code.
     * @return response with Content-Type of application/json, see more in api docs.
     */
    @RequestMapping("/item/{itemId}")
    public ResponseEntity<Object> getDetailItem(@PathVariable int itemId, @PathVariable String language) {

        int languageId;
        DetailItemObject detailItemObject;

        try {
            languageId = languageIdDao.getLanguageId(language);
        } catch (Exception e) {
            return ResponseEntity.status(500).contentType(MediaType.TEXT_PLAIN).body("error with language code\n" + e);
        }

        try {
            detailItemObject = queryActionDao.getDetailItem(itemId, languageId);
        } catch (Exception e) {
            return ResponseEntity.status(500).contentType(MediaType.TEXT_PLAIN).body(e);
        }

        return ResponseEntity
            .status(HttpStatus.OK)
            .contentType(MediaType.APPLICATION_JSON)
            .body(detailItemObject.toString());
    }

    /**
     * This api is to get items with specific developer.
     *
     * @param language the requested language code.
     * @param developerId the requested developer id.
     * @return response with Content-Type of application/json, see more in api docs.
     */
    @RequestMapping("/developer/{developerId}")
    public ResponseEntity<Object> getItemsByDeveloperId(@PathVariable String language, @PathVariable int developerId) {

        int languageId;
        GeneralResponse generalResponse;

        try {
            languageId = languageIdDao.getLanguageId(language);
        } catch (Exception e) {
            return ResponseEntity.status(500).contentType(MediaType.TEXT_PLAIN).body("error with language code\n" + e);
        }

        try {
            generalResponse = queryActionDao.getRowObjectsByDeveloperId(languageId, developerId);
        } catch (SQLException e) {
            return ResponseEntity
                .status(500)
                .contentType(MediaType.TEXT_PLAIN)
                .body(e.toString());
        }

        return ResponseEntity
            .status(HttpStatus.OK)
            .contentType(MediaType.APPLICATION_JSON)
            .body(generalResponse.toString());
    }

    /**
     * This api is to get items with specific publisher.
     *
     * @param language the requested language code.
     * @param publisherId the requested publisher id.
     * @return response with Content-Type of application/json, see more in api docs.
     */
    @RequestMapping("/publisher/{publisherId}")
    public ResponseEntity<Object> getItemsByPublisherId(@PathVariable String language, @PathVariable int publisherId) {

        int languageId;
        GeneralResponse generalResponse;

        try {
            languageId = languageIdDao.getLanguageId(language);
        } catch (Exception e) {
            return ResponseEntity.status(500).contentType(MediaType.TEXT_PLAIN).body("error with language code\n" + e);
        }

        try {
            generalResponse = queryActionDao.getRowObjectByPublisherId(languageId, publisherId);
        } catch (SQLException e) {
            return ResponseEntity
                .status(500)
                .contentType(MediaType.TEXT_PLAIN)
                .body(e.toString());
        }

        return ResponseEntity
            .status(HttpStatus.OK)
            .contentType(MediaType.APPLICATION_JSON)
            .body(generalResponse.toString());
    }

    /**
     * This api is to get items with specific tag.
     *
     * @param language the requested language code.
     * @param tagId the requested tag id.
     * @return response with Content-Type of application/json, see more in api docs.
     */
    @RequestMapping("/tag/{tagId}")
    public ResponseEntity<Object> getItemsByTagId(@PathVariable String language, @PathVariable int tagId) {

        int languageId;
        GeneralResponse generalResponse;

        try {
            languageId = languageIdDao.getLanguageId(language);
        } catch (Exception e) {
            return ResponseEntity
                .status(500)
                .contentType(MediaType.TEXT_PLAIN)
                .body("error with language code");
        }

        try {
            generalResponse = queryActionDao.getRowObjectByTagId(languageId, tagId);
        } catch (SQLException e) {
            return ResponseEntity
                .status(500)
                .contentType(MediaType.TEXT_PLAIN)
                .body(e.toString());
        }

        return ResponseEntity
            .status(HttpStatus.OK)
            .contentType(MediaType.APPLICATION_JSON)
            .body(generalResponse.toString());
    }

    /**
     * This api it to get specific tag by language and tag id.
     *
     * @param language the requested language code.
     * @param tagId the requested tag id.
     * @return response with Content-Type of application/json, see more in api docs.
     */
    @RequestMapping("/content/tag/{tagId}")
    public ResponseEntity<Object> getTagByTagId(@PathVariable String language, @PathVariable int tagId) {

        int languageId;
        String tag;

        try {
            languageId = languageIdDao.getLanguageId(language);
        } catch (Exception e) {
            return ResponseEntity
                .status(500)
                .contentType(MediaType.TEXT_PLAIN)
                .body("error with language code");
        }

        try {
            tag = queryActionDao.getTagByTagId(languageId,tagId);
        } catch (Exception e) {
            return ResponseEntity
                .status(500)
                .contentType(MediaType.TEXT_PLAIN)
                .body("error with tag id");
        }

        return ResponseEntity
            .status(HttpStatus.OK)
            .contentType(MediaType.APPLICATION_JSON)
            .body(tag);
    }

}