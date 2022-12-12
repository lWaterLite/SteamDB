package cc.lwaterlite.SteamDBApplication.QueryActionDao;

import java.util.Date;

public interface DaoImp {

    String queryNameByItemIdAndLanguageId(int itemId, int languageId);
    String queryCommentByItemIdAndLanguageId(int itemId, int languageId);
    Float queryRateByItemId(int itemId);
    Float queryPriceByItemIdAndLanguageId(int itemId, int languageId);
    Date queryDateByItemId(int itemId);

}
