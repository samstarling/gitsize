GIGA_SIZE = 1073741824.0
MEGA_SIZE = 1048576.0
KILO_SIZE = 1024.0

def readable_file_size(size, precision=1)
  case
  when size == 1
    "1 byte"
  when size < KILO_SIZE
    "%d bytes" % size
  when size < MEGA_SIZE
    "%.#{precision}f KB" % (size / KILO_SIZE)
  when size < GIGA_SIZE
    "%.#{precision}f MB" % (size / MEGA_SIZE)
  else 
    "%.#{precision}f GB" % (size / GIGA_SIZE)
  end
end
