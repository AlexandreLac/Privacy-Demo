package com.tagcommander.tcdemo.tcdemo;

import android.Manifest;
import android.app.ActionBar;
import android.app.FragmentTransaction;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v4.app.ActivityCompat;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.view.Menu;

import com.tagcommander.lib.core.TCPermissions;

/*
 * The purpose of TCDemo is to show you how to tag easily an Android application
 *
 * The first thing we need to do is initialize the TagCommander's SDK
 * this is done in the onCreate here with initTagCommander which contain further explanations
 *
 * Then you need to create the function that will give your tags the
 * necessary parameters to send the HITs properly
 * Some example of those function can be found in TagManager.java
 *
 * Those functions will be called throughout your application when needed
 * Again this application was design to show common usage
 * so you will find some of those functions called in TCDemo
 */
public class MainActivity extends FragmentActivity implements ActionBar.TabListener
{
    SectionsPagerAdapter mSectionsPagerAdapter;
    ViewPager mViewPager;
    Double latitude = 0.0;
    Double longitude = 0.0;
    static final int LOCATION_PERMISSION = 1;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        /**
         * Init the Tag Module first thing in your application.
         */
        TagCommanderExample.sharedTagManager().initTagcommander(this.getApplicationContext());

        // Set up the action bar.
        final ActionBar actionBar = getActionBar();
        actionBar.setNavigationMode(ActionBar.NAVIGATION_MODE_TABS);

        // Create the adapter that will return a fragment for each of the three
        // primary sections of the app.
        mSectionsPagerAdapter = new SectionsPagerAdapter(getSupportFragmentManager());

        // Set up the ViewPager with the sections adapter.
        mViewPager = findViewById(R.id.pager);
        mViewPager.setAdapter(mSectionsPagerAdapter);

        // When swiping between different sections, select the corresponding
        // tab. We can also use ActionBar.Tab#select() to do this if we have
        // a reference to the Tab.
        mViewPager.setOnPageChangeListener(new ViewPager.SimpleOnPageChangeListener()
        {
            @Override
            public void onPageSelected(int position)
            {
                actionBar.setSelectedNavigationItem(position);
            }
        });

        ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.ACCESS_COARSE_LOCATION}, LOCATION_PERMISSION);

        // For each of the sections in the app, add a tab to the action bar.
        for (int i = 0; i < mSectionsPagerAdapter.getCount(); ++i)
        {
            // Create a tab with text corresponding to the page title defined by
            // the adapter. Also specify this Activity object, which implements
            // the TabListener interface, as the callback (listener) for when
            // this tab is selected.
            actionBar.addTab(actionBar.newTab().setText(mSectionsPagerAdapter.getPageTitle(i)).setTabListener(this));
        }

        TagCommanderExample.sharedTagManager().SendClickEvent(
                TagCommanderExample.buildPageName("App_event", "", "", "Opening_app"),
                "click"
        );
    }

    @Override
    protected void onDestroy()
    {
        TagCommanderExample.sharedTagManager().SendClickEvent(TagCommanderExample.buildPageName("App_event", "", "", "Closing_app"), "click");
        super.onDestroy();
    }

    @Override
    protected void onStart()
    {
        super.onStart();
    }

    @Override
    public void onTabSelected(ActionBar.Tab tab, FragmentTransaction fragmentTransaction)
    {
        /*
		 * Here we are getting the page name we want to send to the hit
		 */
        TagCommanderExample.sharedTagManager().SendClickEvent(
                TagCommanderExample.buildPageName("Menu", "", "", tab.getText().toString()),
                "click"
        );

        mViewPager.setCurrentItem(tab.getPosition());
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu)
    {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    @Override
    public void finishActivity(int requestCode)
    {
        super.finishActivity(requestCode);
    }

    @Override
    public void onTabUnselected(ActionBar.Tab tab, FragmentTransaction fragmentTransaction)
    {
    }

    @Override
    public void onTabReselected(ActionBar.Tab tab, FragmentTransaction fragmentTransaction)
    {
    }

    /**
     * A {@link FragmentPagerAdapter} that returns a fragment corresponding to
     * one of the sections/tabs/pages.
     */
    public class SectionsPagerAdapter extends FragmentPagerAdapter
    {
        public SectionsPagerAdapter(FragmentManager fm) { super(fm); }

        @Override
        public Fragment getItem(int position)
        {
            // getItem is called to instantiate the fragment for the given page.
            Fragment fragment;
            if (position == 0)
            {
                fragment = new RestaurantListFragment();
            }
            else if (position == 1)
            {
                fragment = new MapFragment();
            }
            else
            {
                fragment = new PrivacyFragment();
            }

            return fragment;
        }

        @Override
        public int getCount() { return 3; }

        @Override
        public CharSequence getPageTitle(int position)
        {
            switch (position)
            {
                case 0:
                    return getString(R.string.title_restaurant_list);
                case 1:
                    return getString(R.string.title_map);
                case 2:
                    return getString(R.string.title_privacy);
            }
            return null;
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String permissions[], @NonNull int[] grantResults)
    {
        switch (requestCode)
        {
            case LOCATION_PERMISSION:
            {
                // If request is cancelled, the result arrays are empty.
                if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED)
                {
                }
            }
        }
    }
}