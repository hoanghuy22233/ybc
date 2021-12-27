package vn.ybc

import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.os.Bundle
import android.util.Base64
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import java.security.MessageDigest
import java.security.NoSuchAlgorithmException


class MainActivity : FlutterActivity() {
    private val CHANNEL = "flutter.key_hash"


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if(call.method == "getKeyHash"){
                val greetings: String = printKeyHash()
                result.success(greetings)
            }
        }
    }

    private fun printKeyHash(): String {
        var keyhash = "";
        val info: PackageInfo
        try {
            info = packageManager.getPackageInfo("vn.ybc", PackageManager.GET_SIGNATURES)
            for (signature in info.signatures) {
                var md: MessageDigest = MessageDigest.getInstance("SHA")
                md.update(signature.toByteArray())
                val something = String(Base64.encode(md.digest(), 0))
                //String something = new String(Base64.encodeBytes(md.digest()));
                Log.i("hash key", something)
                keyhash = something
            }

        } catch (e1: PackageManager.NameNotFoundException) {
            Log.i("name not found", e1.toString())
        } catch (e: NoSuchAlgorithmException) {
            Log.i("no such an algorithm", e.toString())
        } catch (e: Exception) {
            Log.i("exception", e.toString())
        }
        return keyhash;
    }

}
