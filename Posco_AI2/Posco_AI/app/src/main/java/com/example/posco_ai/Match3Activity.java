package com.example.posco_ai;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageButton;

import androidx.appcompat.app.AppCompatActivity;

public class Match3Activity extends AppCompatActivity {
    ImageButton back_mode2, back_main2;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_match3);  // activity_match1.xml로 연결해라

        back_mode2 = findViewById(R.id.back_mode2);
        back_main2 = findViewById(R.id.back_main2);

        // back_mode2 버튼 클릭 시 취할 액션 지정
        back_mode2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), ModeActivity.class); // 현 activity, 이동할 activity
                startActivity(intent); // activity 이동 구문
            }
        });

        // back_main2 버튼 클릭 시 취할 액션 지정
        back_main2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), ModeActivity.class); // 현 activity, 이동할 activity
                startActivity(intent); // activity 이동 구문
            }
        });

    }
}