package com.tagcommander.tcdemo.tcdemo;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ToggleButton;

import com.tagcommander.lib.core.TCLogger;
import com.tagcommander.lib.privacy.TCPrivacyAPI;

public class PrivacyFragment extends Fragment implements View.OnClickListener
{
    ToggleButton togglePrivacy;

    public PrivacyFragment()
    {
        // Required empty public constructor
    }

    public static PrivacyFragment newInstance()
    {
        return new PrivacyFragment();
    }

    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
    {
        // Inflate the layout for this fragment
        View view = inflater.inflate(R.layout.fragment_privacy, container, false);
        this.togglePrivacy = view.findViewById(R.id.togglePrivacy);
        this.togglePrivacy.setOnClickListener(this);

        return view;
    }

    @Override
    public void onResume()
    {
        super.onResume();
    }

    @Override
    public void onAttach(Context context)
    {
        super.onAttach(context);
    }

    @Override
    public void onDetach()
    {
        super.onDetach();
    }

    @Override
    public void onClick(View view)
    {
        switch (view.getId())
        {
            case R.id.togglePrivacy:
                TCLogger.getInstance().logMessage("Is consent already given: " + TCPrivacyAPI.isConsentAlreadyGiven(getContext()), Log.ERROR);
                Intent PCM = new Intent(getContext(), com.tagcommander.lib.privacy.TCPrivacyCenter.class);
                startActivity(PCM);
                break;
        }
    }
}
