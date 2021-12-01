package com.example.posco_ai;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageButton;

import androidx.appcompat.app.AppCompatActivity;

public class Record2Activity extends AppCompatActivity {
    ImageButton back_mode4, output_report;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_record2);  // activity_mode.xml로 연결해라

        back_mode4 = findViewById(R.id.back_mode4);
        output_report = findViewById(R.id.output_report);

        // 버튼 클릭 시 취할 액션 지정
        back_mode4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), ModeActivity.class); // 현 activity, 이동할 activity
                startActivity(intent); // activity 이동 구문
            }
        });

        // 버튼 클릭 시 취할 액션 지정
        output_report.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), MainActivity.class); // 현 activity, 이동할 activity
                startActivity(intent); // activity 이동 구문
            }
        });

    }
}