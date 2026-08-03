#!/usr/bin/env python3

import sys
from mutagen.mp4 import MP4, MP4Cover

m4a_file = sys.argv[1]
cover_file = sys.argv[2]

audio = MP4(m4a_file)

with open(cover_file, "rb") as f:
    cover = MP4Cover(
        f.read(),
        imageformat=MP4Cover.FORMAT_JPEG
    )

audio["covr"] = [cover]
audio.save()
