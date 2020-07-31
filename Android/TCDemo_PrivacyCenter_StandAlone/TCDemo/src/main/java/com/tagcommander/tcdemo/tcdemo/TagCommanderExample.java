package com.tagcommander.tcdemo.tcdemo;

import android.content.Context;
import android.util.Log;

import com.tagcommander.lib.core.TCDebug;
import com.tagcommander.lib.privacy.TCPrivacy;
import com.tagcommander.lib.privacy.TCPrivacyCallbacks;

import java.util.Map;

public class TagCommanderExample implements TCPrivacyCallbacks
{
    private static TagCommanderExample sharedTagCommanderExample;

    private TagCommanderExample()
    {
    }

    public static TagCommanderExample sharedTagManager()
    {
        if (sharedTagCommanderExample == null)
        {
            sharedTagCommanderExample = new TagCommanderExample();
        }
        return sharedTagCommanderExample;
    }

    /**
     * Init the Tag Commander instance for the whole application.
     * The sideID and containerID are the IDs of your ServerSide container on Commanders Act interface.
     * @param context the application context.
     */
    public void initTagcommander(Context context)
    {
        int TC_SITE_ID = 3311; // defines this site account ID
        int TC_PRIVACY_ID = 3; // defines this container ID

        /*
         * debug is also recommended during test as it prints information
         * that helps figuring out what is working and what is not
         */
        TCDebug.setDebugLevel(Log.VERBOSE);
        TCDebug.setNotificationLog(true);

        TCPrivacy.getInstance().registerCallback(this);
        TCPrivacy.getInstance().setSiteIDPrivacyIDAppContext(TC_SITE_ID, TC_PRIVACY_ID, context);
    }

    @Override
    public void consentUpdated(Map<String, String> map)
    {
        // Pass information to your other solutions from here.
        for (String key : map.keySet())
        {
            Log.e("TCDemo", key + " : " + map.get(key));
        }
    }

    @Override
    public void consentOutdated()
    {
        // Use this to know that it's time to display privacy center again.
    }

    @Override
    public void consentCategoryChanged()
    {

    }

    @Override
    public void significantChangesInPrivacy()
    {

    }
}
