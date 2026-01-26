{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnome-network-displays

    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav  # важно: кодеки из libav

    # VAAPI для аппаратного ускорения
    gst_all_1.gst-vaapi
    libva

    dbus

    # кодеки
    faac
    x264
    x265
    ffmpeg-full
    libavif
  ];

  services.gnome.gnome-remote-desktop.enable = true;
}
