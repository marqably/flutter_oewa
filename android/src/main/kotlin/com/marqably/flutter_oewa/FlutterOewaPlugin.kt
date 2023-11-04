package com.marqably.flutter_oewa

import android.util.Log
import androidx.annotation.NonNull
import com.marqably.flutter_oewa.EventHelper.getIOLEventFromString
import de.infonline.lib.IOLEvent
import de.infonline.lib.IOLSession
import de.infonline.lib.IOLSessionPrivacySetting
import de.infonline.lib.IOLSessionType
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FlutterOewaPlugin */
class FlutterOewaPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel : MethodChannel

  /// A helper to be able to access the application context more easily
  private lateinit var flutterPluginBinding: FlutterPlugin.FlutterPluginBinding

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_oewa")
    channel.setMethodCallHandler(this)

    this.flutterPluginBinding = flutterPluginBinding
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    // initIOLSession
    if (call.method == "initIOLSession") {
      val offerIdentifier = call.argument<String>("offerIdentifier")
      val debugMode = if (call.argument<Boolean>("debugMode") == true) BuildConfig.DEBUG else false

      if (offerIdentifier != null) {
        result.success(initIOLSession(offerIdentifier, debugMode))
      } else {
        Log.e("Flutter OEWA", "No offer identifier provided. Cannot start a session without it!")
      }
    }
    // startSession
    else if (call.method == "startSession") {
      result.success(startSession())
    }
    // terminateSession
    else if (call.method == "terminateSession") {
      result.success(terminateSession())
    }
    // sendLoggedEvents
    else if (call.method == "sendLoggedEvents") {
      result.success(sendLoggedEvents())
    }
    // setDebugModeEnabled
    else if (call.method == "setDebugModeEnabled") {
      val enable = call.argument<Boolean>("enable") ?: false
      result.success(setDebugModeEnabled(enable))
    }
    // logEvent
    else if (call.method == "logEvent") {
      val identifier = call.argument<String>("identifier")
      val state = call.argument<String>("state")
      val category = call.argument<String>("category")
      val comment = call.argument<String>("comment")
      val customParams = call.argument<Map<String?, String?>>("customParams")

      if (identifier != null) {
        result.success(logEvent(identifier, state, category, comment, customParams))
      }
    // otherwise -> throw error
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }



  /* #########################################
     #########################################
                    SDK Methods
     #########################################
     ######################################### */



  /**
   * Initializes the OEWA SDK with the given offer identifier.
   **/
  private fun initIOLSession(@NonNull offerIdentifier: String, debugMode: Boolean): String {
    IOLSession.setDebugModeEnabled(true);

    IOLSession.getSessionForType(IOLSessionType.OEWA) // Session Type OEWA
      .initIOLSession(flutterPluginBinding.applicationContext,
        offerIdentifier,
        debugMode,
        IOLSessionPrivacySetting.LIN); // Debug modePrivacy Setting on/off

    return "true";
  }

  /**
   * Starts a session to track and send events to the OEWA server.
   **/
  private fun startSession(): String {
    IOLSession.getSessionForType(IOLSessionType.OEWA).startSession();
    return "true";
  }

  /**
   * The IOLib controls sending of the measurement data independently and entirely transparently. sendLoggedEvents may be accessed to force sending of the data. The IOLib then attempts to send the measured data immediately or to resend it, as soon as a data connection has been established.
   **/
  private fun sendLoggedEvents(): String {
    IOLSession.getSessionForType(IOLSessionType.OEWA).sendLoggedEvents();
    return "true";
  }

  /**
   * The measurement library can be put into debug mode. Various outputs in the log flow are generated here (errors, warnings, information, events and requests).
   **/
  private fun setDebugModeEnabled(enable: Boolean): String {
    IOLSession.setDebugModeEnabled(enable);
    return "true";
  }

  /**
   * Terminates a session and stops tracking and sending events to the OEWA server.
   **/
  private fun terminateSession(): String {
    IOLSession.getSessionForType(IOLSessionType.OEWA).terminateSession();
    return "true";
  }

  /** Logs/Tracks a user event
  * This is the most important method in this package, because this allows us to set up the tracking and analyse user actions.
  **/
  private fun logEvent(identifier: String, state: String?, category: String?, comment: String?, customParams: Map<String?, String?>?): String {
    // generate event object
    val eventInstance: IOLEvent? = getIOLEventFromString(
      "$identifier.$state",
      category,
      comment,
      customParams,
    )

    // log event
    if (eventInstance != null) {
      IOLSession.getSessionForType(IOLSessionType.OEWA).logEvent(eventInstance);
    } else {
      // otherwise just return nothing (logging of the problem will be done in getIOLEventFromString anyway)
      return "";
    }

    return "true";
  }
}
