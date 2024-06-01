# Bash parancs behívása:
echo "ez most kurva sokáig fog tartani, menj el moziba addig."
import osproc, strutils
discard execCmd("sudo fstrim -v /")
echo "root kész"
discard execCmd("sudo fstrim -v /home")
echo "home kész"
discard execCmd("sudo fstrim -v /home/$USER/Adat")
echo "kész vagyok, kéne egy kis pálinka."
