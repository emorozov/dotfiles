set history save on
set history filename ~/.gdb_history

python
from gdbqt import register_qt_printers
register_qt_printers(None)
end
