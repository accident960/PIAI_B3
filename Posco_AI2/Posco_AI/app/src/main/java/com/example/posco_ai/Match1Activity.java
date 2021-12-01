package com.example.posco_ai;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageButton;

import androidx.appcompat.app.AppCompatActivity;

import java.io.DataOutputStream;
import java.net.Socket;

public class Match1Activity extends AppCompatActivity {
    ImageButton back_mode1, click_search, match_1, match_2, match_3, match_4;
    EditText search_id;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_match1);  // activity_mode.xml로 연결해라

        back_mode1 = findViewById(R.id.back_mode1);
        click_search = findViewById(R.id.click_search);
        match_1 = findViewById(R.id.match_1);
        match_2 = findViewById(R.id.match_2);
        match_3 = findViewById(R.id.match_3);
        match_4 = findViewById(R.id.match_4);

        search_id = findViewById(R.id.search_id);

        // back_mode1 버튼 클릭 시 취할 액션 지정: Mode로 이동
        back_mode1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), ModeActivity.class); // 현 activity, 이동할 activity
                startActivity(intent); // activity 이동 구문
                finish();
            }
        });

        /*수정 필요*/
        // click_search 버튼 클릭 시 취할 액션 지정: Mode로 이동
        click_search.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Match1Activity.this, ModeActivity.class); // 현 activity, 이동할 activity
                startActivity(intent); // activity 이동 구문
            }
        });

        // match_1 버튼 클릭 시 취할 액션 지정: Match2로 이동
        match_1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Thread thread = new Thread(new Runnable() {
                    @Override
                    public void run() {
                        try  {
                            Socket socket = new Socket("141.223.140.1",8094);
                            DataOutputStream DOS = new
                                    DataOutputStream(socket.getOutputStream());
                            DOS.writeUTF("match_1_btn");
                            socket.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                });
                thread.start();
                Intent intent = new Intent(getApplicationContext(), Match2Activity.class); // 현 activity, 이동할 activity

                startActivity(intent); // activity 이동 구문
                finish();
            }
        });

        // match_2 버튼 클릭 시 취할 액션 지정: Match2로 이동
        match_2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), Match2Activity.class); // 현 activity, 이동할 activity

                startActivity(intent); // activity 이동 구문
                finish();
            }
        });

        // match_3 버튼 클릭 시 취할 액션 지정: Match2로 이동
        match_3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), Match2Activity.class); // 현 activity, 이동할 activity

                startActivity(intent); // activity 이동 구문
                finish();
            }
        });

        // match_4 버튼 클릭 시 취할 액션 지정: Match2로 이동
        match_4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), Match2Activity.class); // 현 activity, 이동할 activity

                startActivity(intent); // activity 이동 구문
                finish();
            }
        });
    }
}