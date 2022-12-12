package cc.lwaterlite.SteamDBApplication.Utils;

import java.util.Date;

public class Item {
    private int itemId;
    private Date itemLaunchDate;

    public void setItemLaunchDate(Date itemLaunchDate) {
        this.itemLaunchDate = itemLaunchDate;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getItemId() {
        return itemId;
    }

    public Date getItemLaunchDate() {
        return itemLaunchDate;
    }
}
