package com.example.posco_ai;

import android.content.Intent;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import android.widget.Chronometer;
import android.widget.ImageButton;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.net.Socket;

public class Match2Activity extends AppCompatActivity implements View.OnClickListener {
    ImageButton back_match1, btn_reset, btn_stop, btn_pause;
    //private TextView mTimeTextView, mRecordTextView;
    //private Thread timeThread = null;
    //private Boolean isRunning = true;
    private Chronometer mChronometer;
    private long pauseOffset;
    private boolean running;

    private static int BUF_SIZE = 100;
    private DataInputStream dataInput;
    private String input_message;
    private static int i = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_match2);  // activity_match2.xml로 연결해라

        back_match1 = findViewById(R.id.back_match1);
        btn_reset = findViewById(R.id.btn_reset);
        btn_stop = findViewById(R.id.btn_stop);
        btn_pause = findViewById(R.id.btn_pause);

        mChronometer = (Chronometer) findViewById(R.id.timeText);
        btn_reset = (ImageButton) findViewById(R.id.btn_reset);
        btn_stop = (ImageButton) findViewById(R.id.btn_stop);
        //mRecordBtn = (Button) findViewById(R.id.btn_record);
        btn_pause = (ImageButton) findViewById(R.id.btn_pause);
        //mTimeTextView = (TextView) findViewById(R.id.timeText);
        //mRecordTextView = (TextView) findViewById(R.id.recordView);

        btn_reset.setOnClickListener(this);
        btn_stop.setOnClickListener(this);
        btn_pause.setOnClickListener(this);

        mChronometer.start();
        running = true;

        Thread thread = new Thread(new Runnable() {
            @Override
            public void run() {
                try  {
                    Socket socket = new Socket("141.223.140.1",8094);
                    DataInputStream DIS = new
                            DataInputStream(socket.getInputStream());

                    while ( i < 3) {
                        byte[] buf = new byte[BUF_SIZE];
                        int read_Byte = DIS.read(buf);
                        input_message = new String(buf, 0, read_Byte);
                        if (input_message == "pause"){
                            Log.w("서버에서 받아온 값 ",""+input_message);
                        } else if(input_message == "stop"){
                            Log.w("서버에서 받아온 값 ",""+input_message);
                        } else if(input_message == "cheer_up"){
                            Log.w("서버에서 받아온 값 ",""+input_message);
                        }
                        i += 1;
                    }

                    socket.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
        thread.start();



        /*
        while(true) {
            thread.start();
            if (input_message == "pause") {
                //media play
                mChronometer.stop();
                pauseOffset = SystemClock.elapsedRealtime() - mChronometer.getBase();
                running = false;
            } else if (input_message == 'stop') {
                //media play
                mChronometer.stop();
                running = false;
                Intent intent = new Intent(getApplicationContext(), Match3Activity.class); // 현 activity, 이동할 activity
                startActivity(intent); // activity 이동 구문
                finish();
                break;
                // 런닝닝
            }
            if (input_message == "cheer_up") {
                //media play
            }
        }
        */


       // back_match1 버튼 클릭 시 취할 액션 지정
        back_match1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), Match1Activity.class); // 현 activity, 이동할 activity
                startActivity(intent); // activity 이동 구문
                finish();
            }
        });
    }
// 목표 km 채우면 자동 종료 및 종료 음성
    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.btn_reset:
                if (!running) {
                    mChronometer.setBase(SystemClock.elapsedRealtime() - pauseOffset);
                    mChronometer.start();
                    running = true;

                } else {
                    mChronometer.setBase(SystemClock.elapsedRealtime());
                    mChronometer.start();
                }
                break;
            case R.id.btn_stop:
                mChronometer.stop();
                running = false;
                Intent intent = new Intent(getApplicationContext(), Match3Activity.class); // 현 activity, 이동할 activity
                startActivity(intent); // activity 이동 구문
                finish();
                break;
            case R.id.btn_pause:
                if (running) {
                    mChronometer.stop();
                    pauseOffset = SystemClock.elapsedRealtime() - mChronometer.getBase();
                    running = false;
                }
                break;
        }
    }
}