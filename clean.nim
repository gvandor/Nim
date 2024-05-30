# Bash parancs behívása:
import osproc, strutils
echo "Tudni akarod, mennyi a tárhely? Megmutatom."
discard execCmd("df -h")
# függvény létrehozása:
proc clean() =
  echo "Akarod, hogy takarítsak kicsit? Ha igen akkor adj egy karaktert + enter, ha nem akkor csak enter"
# c változó definiálása:
  let c = readLine(stdin)
  if c.len > 0:
    discard execCmd("sudo pacman -Sc --noconfirm")
  else:
    echo "Rendben akkor most nem."
clean()
