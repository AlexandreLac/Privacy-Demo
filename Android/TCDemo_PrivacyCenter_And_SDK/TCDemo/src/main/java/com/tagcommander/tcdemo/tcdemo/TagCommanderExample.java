package com.tagcommander.tcdemo.tcdemo;

import android.content.Context;
import android.util.Log;

import com.tagcommander.lib.TCAppVars;
import com.tagcommander.lib.TagCommander;
import com.tagcommander.lib.core.TCDebug;
import com.tagcommander.lib.privacy.TCPrivacy;
import com.tagcommander.lib.privacy.TCPrivacyCallbacks;

import java.util.Map;

public class TagCommanderExample implements TCPrivacyCallbacks
{
    private static TagCommanderExample sharedTagCommanderExample;
    private TagCommander TC;

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
        if (TC == null)
        {
            int TC_SITE_ID = 3311; // defines this site account ID
            int TC_CONTAINER_ID = 7; // defines this container ID
            int TC_PRIVACY_ID = 3; // defines this container ID

            /*
             * debug is also recommended during test as it prints information
             * that helps figuring out what is working and what is not
             */
            TCDebug.setDebugLevel(Log.VERBOSE);
            TCDebug.setNotificationLog(true);

            TC = new TagCommander(TC_SITE_ID, TC_CONTAINER_ID, context);

            TCPrivacy.getInstance().registerCallback(this);
            TCPrivacy.getInstance().setSiteIDPrivacyIDAppContextTCInstance(TC_SITE_ID, TC_PRIVACY_ID, context, TC);
        }
    }

    /**
     * Build a screen name in the right format for the vendor.
     */
    public static String buildPageName(String chapter, String subChapter, String page, String click)
    {
        if (chapter == null)
        {
            chapter = "";
        }

        if (subChapter == null)
        {
            subChapter = "";
        }

        if (page == null)
        {
            page = "";
        }

        if (click != null && !click.isEmpty())
        {
            click = "--" + click;
        }

        return chapter + "::" + subChapter + "::" + page + click;
    }

    /**
     * SendPageEvent is your classic send Hit event.
     * It will allow the tag with the condition #EVENT# equal to "page" to launch
     *
     * Sending a hit that the user arrived on the page named "pageName"
     *
     * What we do is that we simply tells TagCommander what are the values of the desired parameters
     * so that it can forward them properly to your solutions.
     *
     * In addition to all the parameters you will give to the SDK, a list of parameters are
     * always computed by the SDK and sent automatically alongside your data.
     * This list can be found here :
     * https://github.com/TagCommander/Android/blob/master/TCSDK/PredefinedVariables.md
     */
    public void SendPageEvent(String pageName, String restaurant, String rating)
    {
        // /!\ This method is tagged using the 4.+ ways of tagging, with addData.
        TC.addData("#EVENT#", "screen");
        TC.addData("#USER_ID#", "3444433");
        TC.addData("#PAGE_NAME#", pageName);
        TC.addData("#c_pagename#", pageName);

        if (restaurant != null && !restaurant.isEmpty())
        {
            TC.addData("#RESTAURANT_NAME#", restaurant);
        }

        if (rating != null && !rating.isEmpty())
        {
            TC.addData("#RATING#", rating);
        }

        TC.sendData();
    }

    /**
     * SendEventClick is your classic click action.
     * It will allow the tag with the condition #EVENT# equal to "click" to launch
     *
     * Sending a click that the user arrived on the page named "pageName"
     */
    public void SendClickEvent(String pageName, String clickType)
    {
        /**
         * /!\ This method is tagged using the 3.x ways of tagging
         * It is still working, but we recommend using the one described in SendPageEvent just above.
         */
        TCAppVars appVars = new TCAppVars();
        appVars.put("#EVENT#", "click");

        appVars.put("#CLIC_TYPE#", clickType);
        appVars.put("#PAGE_NAME#", pageName);

        TC.execute(appVars);
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
