package com.example.posco_ai;

import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.View;
import android.widget.Chronometer;
import android.widget.ImageButton;

import androidx.appcompat.app.AppCompatActivity;

public class Record1Activity extends AppCompatActivity{
    ImageButton back_mode3, btn_reset, btn_pause, btn_stop;
    private Chronometer mChronometer;
    private long pauseOffset;
    private boolean running = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_record1);  // activity_mode.xml로 연결해라

        back_mode3 = findViewById(R.id.back_mode3);
        btn_reset = findViewById(R.id.btn_reset);
        btn_stop = findViewById(R.id.btn_stop);
        btn_pause = findViewById(R.id.btn_pause);
        mChronometer = (Chronometer) findViewById(R.id.timeText);
        mChronometer.start();
        running = true;

        // 종료하기
        btn_stop.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                mChronometer.stop();
                running = false;

                Intent intent = new Intent(getApplicationContext(), Record2Activity.class); // 현 activity, 이동할 activity
                startActivity(intent); // activity 이동 구문
                finish();
            }
         });

        // 재생/일시재생
        btn_pause.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (running) {
                    mChronometer.stop();
                    pauseOffset = SystemClock.elapsedRealtime() - mChronometer.getBase();
                    running = false;
                }
            }
        });

        // back_mode3 버튼 클릭 시 취할 액션 지정
        back_mode3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), ModeActivity.class); // 현 activity, 이동할 activity
                startActivity(intent); // activity 이동 구문
                finish();
            }
        });

        // btn_reset 버튼 클릭 시 취할 액션 지정
        btn_reset.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (!running) {
                    mChronometer.setBase(SystemClock.elapsedRealtime() - pauseOffset);
                    mChronometer.start();
                    running = true;

                } else {
                    mChronometer.setBase(SystemClock.elapsedRealtime());
                    mChronometer.start();
                }
            }
        });
    }
}