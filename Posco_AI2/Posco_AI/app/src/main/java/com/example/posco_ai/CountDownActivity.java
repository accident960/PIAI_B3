package com.example.posco_ai;

import androidx.appcompat.app.AppCompatActivity;


import android.annotation.SuppressLint;

import android.graphics.Color;
import android.os.Build;
import android.os.Handler;
import android.os.Message;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.View;
import android.widget.Chronometer;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;

public class CountDownActivity extends AppCompatActivity implements View.OnClickListener {

    private ImageButton mStartBtn, mStopBtn, mPauseBtn;
    private Chronometer mChronometer;
    private long pauseOffset;
    private boolean running;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_match2);
        mChronometer = (Chronometer) findViewById(R.id.timeText);
        mStartBtn = (ImageButton) findViewById(R.id.btn_reset);
        mStopBtn = (ImageButton) findViewById(R.id.btn_stop);
        //mRecordBtn = (Button) findViewById(R.id.btn_record);
        mPauseBtn = (ImageButton) findViewById(R.id.btn_pause);        //mRecordTextView = (TextView) findViewById(R.id.recordView);

        mStartBtn.setOnClickListener(this);
        mStopBtn.setOnClickListener(this);
        mPauseBtn.setOnClickListener(this);

    }
    @Override
    public void onClick(View v){

        switch (v.getId()){
            case R.id.btn_reset:
                if(!running){
                    mChronometer.setBase(SystemClock.elapsedRealtime() - pauseOffset);
                    mChronometer.start();
                    running = true;

                }
                else{
                mChronometer.setBase(SystemClock.elapsedRealtime());
                mChronometer.start();}
                break;
            case R.id.btn_stop:
                mChronometer.stop();
                running=false;
                break;
            case R.id.btn_pause:
                if(running){
                mChronometer.stop();
                pauseOffset = SystemClock.elapsedRealtime() - mChronometer.getBase();
                running=false;
                }
                break;

        }

    }

}

