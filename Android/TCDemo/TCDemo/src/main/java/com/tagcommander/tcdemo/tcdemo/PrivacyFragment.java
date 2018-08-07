package com.tagcommander.tcdemo.tcdemo;

import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ToggleButton;

import com.tagcommander.lib.privacy.TCPrivacy;

import java.util.HashMap;
import java.util.Map;

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
        TCPrivacy.getInstance().viewConsent();
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
                if (this.togglePrivacy.isChecked())
                {
                    Map<String, String> consent = new HashMap<>();
                    consent.put("PRIVACY_CAT_1", "1");
                    consent.put("PRIVACY_CAT_2", "1");
                    TCPrivacy.getInstance().saveConsent(consent);
                }
                else
                {
                    Map<String, String> consent = new HashMap<>();
                    consent.put("PRIVACY_CAT_1", "0");
                    consent.put("PRIVACY_CAT_2", "0");
                    TCPrivacy.getInstance().saveConsent(consent);
                }
                break;
        }
    }
}
