package com.tagcommander.tcdemo.tcdemo;

import android.content.Context;
import android.util.Log;

import com.iab.gdpr_android.consent.VendorConsent;
import com.iab.gdpr_android.consent.implementation.v1.VendorConsentBuilder;
import com.iab.gdpr_android.consent.range.RangeEntry;
import com.iab.gdpr_android.consent.range.SingleRangeEntry;
import com.iab.gdpr_android.consent.range.StartEndRangeEntry;
import com.tagcommander.lib.TagCommander;
import com.tagcommander.lib.core.TCDebug;
import com.tagcommander.lib.privacy.TCPrivacy;
import com.iab.gdpr_android.consent.VendorConsent;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class TagCommanderExample
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
            int TC_CONTAINER_ID = 2; // defines this container ID

            /*
             * debug is also recommended during test as it prints information
             * that helps figuring out what is working and what is not
             */
            TCDebug.setDebugLevel(Log.VERBOSE);
            TCDebug.setNotificationLog(true);
            TC = new TagCommander(TC_SITE_ID, TC_CONTAINER_ID, context);

//            if (TCPermissions.checkForPermission(context, Manifest.permission.ACCESS_FINE_LOCATION))
//            {
//                TCLocation.getInstance(context);
//            }

            TC.addPermanentData("MY_ID", "12345");
            TCPrivacy.getInstance().setSiteIDPrivacyIDAppContextAndTCInstance(TC_SITE_ID, 3, context, TC);
            TCPrivacy.getInstance().setUserID("12345");

            final List<RangeEntry> rangeEntries = Arrays.asList(
                    new SingleRangeEntry(1),
                    new StartEndRangeEntry(100,400)
            );

            // https://github.com/InteractiveAdvertisingBureau/GDPR-Transparency-and-Consent-Framework/blob/master/Consent%20string%20and%20vendor%20list%20formats%20v1.1%20Final.md#example-vendor-consent-string-
            VendorConsent vendorConsent = new VendorConsentBuilder()
                    //ok
                    .withConsentRecordCreatedOn(new Date(System.currentTimeMillis()))
                    .withConsentRecordLastUpdatedOn(new Date(System.currentTimeMillis()))
                    .withCmpID(90)
                    .withCmpVersion(1)
                    //Defines the Screen number in the CMP where consent was given. The screen number is CMP and CmpVersion specific, and is for logging proof of consent
                    .withConsentScreenID(1)
                    .withConsentLanguage("FR")
                    .withDefaultConsent(false)
                    // https://vendorlist.consensu.org/vendorlist.json current : 123
                    .withVendorListVersion(123)

                    // NOK
                    .withMaxVendorId(999)
                    .withVendorEncodingType(1)
                    .withRangeEntries(rangeEntries)

                    .build();

            // IABConsent_CMPPresent
            // IABConsent_SubjectToGDPR
            // IABConsent_ConsentString
            // IABConsent_ParsedPurposeConsents
            // IABConsent_ParsedVendorConsents

            Log.e("JIBA", "consent String: " + vendorConsent.toString());
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
    }

    /**
     * SendEventClick is your classic click action.
     * It will allow the tag with the condition #EVENT# equal to "click" to launch
     *
     * Sending a click that the user arrived on the page named "pageName"
     */
    public void SendClickEvent(String pageName, String clickType)
    {
    }
}
