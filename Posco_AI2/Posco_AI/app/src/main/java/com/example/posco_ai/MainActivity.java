package com.example.posco_ai;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageButton;

//@
import android.util.Log;
import android.os.AsyncTask;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;


public class MainActivity extends AppCompatActivity {
    ImageButton btn_login;

    private static int BUF_SIZE = 100;
    private DataInputStream dataInput;
    private String input_message;
    public static final String SERVER_IP = "141.223.140.25";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        btn_login = (ImageButton) findViewById(R.id.btn_login);

        // 버튼 클릭 시 취할 액션 지정
        btn_login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Thread thread = new Thread(new Runnable() {
                    @Override
                    public void run() {
                        try  {
                            Socket socket = new Socket(SERVER_IP,7556);
                            DataOutputStream DOS = new
                                    DataOutputStream(socket.getOutputStream());
                            DataInputStream DIS = new
                                    DataInputStream(socket.getInputStream());
                            DOS.writeUTF("login_btn");

                            byte[] buf = new byte[BUF_SIZE];
                            int read_Byte = DIS.read(buf);
                            input_message = new String(buf, 0, read_Byte);
                            Log.w("서버에서 받아온 값 ",""+input_message);
                            socket.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                });

                thread.start();
                // 서버에서 사용자 인식 결과 확인 후 mode화면으로, 인식못하면 안넘어가
                Intent intent = new Intent(getApplicationContext(), ModeActivity.class); // 현 activity, 이동할 activity
                startActivity(intent); // activity 이동 구문 data도 전달 시, startActivityForResult
                finish();
            }
        });
    }




}