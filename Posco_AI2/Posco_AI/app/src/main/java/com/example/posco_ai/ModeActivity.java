package com.example.posco_ai;

import android.content.Intent;
import android.content.res.AssetFileDescriptor;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.Environment;
import android.service.autofill.FieldClassification;
import android.util.Log;
import android.view.View;
import android.widget.ImageButton;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;

public class ModeActivity extends AppCompatActivity {
    ImageButton click_match, click_record, back_main3;
    //MediaPlayer mediaPlayer;
    private static String btn_match_value = "mode_match";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_mode);  // activity_mode.xml로 연결해라

        back_main3 = findViewById(R.id.back_main3);
        click_match = findViewById(R.id.click_match);
        click_record = findViewById(R.id.click_record);
        //mediaPlayer= MediaPlayer.create(ModeActivity.this, R.raw.test_mp3);


        // back_main3 버튼 클릭 시 취할 액션 지정
        back_main3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), MainActivity.class); // 현 activity, 이동할 activity
                startActivity(intent); // activity 이동 구문
                finish();
            }
        });

        // click_match 버튼 클릭 시 취할 액션 지정
        click_match.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Thread thread = new Thread(new Runnable() {
                    @Override
                    public void run() {
                        try  {
                            Socket socket = new Socket("141.223.140.1",8094);
                            DataOutputStream DOS = new
                                    DataOutputStream(socket.getOutputStream());
                            DOS.writeUTF("match_btn");
                            socket.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                });
                thread.start();

                Intent intent = new Intent(getApplicationContext(), Match1Activity.class); // 현 activity, 이동할 activity
                startActivity(intent); // activity 이동 구문
                finish();
                //mediaPlayer.start();
            }
        });

        // click_record 버튼 클릭 시 취할 액션 지정
        click_record.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Thread thread = new Thread(new Runnable() {
                    @Override
                    public void run() {
                        try  {
                            Socket socket = new Socket("141.223.140.1",8080);
                            DataOutputStream DOS = new
                                    DataOutputStream(socket.getOutputStream());
                            DOS.writeUTF("record_btn");
                            socket.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                });
                thread.start();
                Intent intent = new Intent(getApplicationContext(), Record1Activity.class); // 현 activity, 이동할 activity
                startActivity(intent); // activity 이동 구문
                finish();
                //mediaPlayer.release();
            }
        });
    }
}
    // 액티비티가 소멸되기 전에 호출 - 액티비티가 받출는 마지막 호
//    public void onDestroy(){
//        super.onDestroy();
//        if(mediaPlayer != null){
//            mediaPlayer.release();
//            mediaPlayer = null;
//        }
//    }
//}