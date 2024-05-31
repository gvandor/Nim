# Importálás: Az osproc modul az, ami lehetővé teszi külső programok futtatását Nim-ben. Az sequtils modul pedig hasznos funkciókat tartalmaz a szekvenciák kezelésére.
# Programok listája: A let kulcsszóval definiáljuk az állandó programok listáját.
# Nem telepített programok listája: A var kulcsszóval egy üres szekvenciát hozunk létre, amelyhez később hozzáadjuk a nem telepített programokat.
# Programok telepítése: Végigmegyünk a programok listáján, és minden egyes programot megpróbálunk telepíteni az execCmdEx függvénnyel. Ha a parancs kilépési kódja nem 0 (ami hibát jelez), akkor egy OSError kivételt dobunk.
# Kivétel kezelése: Ha OSError kivételt kapunk, akkor a programot hozzáadjuk a nem telepített programok listájához.
# Nem telepített programok kiírása: Végül kiírjuk a nem telepített programokat.
import osproc, sequtils
# A megadott programok listája
let programs = ["plank", "gvfs", "thunderbird", "ufw", "neofetch", "guake", "thunar", "rednotebook", "gnome-disk-utility", "gparted", "htop", "lm_sensors", "wget", "discord", "audacity", "audacious", "keepassxc", "doublecmd-gtk2", "gimp", "vlc", "firefox", "gedit", "ark", "libreoffice-still", "libreoffice-still-hu", "brasero", "calibre", "transmission-gtk", "uget", "gnome-notes", "clipgrab", "avidemux-qt", "scribus", "librecad", "kicad", "kicad-library", "kicad-library-3d", "simple-scan", "gthumb", "okular", "pacman-contrib", "onboard", "adobe-source-sans-pro-fonts", "cantarell-fonts", "noto-fonts", "ttf-bitstream-vera", "tf-dejavu", "ttf-droid", "ttf-hack", "ttf-inconsolata", "ttf-liberation", "ttf-roboto", "ttf-ubuntu-font-family", "tamsyn-font", "noto-fonts-emoji", "unace", "unrar", "zip", "unzip", "sharutils", "arj", "cabextract", "file-roller", "cups", "cups-pdf", "ghostscript", "gsfonts", "gutenprint", "gtk3-print-backends", "libcups", "hplip", "system-config-printer", "pulseaudio", "pulseaudio-alsa", "pavucontrol", "alsa-utils", "alsa-plugins", "alsa-lib", "alsa-firmware", "gstreamer", "gst-plugins-good", "gst-plugins-bad", "gst-plugins-base", "gst-plugins-ugly", "volumeicon", "playerctl", "android-file-transfer", "code", "pychess", "gnome-chess", "nemo", "git", "evince", "galculator", "calibre", "gedit", "micro"]
# A nem telepített programok listája
var notInstalledPrograms: seq[string] = @[]
# A programok telepítése
for program in programs:
  echo "Telepítés: ", program
  try:
    let result = execCmdEx("sudo pacman -S --needed --noconfirm " & program)
    if result.exitCode != 0:
      raise newException(OSError, "Command failed")
  except OSError:
    # nem települt programok lista létrehoz
    notInstalledPrograms.add(program)

# A nem telepített programok listájának kiírása
echo "A következő programok nem települtek sikeresen:"
for program in notInstalledPrograms:
  echo program
