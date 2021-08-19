package com.example.hybrid_view;

import android.content.Context;
import android.graphics.Color;
import android.graphics.Outline;
import android.graphics.Rect;
import android.os.Build;
import android.view.View;
import android.view.ViewOutlineProvider;
import android.widget.TextView;

import androidx.annotation.RequiresApi;

import java.util.Map;
import io.flutter.plugin.platform.PlatformView;

class NativeView implements PlatformView {
    private final TextView textView;

    @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
    NativeView(Context context, int id, Map<String, Object> creationParams) {
        textView = new TextView(context);
        textView.setTextSize(13);
        textView.setBackgroundColor(Color.GREEN);
        textView.setText("NativeView:" + id);
    }

    @Override
    public View getView() {
        return textView;
    }

    @Override
    public void dispose() {}
}
